import { createBrowserRouter } from "react-router-dom";

import LoginPage from "./LoginPage";
import NotFound from "./NotFound";

export const router = createBrowserRouter([
  {
    path: "/",
    element: <LoginPage />,
    errorElement: <NotFound />,
  },
]);
