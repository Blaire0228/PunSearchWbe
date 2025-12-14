import React, { useState, createContext, useMemo }  from 'react';
import { BrowserRouter as Router, Routes, Route, Navigate } from 'react-router-dom';
import HomePage from './pages/HomePage';
import LoginPage from './pages/LoginPage';
import SignupPage from './pages/SignupPage';
import DetailPage from './pages/DetailPage';
import MyPunPage from './pages/MyPunPage';

export const AuthContext = createContext({
  isLoggedIn: false,
  memberId: null,
  login: () => {},
  logout: () => {},
});

function App() {
  const [isLoggedIn, setIsLoggedIn] = useState(
    () => localStorage.getItem('isLoggedIn') === 'true'
  );
  const [memberId, setMemberId] = useState(
    () => parseInt(localStorage.getItem('memberId')) || null
  );

  const authContextValue = useMemo(() => ({
    isLoggedIn,
    memberId,
    login: (id) => {
      setIsLoggedIn(true);
      setMemberId(id);
      localStorage.setItem('isLoggedIn', 'true');
      localStorage.setItem('memberId', id.toString());
    },
    logout: () => {
      setIsLoggedIn(false);
      setMemberId(null);
      localStorage.removeItem('isLoggedIn');
      localStorage.removeItem('memberId');
    },
  }), [isLoggedIn, memberId]);

  const ProtectedRoute = ({ children }) => {
    const isLoggedIn = localStorage.getItem('isLoggedIn') === 'true';
    return isLoggedIn ? children : <Navigate to="/login" replace />;
  };

  const RootRedirect = () => {
    const isLoggedIn = localStorage.getItem('isLoggedIn') === 'true';
    return isLoggedIn
      ? <Navigate to="/search" replace />
      : <Navigate to="/login" replace />;
  };


  return (
    <AuthContext.Provider value={authContextValue}>
      <Router>
        <Routes>
          <Route path="/" element={<RootRedirect />} />
          {/* 未登入 */}
          <Route path="/login" element={<LoginPage />} />
          <Route path="/signup" element={<SignupPage />} />
          {/* 已登入 */}
          <Route
            path="/search"
            element={
              <ProtectedRoute>
                <HomePage />
              </ProtectedRoute>
            }
          />

          <Route
            path="/detail/:punId"
            element={
              <ProtectedRoute>
                <DetailPage />
              </ProtectedRoute>
            }
          />

          <Route
            path="/mypun"
            element={
              <ProtectedRoute>
                <MyPunPage />
              </ProtectedRoute>
            }
          />

          <Route path="*" element={<Navigate to="/" replace />} />
        </Routes>
      </Router>
    </AuthContext.Provider>
  );
}


export default App;