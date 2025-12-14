import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { Search, Filter } from 'lucide-react';
import Layout from '../components/Layout';
import PunCard from '../components/PunCard';

const HomePage = () => {
  const navigate = useNavigate();

  // 狀態管理
  const [puns, setPuns] = useState([]);
  const [allTags, setAllTags] = useState([]);
  const [selectedTagIds, setSelectedTagIds] = useState([]);
  const [showTagFilter, setShowTagFilter] = useState(false);

  const [loading, setLoading] = useState(true);
  const [searchTerm, setSearchTerm] = useState("");

  // 1. 初始載入：抓諧音梗以及標籤清單
  useEffect(() => {
    fetchPuns();
    fetchTags();
  }, []);

  const fetchTags = () => {
    fetch('http://localhost:8080/tags')
      .then(res => res.json())
      .then(data => setAllTags(data))
      .catch(err => console.error("無法取得標籤:", err));
  };

  // 2. 核心搜尋功能 (呼叫後端 API)
  const fetchPuns = (keyword = "", tagIds = []) => {
    setLoading(true);

    const params = new URLSearchParams();

    if (keyword) params.append("keyword", keyword);

    //將已選擇的標籤加入搜尋條件
    if (tagIds.length > 0) {
      params.append("tags", tagIds.join(","));
    }

    const url = (keyword === "" && tagIds.length === 0)
      ? 'http://localhost:8080/puns'
      : `http://localhost:8080/puns/search?${params.toString()}`;

    fetch(url)
      .then(res => res.json())
      .then(data => {
        setPuns(data);
        setLoading(false);
      })
      .catch(error => {
        console.error("無法取得資料:", error);
        setLoading(false);
      });
  };

  // 3. 處理搜尋表單送出
  const handleSearch = (e) => {
    e.preventDefault();
    // 把輸入的關鍵字和已選的標籤送給後端
    fetchPuns(searchTerm, selectedTagIds);
  };

  // 4. 處理標籤勾選
  const handleTagChange = (tagId) => {
    setSelectedTagIds(prev => {
      const newTags = prev.includes(tagId)
        ? prev.filter(id => id !== tagId)
        : [...prev, tagId];
      return newTags;
    });
  };

  return (
    <Layout>
      {/* 搜尋區塊 */}
      <div className="mb-10">
        <form onSubmit={handleSearch} className="relative group flex gap-2">
          <div className="relative flex-grow">
            <input
              type="text"
              placeholder="輸入關鍵字搜尋..."
              value={searchTerm}
              onChange={(e) => setSearchTerm(e.target.value)}
              className="w-full p-4 pl-6 rounded-full border-2 border-gray-300 focus:border-[#8AB65D] focus:outline-none"
            />
            <button
              type="submit"
              className="absolute right-2 top-2 bottom-2 bg-[#8AB65D] w-12 rounded-full text-white flex items-center justify-center hover:opacity-90"
            >
              <Search size={20} />
            </button>
          </div>

          {/* 篩選按鈕 */}
          <button
            type="button"
            onClick={() => setShowTagFilter(!showTagFilter)}
            className={`p-4 rounded-full border-2 ${showTagFilter ? 'bg-gray-100 border-[#8AB65D]' : 'border-gray-300'} hover:bg-gray-50`}
          >
            <Filter size={20} className={selectedTagIds.length > 0 ? "text-[#8AB65D]" : "text-gray-500"} />
          </button>
        </form>

        {/* 標籤勾選介面 (點擊icon後顯示) */}
        {showTagFilter && (
          <div className="mt-4 p-4 bg-white rounded-xl shadow-lg border border-gray-100">
            <h3 className="text-sm font-bold text-gray-500 mb-2">篩選標籤:</h3>
            <div className="flex flex-wrap gap-2">
              {allTags.map(tag => (
                <label
                  key={tag.tagId}
                  className={`cursor-pointer px-3 py-1 rounded-full border text-sm transition select-none
                    ${selectedTagIds.includes(tag.tagId)
                      ? 'bg-[#8AB65D] text-white border-[#8AB65D]'
                      : 'bg-white text-gray-600 border-gray-300 hover:border-[#8AB65D]'}`}
                >
                  <input
                    type="checkbox"
                    className="hidden"
                    checked={selectedTagIds.includes(tag.tagId)}
                    onChange={() => handleTagChange(tag.tagId)}
                  />
                  {tag.tagName}
                </label>
              ))}
            </div>
            <div className="mt-2 text-right">
                <button
                    onClick={handleSearch} // 點擊按鈕後開始搜尋
                    className="text-xs text-[#8AB65D] font-bold hover:underline"
                >
                    套用篩選
                </button>
            </div>
          </div>
        )}
      </div>

      {/* 搜尋結果列表顯示 */}
      <section>
        <h2 className="text-lg font-bold mb-4 text-gray-700">
          搜尋結果
        </h2>

        {loading ? (
          <div className="text-center py-10 text-gray-500">載入中...</div>
        ) : (
          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            {puns.length > 0 ? (
              puns.map(pun => (
                <PunCard
                  key={pun.punId}
                  id={pun.punId}
                  title={pun.content}
                  tags={pun.tags}
                  status={pun.status}
                  onClick={() => navigate(`/detail/${pun.punId}`)}
                />
              ))
            ) : (
              <p className="text-gray-500">找不到符合條件的諧音梗。</p>
            )}
          </div>
        )}
      </section>
    </Layout>
  );
};

export default HomePage;