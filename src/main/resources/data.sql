-- 1. 新增使用者
INSERT INTO member(member_name, password)
VALUES ('admin', 'admin123');


-- 2. 新增標籤 (定義 ID 以便後續對應)
-- ID: 1=冷笑話, 2=地獄, 3=商業, 4=知識型, 5=實用(日常)
INSERT INTO tag (id, name) VALUES (1, '冷笑話');
INSERT INTO tag (id, name) VALUES (2, '地獄');
INSERT INTO tag (id, name) VALUES (3, '商業');
INSERT INTO tag (id, name) VALUES (4, '知識型');
INSERT INTO tag (id, name) VALUES (5, '實用(日常)');

-- 3. 新增笑話本體 (注意：這裡移除了 tags 欄位)
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('魯蛇翻身', 'loser翻身', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('有蛇有得', '有捨有得', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('蛇麼攏賀', '什麼都好（台語）', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('蛇麼都有', '什麼都有', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('蛇麼攏毋驚', '什麼都不怕（台語）', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('颱積電', '台積電（戲稱颱風的說法）', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('細說颱灣', '戲說台灣（戲稱颱風的說法）', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('斷頭颱', '斷頭台（戲稱颱風的說法）', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('颱全到', '跆拳道（戲稱颱風的說法）', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('米颱目', '米苔目（戲稱颱風的說法）', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('諧音梗真的太諧惡了', '諧音梗真的太邪惡了', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('吸血鬼不喜歡吃辣，因為他們喜歡 blood', 'blood（不辣的）', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('Tony 出門一定會帶水。', 'Tony 帶水（拖泥帶水）', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('愚公移山的時候唱什麼歌？', '移山移山，亮晶晶（一閃一閃亮晶晶）', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('一身花紋的蝴蝶吃胖了，會變什麼？', '發福蝶（花蝴蝶－台灣國語）', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('煎蛋愛上了荷包蛋，它拿吉他到荷包蛋樓下唱什麼歌？', '這是一首煎蛋的小情歌（這是一首簡單的小情歌）', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('旺旺雪餅覺得熱了後會變成什麼？', '旺旺仙貝（掀被）', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('為什麼動物園裡最不能惹的動物是猩猩？', '因為牠敲胸的（超兇的）', '', 1, CURRENT_TIMESTAMP);

-- 地獄系列
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('葬壽司', '藏壽司（殯藏相關）', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('燒肉放題', '燒肉放題烤肉店（殯藏相關）', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('殯雪奇緣', '冰雪奇緣（殯藏相關）', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('殯與火之歌', '冰與火之歌（殯藏相關）', '', 1, CURRENT_TIMESTAMP);

-- 商業系列
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('茶曉伊( Tea Know You 茶飲專賣)', '管他的（台語）', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('包手包餃', '包手包腳', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('咚窩蕊', 'Don''t worry.', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('吾燕煮鍋燒', '吾燕煮（吳彥祖）', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('澎漁宴 生猛海鮮', '澎漁宴（彭于晏）', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('地方髮院', '地方法院', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('台雞店甕仔雞', '台雞店（台積電）', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('蠔烤杯', '好靠北（台語）', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('I''M SO GAY 鹽酥雞', 'I''M SO GAY（鹹酥雞台語）', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('北棲邸家', '白癡在這（台語）', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('胃擠百蚵', '維基百科', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('滑龍粥', '划龍舟', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('鍋台銘', '郭台銘', '', 1, CURRENT_TIMESTAMP);

-- 知識型
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('芝士就是力量', '知識就是力量（培根名言）', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('魏延長高了，於是變成長魏延', '長魏延（腸胃炎）', '', 1, CURRENT_TIMESTAMP);

-- 實用系列
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('Duck不必', '大可不必', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('無fuck可說', '無話可說', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('lonely勒共', '都你在說（台語）', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('book思議', '不可思議', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('有bear來', '有備而來', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('深藏blue', '深藏不漏', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('你傷害了word，還excel而過', '你傷害了我，還一笑而過', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('貪生pass', '貪生怕死', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('海Chris爛', '海枯石爛', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('再慢我不Daniel', '再慢我不等你喔', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('Kevin見山', '開門見山', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('Nina麼可愛', '你那麼可愛', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('你們的對話Taipei七了', '你們的對話太北七了', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('是Kenting的', '是肯定的', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('要放棄這麼棒的文化實在Tainan了', '要放棄這麼棒的文化實在太難了', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('尊嘟假嘟', '真的假的', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('雨女無瓜', '與你無關', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('有bean嗎', '有病嗎', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('就醬', '就這樣', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('無可phone告', '無可奉告', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('ice你了', '愛死你了', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('你的禮帽呢', '你的禮貌呢', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('你有corn嗎', '你有空嗎', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('關你peace', '關你屁事', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('不服來北投啊', '不服來battle啊', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('我的新莊著你', '我的心裝著你', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('美術館那麼多幹嘛', '沒試管那麼幹嘛', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('baby無恥', '卑鄙無恥', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('道聽兩說', '道聽塗說', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('lose誰手', '鹿死誰手', '', 1, CURRENT_TIMESTAMP);

-- 商業系列 II
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('鶴茶樓', '喝茶嘍', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('可不可', '渴不渴', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('龜記', '果子（台語）', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('香耐鵝', '香奈兒', '', 1, CURRENT_TIMESTAMP);

-- 冷笑話 & 地區名系列
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('樹的味道像什麼？', '像雞，因為數位相機', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('哪種交通工具最欠罵？', '火車，因為欠嗆欠嗆欠嗆', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('抬鐘人', '台中人', 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcR6FHOwiX55w9ugqARtSJxZH3vwtD5yYQJBi00JMDnt4dtHPfZq', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('抬男人', '台南人', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRMn85K7kuG5Pv90JwqBNvGI2ADNRUgaAFxw&s', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('肺預清', '肺癌預防＋清潔血管，取自歌手費玉清', 'https://www.ccg-health.com/archive/image/article2/d321f8006c0021ad.jpg', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('逮八人', '台北人', 'https://pgw.udn.com.tw/gw/photo.php?u=http://uc.udn.com.tw/photo/2023/07/04/realtime/23015348.png&s=Y&x=0&y=12&sw=1200&sh=800&w=300', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('花簾人', '花蓮人', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxfA6VQewh4gCB49f64KKzxkz4FFCS-LUEA89CAYZW7pLlgZie', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('男四腳人', '南勢角人', 'https://attach.mobile01.com/attach/202306/mobile01-0a43d06a623f3a24fc68958424142e13.jpg', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('逃猿人', '桃園人', 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQomCFuHiLK-hjMaFq4z4ujyiBks7RT6_QaaoL1Agjux49iLVg1', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('髒畫人', '彰化人', 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQWhOCEtX_GOMONCDWtndKPS2t1IKIxFvvAlVoR2IyelajmXkUO', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('五古人', '五股人', 'https://img.soundofhope.org/2021-06/1623295404980.jpg', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('五穀人', '五股人', 'https://ftp.pic.kgcheck.com.tw/column/20170111.jpg', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('擁慷仁', '永康人', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXjY7bnbaEJeZZHCRdSobQlpFxPl4kKKWDLg&s', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('48763', '星爆氣流斬', 'https://media.nownews.com/nn_media/thumbnail/2017/04/b9a2f68efc4be7905e67fdc9c55ef2e6-1200x1348.jpg', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('西瓜榴槤雞', '星光流連擊', 'https://media.nownews.com/nn_media/thumbnail/2017/04/b9a2f68efc4be7905e67fdc9c55ef2e6-1200x1348.jpg', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('領口人', '林口人', 'https://down-tw.img.susercontent.com/file/tw-11134201-7qul5-lk7jle6dupc6a3', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('瓶凍人', '屏東人', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTk-4_EUwMSITPXt_rpxiWOffLn9YmjbbxIRg&s', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('猩裝人', '新莊人', 'https://down-tw.img.susercontent.com/file/cn-11134207-7qukw-lk6qf27xi4d9f9_tn', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('喬頭人', '橋頭人', 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTt1QHDIlj0-YGUwA78P7AiVU7-N40Cf4rr5C4uSXHcqwT7_3f8', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('五假人', '五甲人', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoCG_GODbw_jevYqpTzPmLKJIIepoo98yQz9bjIbU4kO248ELU', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('心電人', '新店人', 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSdpvVOvSEZLnQD1M3TB6IIo7k7lPSGjV8Q_ERV1U7IQbtnzIs6', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('大坑人', '大坑人', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzyIu_SWr1vakYyIqpJIO7-r3B-4A2aydEvdJd2JmQlo7zPcvW', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('抬冬人', '台東人', 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcScaNs--PcRdjVdXyyLGKDvmKUgHc-VVm5lacOhy-kHucbXPbFQ', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('背男人', '卑南人', 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRukJ1d1IDKZDtRUkVaRqt0bPDYaW07LU_DvOv0UG12GqWtqoqc', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('綠倒人', '綠島人', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQY6xgkBoPimU0yR5tlPeg77tNUhGrF1pasqA&s', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('咦男人', '宜蘭人', 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSDokIeHzoJ4g8Z2YwInYUnqQldLNk3PKJMc5J9BWKSsiaYxbNx', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('蘆粥人', '蘆洲人', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmKGBXtmAOIxS8Vt7LHGESqAeaO0eYqHpEhupgdni30FRj01ks', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('橫春人', '恆春人', 'https://pgw.udn.com.tw/gw/photo.php?u=https://uc.udn.com.tw/photo/2023/07/04/0/23004766.jpg&x=0&y=0&sw=0&sh=0&sl=W&fw=800&exp=3600&w=400&nt=1', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('冰凍榔', '屏東人（台語）', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQwcCbEKgnxrg1yra04_lgZHrmN-N2zuTF_Q&s', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('瞄利人', '苗栗人', 'https://pgw.udn.com.tw/gw/photo.php?u=https://uc.udn.com.tw/photo/2023/07/04/0/23004507.jpg&x=0&y=0&sw=0&sh=0&sl=W&fw=800&exp=3600&w=400&nt=1', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('三俠人', '三峽人', 'https://media.zenfs.com/en/mirrormedia.mg/400949ecddf2620654212aae31a5e163', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('大假人', '大甲人', 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQP0y3RZ5Gx--6r54qpizNYeGe9Sv8OV9K-Pz6gbDxMfu1Fsoqh', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('左贏人', '左營人', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTC5TMeKySe9h6BQckxMoUckom9ipryiegZAQR4aVTYebT0F8Gu', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('難投人', '南投人', 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcS93QF1feThq-hNF8Bt5oIEGWEhRrJQO0jL8uOAhCmYmPxiG5K7', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('殺鹿人', '沙鹿人', 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcR2SkC_4phJBlL9zlIlTznVzQM55wRxGEUYcyMvWOvNAyupCQ-W', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('虎口人', '湖口人', 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQh0hVgP5510UMJFk6hDYRVOPKkrIvPVpCjGrAesJJbfGMH8Cqd', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('淡水人', '淡水人', 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSMuO87FSyLZEiA2KHZHTL7KxrA3rKWVUOyFwrMgz_Tee72hv04', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('猩逐人', '新竹人', 'https://cdn.memes.com/up/51575141624485543/i/1628131179586.jpg', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('遲上人', '池上人', 'https://d1b8dyiuti31bx.cloudfront.net/NewsPhotos/20240424/17_080042956712.jpg', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('加薏仁', '嘉義人', 'https://scontent.ftpe2-2.fna.fbcdn.net/v/t39.30808-6/357680089_6094467713998529_5092349969937248726_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=bd9a62&_nc_ohc=qehxAL4dhl0Q7kNvgGMpfGc&_nc_zt=23&_nc_ht=scontent.ftpe2-2.fna&_nc_gid=A5AUmyckiheqidFWSUrXrDf&oh=00_AYCcgGZXiDxscsoTNf2-EzNlEWNnGhYj9O5KEgvscr3WLA&oe=675C8414', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('暗自sad', '客語的謝謝，但網路用語為暗自難過之意', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('給你world愛', '給妳我的愛', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('低頭school鄉', '低頭思故鄉', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('不得house', '不得好死', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('膽double天', '膽大包天', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('皮蛋solo粥', '皮蛋瘦肉粥', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('殯友再會啦', '朋友再會啦（殯葬相關）', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('東方不buy', '東方不敗', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('南無觀世impreza', '南無觀世音菩薩', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('一定IPad熱開水', '一定要配（台語）熱開水', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('阿扁elephant多錢', '阿扁ㄟ了很多錢', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('Judy不去，Cindy不來', '舊的不去，新的不來', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('不講wood', '不講武德', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('sun心病狂', '喪心病狂', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('cheese回生', '起死回生', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('battle到老', '白頭到老', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('人見人eye', '人見人愛', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('more名奇妙', '莫名其妙', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('心如dog', '心如刀割', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('火烤就是每位', '火烤就是美味（殯葬相關）', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('more笨大學', '莫爾本大學', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('獼hotel', '獼猴桃', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('台北屍樂園', '台北市樂園（殯葬相關）', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('安ね欸さい', '這樣可以', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('りかわ惦惦', '你給我閉嘴', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('ばど妖ら', '肚子餓了', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('但じれ', '等一下', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('哪個函數最幸運？', '三角函數，因為它總是賽(sin)到', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('川普跌倒會變什麼？', '三普，川橫放會變三', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('川普露三點是什麼？', '州普，川加三點會變州', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('川普露三點游泳是什麼？', '洲普，川加三點變州，再加水部變洲', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('為什麼sin跟tan不找cos唱歌？', '因為cos慢半拍(π)', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('殯原歷險記', '冰原歷險記（殯葬相關）', '', 1, CURRENT_TIMESTAMP);
INSERT INTO pun (content, description, image_url, created_by, create_date) VALUES ('海釋神樓', '海市蜃樓（殯葬相關）', '', 1, CURRENT_TIMESTAMP);

-- 4. 建立 Many-to-Many 關聯表 (最重要的一步，將標籤貼到笑話上)

-- 冷笑話 (1~18)
INSERT INTO pun_tag (pun_id, tag_id) SELECT pun_id, 1 FROM pun WHERE pun_id BETWEEN 1 AND 18;

-- 地獄 (19~22)
INSERT INTO pun_tag (pun_id, tag_id) SELECT pun_id, 2 FROM pun WHERE pun_id BETWEEN 19 AND 22;

-- 商業 (23~35)
INSERT INTO pun_tag (pun_id, tag_id) SELECT pun_id, 3 FROM pun WHERE pun_id BETWEEN 23 AND 35;

-- 知識型 (36, 37)
INSERT INTO pun_tag (pun_id, tag_id) VALUES (36, 4);
INSERT INTO pun_tag (pun_id, tag_id) VALUES (37, 4);

-- 實用(日常) (38~67)
INSERT INTO pun_tag (pun_id, tag_id) SELECT pun_id, 5 FROM pun WHERE pun_id BETWEEN 38 AND 67;

-- 商業 (68~71)
INSERT INTO pun_tag (pun_id, tag_id) SELECT pun_id, 3 FROM pun WHERE pun_id BETWEEN 68 AND 71;

-- 冷笑話 & 地區名 (72~111) 
INSERT INTO pun_tag (pun_id, tag_id) SELECT pun_id, 1 FROM pun WHERE pun_id BETWEEN 72 AND 75;
INSERT INTO pun_tag (pun_id, tag_id) VALUES (76, 4); -- 肺預清是知識型
INSERT INTO pun_tag (pun_id, tag_id) SELECT pun_id, 1 FROM pun WHERE pun_id BETWEEN 77 AND 111;

-- 實用(日常) (112~117)
INSERT INTO pun_tag (pun_id, tag_id) SELECT pun_id, 5 FROM pun WHERE pun_id BETWEEN 112 AND 117;

-- 地獄 (118)
INSERT INTO pun_tag (pun_id, tag_id) VALUES (118, 2);

-- 實用(日常) (119~121)
INSERT INTO pun_tag (pun_id, tag_id) SELECT pun_id, 5 FROM pun WHERE pun_id BETWEEN 119 AND 121;

-- 地獄 (122)
INSERT INTO pun_tag (pun_id, tag_id) VALUES (122, 2);

-- 實用(日常) (123~130)
INSERT INTO pun_tag (pun_id, tag_id) SELECT pun_id, 5 FROM pun WHERE pun_id BETWEEN 123 AND 130;

-- 實用(日常) 131
INSERT INTO pun_tag (pun_id, tag_id) VALUES (131, 5); 

-- 實用(日常) (132~133)
INSERT INTO pun_tag (pun_id, tag_id) SELECT pun_id, 5 FROM pun WHERE pun_id BETWEEN 132 AND 133;

-- 地獄 (134)
INSERT INTO pun_tag (pun_id, tag_id) VALUES (134, 2);

-- 冷笑話 (日文系列 135~138)
INSERT INTO pun_tag (pun_id, tag_id) SELECT pun_id, 1 FROM pun WHERE pun_id BETWEEN 135 AND 138;

-- 知識型 (139)
INSERT INTO pun_tag (pun_id, tag_id) VALUES (139, 4);

-- 冷笑話 (140~142)
INSERT INTO pun_tag (pun_id, tag_id) SELECT pun_id, 1 FROM pun WHERE pun_id BETWEEN 140 AND 142;

-- 知識型 (143)
INSERT INTO pun_tag (pun_id, tag_id) VALUES (143, 4);

-- 地獄 (144~145)
INSERT INTO pun_tag (pun_id, tag_id) SELECT pun_id, 2 FROM pun WHERE pun_id BETWEEN 144 AND 145;