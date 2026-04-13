import React from 'react';
import { Outlet } from 'react-router-dom';
import './styles/app.css';

/**
 * App shell — renders the active route via <Outlet />.
 * Routes are defined in main.jsx.
 */
export default function App() {
  return <Outlet />;
}
