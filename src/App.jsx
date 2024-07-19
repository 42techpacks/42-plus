import { useState } from "react";
import reactLogo from "./assets/react.svg";
import viteLogo from "/vite.svg";
import "./App.css";

/* Component Imports */
import Card from "./components/card";
import TopBar from "./components/topbar";
import FeaturedProduct from "./components/featured-product";
import ScrollingBar from "./components/scrolling-bar";
import FAQs from "./components/faqs";

function App() {
  const [count, setCount] = useState(0);

  return (
    <>
      <TopBar></TopBar>
      <div className="main">
        <FeaturedProduct></FeaturedProduct>
        {/* <ScrollingBar message={"WELCOME TO 42+"}></ScrollingBar> */}
        <p className="read-the-docs">Developed by TECHPACK</p>
        <FAQs></FAQs>
      </div>
    </>
  );
}

export default App;
