import { useContext } from "react";
import { UserContext } from "../App";
import Button from "./button";
import FAQs from "./faqs";
import FeaturedProduct from "./featured-product";
import LoginRegisterNew from "./login-register-new";
import ScrollingBar from "./scrolling-bar";

export default function Home() {
  const userProfile = useContext(UserContext);
  return (
    <>
      {true ? (
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
        <LoginRegisterNew toggle={"login"} />
      )}
    </>
  );
}
