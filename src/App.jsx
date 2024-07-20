import { createContext } from "react";
import "./App.css";
import { useSession } from "./hooks/use-session";
import PropTypes from "prop-types";

/* Component Imports */
import TopBar from "./components/topbar";
import FeaturedProduct from "./components/featured-product";
import ScrollingBar from "./components/scrolling-bar";
import FAQs from "./components/faqs";
import Button from "./components/button";

export const UserContext = createContext({
  session: null,
  profile: null,
});

function Layout({ children }) {
  const fortytwoUserInfo = useSession();
  return (
    <>
      <UserContext.Provider value={fortytwoUserInfo}>
        <TopBar authenticated={false} user={"npcmilo"}></TopBar>
        <div className="main">{children}</div>
        <p className="read-the-docs">Developed by TECHPACK</p>
      </UserContext.Provider>
    </>
  );
}
Layout.propTypes = {
  children: PropTypes.node.isRequired,
};

function LoginForm() {
  return <>LoginForm</>;
}

function RegisterForm() {
  return <>RegisterForm</>;
}

function Home() {
  return (
    <>
      <FeaturedProduct></FeaturedProduct>
      <ScrollingBar message={"WELCOME TO 42+"}></ScrollingBar>
      <Button
        span={"NEW TO 42+?"}
        label={"LEARN MORE"}
        style={"window-black"}
      ></Button>
      <FAQs></FAQs>
    </>
  );
}

function App() {
  return (
    <>
      <Layout>
        <RegisterForm />
      </Layout>
    </>
  );
}

export default App;
