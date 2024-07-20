import { createContext } from "react";
import "./App.css";
import { useSession } from "./hooks/use-session";
import PropTypes from "prop-types";
import { createBrowserRouter, RouterProvider, Outlet } from "react-router-dom";

/* Component Imports */
import TopBar from "./components/topbar";
import FeaturedProduct from "./components/featured-product";
import ScrollingBar from "./components/scrolling-bar";
import FAQs from "./components/faqs";
import Button from "./components/button";
import LoginForm from "./components/login-form";

const router = createBrowserRouter([
  {
    path: "/",
    element: <Layout />,
    children: [
      {
        path: "",
        element: <Home />,
      },
      {
        path: "welcome",
        //TODO: change this, shouldn't be login form
        element: <LoginForm />,
        // loader: welcomeLoader,
      },
    ],
  },
]);

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
  return <RouterProvider router={router} />;
}

export default App;

export const UserContext = createContext({
  session: null,
  profile: null,
});

function Layout() {
  const fortytwoUserInfo = useSession();
  return (
    <>
      <UserContext.Provider value={fortytwoUserInfo}>
        <TopBar />
        <Outlet />
        {/* TODO: This should be a footer component? */}
        <p className="read-the-docs">Developed by TECHPACK</p>
      </UserContext.Provider>
    </>
  );
}
