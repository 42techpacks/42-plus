import { useContext } from "react";
import { UserContext } from "../App";
import Button from "./button";
import FAQs from "./faqs";
import FeaturedProduct from "./featured-product";
import LoginRegister from "./login-register";
import ScrollingBar from "./scrolling-bar";

export default function Home() {
  const userProfile = useContext(UserContext);
  return (
    <>
      {userProfile.session ? (
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
      ) : (
        <LoginRegister toggle={"login"} />
      )}
    </>
  );
}
