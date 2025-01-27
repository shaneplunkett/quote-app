import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import { createBrowserRouter, RouterProvider } from 'react-router-dom'
import { ApolloClient, InMemoryCache, ApolloProvider, gql } from '@apollo/client'
import LoginPage from './pages/LoginPage'
import NotFound from './pages/NotFound'
import './index.css'

const client = new ApolloClient({
    uri: import.meta.env.VITE_QUOTE_SERVER_ENDPOINT,
    cache: new InMemoryCache(),
})

const router = createBrowserRouter([{
    path: '/',
    element: <LoginPage />,
    errorElement: <NotFound />
}])

createRoot(document.getElementById('root')!).render(
    <ApolloProvider client={client}>
        <StrictMode>
            <RouterProvider router={router} />
        </StrictMode>
    </ApolloProvider>,
)
