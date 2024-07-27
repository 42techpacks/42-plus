import { useContext } from "react";
import { UserContext } from "../App";
import LoginRegisterNew from "./login-register-new";

import BetaMiniSite from "./beta-mini-site";
import "./home.css";

export default function Home() {
  const userProfile = useContext(UserContext);
  return (
    <>
      {userProfile.profile ? (
        <div className="home">
          <BetaMiniSite />
        </div>
      ) : (
        <LoginRegisterNew />
      )}
    </>
  );
}
