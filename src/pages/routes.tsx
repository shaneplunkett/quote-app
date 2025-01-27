import { createBrowserRouter } from "react-router-dom";

import Main from "./Main";
import LoginPage from "./LoginPage";
import NotFound from "./NotFound";

export const router = createBrowserRouter([
  {
    path: "/",
    element: <Main />,
    errorElement: <NotFound />,
  },
  {
    path: "/auth",
    element: <LoginPage />,
  },
]);
