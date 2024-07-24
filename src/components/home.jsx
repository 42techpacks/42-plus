import { useContext } from "react";
import { UserContext } from "../App";
import LoginRegisterNew from "./login-register-new";

import FootytwoMiniSite from "./footytwoMiniSite";
import "./home.css";

export default function Home() {
  const userProfile = useContext(UserContext);
  return (
    <>
      {userProfile.profile ? (
        <div className="home">
          <FootytwoMiniSite />
        </div>
      ) : (
        <LoginRegisterNew />
      )}
    </>
  );
}
