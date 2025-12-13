import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';

const SignupPage = () => {
    const navigate = useNavigate();

    // 加上 state
    const [memberName, setMemberName] = useState('');
    const [password, setPassword] = useState('');
    const [confirmPassword, setConfirmPassword] = useState('');
    const [loading, setLoading] = useState(false);

    const handleSignup = async (e) => {
        e.preventDefault();

        // 前端先檢查一次
        if (!memberName || !password || !confirmPassword) {
            alert('請把帳號與密碼填好');
            return;
        }

        if (password !== confirmPassword) {
            alert('兩次密碼不一致');
            return;
        }

        try {
            setLoading(true);

            const res = await fetch('http://localhost:8080/members/register', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    memberName,
                    password,
                    confirmPassword,
                }),
            });

            const text = await res.text(); // 後端回傳的是純文字訊息

            if (res.ok) {
                alert(text || '註冊成功！');
                navigate('/login'); // 成功後導去登入頁
            } else {
                alert(text || '註冊失敗，請再試一次');
            }
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

                {/* 左側：註冊表單 (深色區塊) */}
                <div className="bg-[#D09E86] w-full md:w-1/2 flex flex-col justify-center items-center p-8 md:p-10 relative">
                    <h2 className="text-3xl font-bold text-white mb-6">歡迎</h2>

                    <form className="w-full max-w-xs space-y-4" onSubmit={handleSignup}>
                        <input
                            type="text"
                            placeholder="帳號"
                            className="w-full p-3 rounded-md bg-white/30 placeholder-white/70 text-white focus:outline-none border border-white/40 focus:bg-white/40 transition"
                            value={memberName}
                            onChange={(e) => setMemberName(e.target.value)}
                        />

                        <input
                            type="password"
                            placeholder="密碼"
                            className="w-full p-3 rounded-md bg-white/30 placeholder-white/70 text-white focus:outline-none border border-white/40 focus:bg-white/40 transition"
                            value={password}
                            onChange={(e) => setPassword(e.target.value)}
                        />

                        <input
                            type="password"
                            placeholder="確認密碼"
                            className="w-full p-3 rounded-md bg-white/30 placeholder-white/70 text-white focus:outline-none border border-white/40 focus:bg-white/40 transition"
                            value={confirmPassword}
                            onChange={(e) => setConfirmPassword(e.target.value)}
                        />

                        <div className="flex justify-center mt-6">
                            <button
                                type="submit"
                                disabled={loading}
                                className="border-2 border-white text-white px-10 py-2 rounded-full font-bold hover:bg-white/20 transition disabled:opacity-60 disabled:cursor-not-allowed"
                            >
                                {loading ? '註冊中...' : '註冊'}
                            </button>
                        </div>
                    </form>

                    {/* 手機版顯示的登入連結 */}
                    <div className="mt-6 md:hidden text-sm text-white/80">
                        已經有帳號？{' '}
                        <button
                            onClick={() => navigate('/login')}
                            className="font-bold underline"
                        >
                            去登入
                        </button>
                    </div>
                </div>

                {/* 右側：已有帳號？去登入 (淺色區塊) */}
                <div className="bg-[#FDFBF6] w-1/2 hidden md:flex flex-col justify-center items-center text-gray-700 p-10 space-y-6">
                    <h2 className="text-2xl font-bold">已經有帳號了嗎？</h2>
                    <button
                        onClick={() => navigate('/login')}
                        className="bg-[#F58F58] text-white px-10 py-2 rounded-full font-bold shadow-md hover:opacity-90 transition"
                    >
                        登入
                    </button>
                </div>
            </div>
        </div>
    );
};

export default SignupPage;
