import { createContext } from "react";
import { Outlet, RouterProvider, createBrowserRouter } from "react-router-dom";
import "./App.css";
import { useSession } from "./hooks/use-session";
import posthog from "posthog-js";

/* Component Imports */
import Footer from "./components/footer";
import Home from "./components/home";
import TopBar from "./components/topbar";

posthog.init(import.meta.env.VITE_POSTHOG_API_KEY, {
  api_host: "https://us.i.posthog.com",
  person_profiles: "identified_only", // or 'always' to create profiles for anonymous users as well
});

const router = createBrowserRouter([
  {
    path: "/",
    element: <Layout />,
    children: [
      {
        path: "",
        element: <Home />,
      },
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
