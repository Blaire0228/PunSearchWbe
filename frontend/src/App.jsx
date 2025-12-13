import React, { useState, createContext, useMemo }  from 'react';
import { BrowserRouter as Router, Routes, Route, Navigate } from 'react-router-dom';
import HomePage from './pages/HomePage';
import LoginPage from './pages/LoginPage';
import SignupPage from './pages/SignupPage';
import DetailPage from './pages/DetailPage';
import MyPunPage from './pages/MyPunPage';

// 3. 創建 AuthContext
export const AuthContext = createContext({
  isLoggedIn: false,
  memberId: null,
  login: () => {},
  logout: () => {},
});

function App() {
     // 4. 建立狀態來模擬登入狀態和使用者 ID
      // 初始值從 localStorage 讀取，以保持頁面刷新後的狀態
      const [isLoggedIn, setIsLoggedIn] = useState(() => localStorage.getItem('isLoggedIn') === 'true');
      const [memberId, setMemberId] = useState(() => parseInt(localStorage.getItem('memberId')) || null);

      // 5. 實作登入/登出函式
      const authContextValue = useMemo(() => ({
        isLoggedIn,
        memberId,
        // 模擬登入：將 ID 設為 1 (Admin) 並儲存
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

  return (
  <AuthContext.Provider value={authContextValue}>
    <Router>
      <Routes>
        <Route path="/" element={<HomePage />} />
        <Route path="/search" element={<HomePage />} />
        <Route path="/login" element={<LoginPage />} />
        <Route path="/signup" element={<SignupPage />} />
        <Route path="/detail/:id" element={<DetailPage />} />
        <Route path="/mypun" element={<MyPunPage />} />
        {/* 處理未知路徑，導回首頁或登入頁 */}
        <Route path="*" element={<Navigate to="/" replace />} />
      </Routes>
    </Router>
  </AuthContext.Provider>
  );
}

export default App;