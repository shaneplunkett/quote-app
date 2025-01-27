import { createBrowserRouter } from "react-router-dom";

import Home from "./Home";
import LoginPage from "./LoginPage";
import NotFound from "./NotFound";

export const router = createBrowserRouter([
  {
    path: "/",
    element: <Home />,
    errorElement: <NotFound />,
  },
  {
    path: "/auth",
    element: <LoginPage />,
  },
]);
