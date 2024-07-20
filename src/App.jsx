import { useState } from "react";
import "./App.css";

/* Component Imports */
import TopBar from "./components/topbar";
import FeaturedProduct from "./components/featured-product";
import ScrollingBar from "./components/scrolling-bar";
import FAQs from "./components/faqs";
import Button from "./components/button";

function Layout({ children }) {
  return (
    <>
      <TopBar authenticated={false} user={"npcmilo"}></TopBar>
      <div className="main">{children}</div>
      <p className="read-the-docs">Developed by TECHPACK</p>
    </>
  );
}

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
