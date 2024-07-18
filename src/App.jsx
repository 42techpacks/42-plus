import { useState, useEffect } from "react";
import { AuthProvider, useAuth } from "./contexts/AuthContext";
import { supabase } from "./supabaseClient";
import PropTypes from "prop-types";

function Countries({ children }) {
  const [countries, setCountries] = useState([]);

  useEffect(() => {
    getCountries();
  }, []);

  async function getCountries() {
    const { data } = await supabase.from("countries").select();
    setCountries(data);
  }

  return (
    <ul>
      {countries.map((country) => (
        <li key={country.name}>{country.name}</li>
      ))}
      {children}
    </ul>
  );
}

Countries.propTypes = {
  children: PropTypes.node,
};

function AuthForm() {
  const { user, signInWithOtp, signOut } = useAuth();
  const [phone, setPhone] = useState("");
  const [verificationCode, setVerificationCode] = useState("");
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);
  const [showVerification, setShowVerification] = useState(false);

  const handleSubmit = async (e) => {
    e.preventDefault();
    setLoading(true);
    setError(null);
    try {
      const { error } = await signInWithOtp({ phone });
      if (error) throw error;
      setShowVerification(true);
      alert("Check your phone for the verification code!");
    } catch (error) {
      setError(error.message);
    } finally {
      setLoading(false);
    }
  };

  const handleVerification = async (e) => {
    e.preventDefault();
    setLoading(true);
    setError(null);
    try {
      const { error } = await supabase.auth.verifyOtp({
        phone,
        token: verificationCode,
        type: "sms",
      });
      if (error) throw error;
      alert("Successfully verified!");
    } catch (error) {
      setError(error.message);
    } finally {
      setLoading(false);
    }
  };

  const handleSignOut = async () => {
    await signOut();
    setShowVerification(false);
    setPhone(""); // Clear the phone number
    setVerificationCode(""); // Clear the verification code
  };

  if (user) {
    return (
      <div>
        <p>User UID: {user.id}</p>
        <button onClick={handleSignOut}>Sign Out</button>
      </div>
    );
  }

  return (
    <div>
      {!showVerification ? (
        <form onSubmit={handleSubmit}>
          <input
            type="tel"
            value={phone}
            onChange={(e) => setPhone(e.target.value)}
            placeholder="Enter phone number"
            required
          />
          <button type="submit" disabled={loading}>
            {loading ? "Loading..." : "Sign In / Sign Up"}
          </button>
        </form>
      ) : (
        <form onSubmit={handleVerification}>
          <input
            type="text"
            value={verificationCode}
            onChange={(e) => setVerificationCode(e.target.value)}
            placeholder="Enter verification code"
            required
          />
          <button type="submit" disabled={loading}>
            {loading ? "Verifying..." : "Verify"}
          </button>
        </form>
      )}
      {error && <p style={{ color: "red" }}>{error}</p>}
    </div>
  );
}

function App() {
  return (
    <AuthProvider>
      <div>
        <AuthForm />
        <main>
          <h1>My Supabase + React App</h1>
          <Countries />
        </main>
      </div>
    </AuthProvider>
  );
}

export default App;
