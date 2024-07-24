import { createContext } from "react";
import { Outlet, RouterProvider, createBrowserRouter } from "react-router-dom";
import "./App.css";
import { useSession } from "./hooks/use-session";

/* Component Imports */
import Footer from "./components/footer";
import Home from "./components/home";
import LoginForm from "./components/login-form";
import LoginReigsterNew from "./components/login-register-new";
import { registerFormLoader } from "./components/register-form";
import TopBar from "./components/topbar";

const router = createBrowserRouter([
  {
    path: "/",
    element: <Layout />,
    children: [
      {
        path: "",
        element: <Home />,
      }
    ],
  },
]);

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
        <div className="main">
          <Outlet />
        </div>
        <Footer></Footer>
      </UserContext.Provider>
    </>
  );
}
