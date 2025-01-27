import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import { ApolloClient, InMemoryCache, ApolloProvider, gql } from '@apollo/client'
import './index.css'
import App from './App.tsx'

const client = new ApolloClient({
    uri: import.meta.env.VITE_QUOTE_SERVER_ENDPOINT,
    cache: new InMemoryCache(),
})

createRoot(document.getElementById('root')!).render(
    <ApolloProvider client={client}>
        <StrictMode>
            <App />
        </StrictMode>
    </ApolloProvider>,
)
