import { useState } from "react";
import "./App.css";

/* Component Imports */
import TopBar from "./components/topbar";
import FeaturedProduct from "./components/featured-product";
import ScrollingBar from "./components/scrolling-bar";
import FAQs from "./components/faqs";
import Button from "./components/button";

function App() {
  return (
    <>
      <TopBar></TopBar>
      <div className="main">
        <FeaturedProduct></FeaturedProduct>
        <ScrollingBar message={"WELCOME TO 42+"}></ScrollingBar>
        <Button
          span={"NEW TO 42+?"}
          label={"LEARN MORE"}
          style={"window-black"}
        ></Button>
        <FAQs></FAQs>
      </div>
      <p className="read-the-docs">Developed by TECHPACK</p>
    </>
  );
}

export default App;
