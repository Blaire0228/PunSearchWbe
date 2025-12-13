import React, { useState, useContext } from 'react';
import { useNavigate } from 'react-router-dom';
import { AuthContext } from '../App';

const LoginPage = () => {
  const navigate = useNavigate();
  const { login } = useContext(AuthContext);

  const [memberName, setMemberName] = useState('');
  const [password, setPassword] = useState('');
  const [loading, setLoading] = useState(false);

  const handleLogin = async (e) => {
    e.preventDefault();

    if (!memberName || !password) {
      alert('請輸入帳號與密碼');
      return;
    }

    try {
      setLoading(true);

      const res = await fetch('http://localhost:8080/members/login', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          memberName,
          password,
        }),
      });

      if (!res.ok) {
        const text = await res.text();
        alert(text || '登入失敗，請確認帳號與密碼');
        return;
      }

      const data = await res.json();
      // 假設後端回傳 { memberId, memberName }
      login(data.memberId);
      navigate('/search');
    } catch (err) {
      console.error(err);
      alert('無法連線到伺服器，請確認後端有啟動');
    } finally {
      setLoading(false);
    }
  };

  return (
      <div className="flex justify-center items-center min-h-screen bg-[#F5F5F5] p-4">
        <div className="flex w-full max-w-4xl h-[500px] shadow-2xl rounded-2xl overflow-hidden bg-white">

          {/* 左側：還沒帳號？去註冊 (深色區塊) */}
          <div className="bg-[#D09E86] w-1/2 hidden md:flex flex-col justify-center items-center text-white p-10 space-y-6">
            <h2 className="text-3xl font-bold">還沒有帳號嗎？</h2>
            <button
                onClick={() => navigate('/signup')}
                className="border-2 border-white px-8 py-2 rounded-full hover:bg-white/20 transition font-bold"
            >
              註冊
            </button>
          </div>

          {/* 右側：登入表單 (淺色區塊) */}
          <div className="bg-[#FDFBF6] w-full md:w-1/2 flex flex-col justify-center items-center p-8 md:p-10">
            <h2 className="text-3xl font-bold mb-8 text-gray-700">歡迎</h2>
            <form className="w-full max-w-xs space-y-4" onSubmit={handleLogin}>
              <input
                  type="text"
                  placeholder="帳號"
                  className="w-full p-3 rounded-md bg-[#E5E5E5] focus:outline-none focus:ring-2 focus:ring-[#F58F58]"
                  value={memberName}
                  onChange={(e) => setMemberName(e.target.value)}
              />
              <input
                  type="password"
                  placeholder="密碼"
                  className="w-full p-3 rounded-md bg-[#E5E5E5] focus:outline-none focus:ring-2 focus:ring-[#F58F58]"
                  value={password}
                  onChange={(e) => setPassword(e.target.value)}
              />

              <div className="flex justify-center items-center text-sm text-gray-500 mt-2">
                <button
                    type="submit"
                    disabled={loading}
                    className="bg-[#F58F58] text-white px-8 py-2 rounded-full font-bold shadow-md hover:opacity-90 transition disabled:opacity-60 disabled:cursor-not-allowed"
                >
                  {loading ? '登入中...' : '登入'}
                </button>
              </div>
            </form>

            {/* 手機版顯示的註冊連結 */}
            <div className="mt-8 md:hidden text-sm text-gray-500">
              還沒有帳號？{' '}
              <button
                  onClick={() => navigate('/signup')}
                  className="text-[#F58F58] font-bold"
              >
                去註冊
              </button>
            </div>
          </div>
        </div>
      </div>
  );
};

export default LoginPage;
