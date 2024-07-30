import { useContext } from "react";
import { UserContext } from "../App";
import LoginRegisterNew from "./login-register-new";

import BetaMiniSite from "./beta-mini-site";
import FootytwoMiniSite from "./footytwoMiniSite";
import "./home.css";
import CF42MiniSite from "./mini-sites/cf42/cf42-mini-site";

export default function Home() {
  const userProfile = useContext(UserContext);
  return (
    <>
      {userProfile.profile ? (
        <div className="home">
          <BetaMiniSite />
          {/* <CF42MiniSite /> */}
        </div>
      ) : (
        <LoginRegisterNew />
      )}
    </>
  );
}
