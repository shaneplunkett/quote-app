import { StrictMode } from "react";
import { createRoot } from "react-dom/client";
import { RouterProvider } from "react-router-dom";
import { ApolloClient, InMemoryCache, ApolloProvider } from "@apollo/client";
import { router } from "./pages/routes";
import "./index.css";

const client = new ApolloClient({
  uri: import.meta.env.VITE_QUOTE_SERVER_ENDPOINT,
  cache: new InMemoryCache(),
});

createRoot(document.getElementById("root")!).render(
  <ApolloProvider client={client}>
    <StrictMode>
      <RouterProvider router={router} />
    </StrictMode>
  </ApolloProvider>,
);
