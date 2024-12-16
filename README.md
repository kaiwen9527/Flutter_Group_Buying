# Flutter_Group_Buying

* 一個簡易的系統 App，此 App 是簡單模擬現在市面上的團購市場 (假設為某個團購商的公司系統)。利用此 App 可以保存每一位用戶的資料且也能較有信用。每個客人登入後可查看目前團購主有推出什麼樣的合作商品，而客人可直接點選商品查看詳細資訊，當有意願時即可下單並將資料送至團購商那邊，團購商收到後在將商品打包寄出。

## 未登入時

* **剛進入 App 的畫面 (日跟夜)**

  ![登入畫面(日)](https://github.com/user-attachments/assets/9f823025-8530-4282-9139-b139e1e976a4)   ![登入畫面(夜)](https://github.com/user-attachments/assets/0159a35f-107d-421a-bba1-30cef7105158)

* **這裡先預設有一組使用者名稱與密碼**

  ![預設帳密](https://github.com/user-attachments/assets/4a29b0ad-f1f2-4317-b956-b08100ce8b3f)

* **如果帳 or 密錯誤**

  ![登入失敗](https://github.com/user-attachments/assets/8f4d035a-2fc0-4f62-ba5b-d35fa6b6eb54)

### Drawer 的部分 (日與夜)

* 未登入時只有一些地方會顯示，但詳細部分還是要先登入。然後中間有個太陽與月亮的圖示可以切換日與夜的背景模式。

  ![未登入時的抽屜(日)](https://github.com/user-attachments/assets/6094c48a-5354-4524-a9ac-ccf2abd11058)  ![未登入時的抽屜(夜)](https://github.com/user-attachments/assets/97b0dfcb-003e-46a2-a76d-dff0f293133c)

* **其餘頁面 (日與夜)** (因未登入，所以無法看到詳細內容)。
  
  ![未登入時的其他頁面(日)](https://github.com/user-attachments/assets/e9e43f69-aeb6-4970-b6b8-070f348bb540) ![未登入時的其他頁面(夜)](https://github.com/user-attachments/assets/8c27bd11-e723-4d12-84f3-1e82a9da9b2b)


## 登入後

### 會員資料

* **登入成功後的初始頁面 (日與夜)** (會直接跳至會員資料的頁面)。

  ![登入後的初始畫面(日)](https://github.com/user-attachments/assets/ff1ea692-8920-4cd6-83dc-50edd31e649e) ![登入後的初始畫面(夜)](https://github.com/user-attachments/assets/15726c64-b406-4d4a-ae43-9ef7d700852a)

* **當每個輸入框都未輸入文字並按下儲存時會顯示提示訊息**

  ![未填資料的提示(日)](https://github.com/user-attachments/assets/c6050562-161a-4f69-be1e-db2c4a03ccc0)

* **當某些或某個輸入框有填入資訊並按下儲存按鈕時會直接將輸入的資料儲存。**

  ![已填入儲存的資料(日)](https://github.com/user-attachments/assets/ddc1fc7d-e3e0-4b32-844f-2ae6d6cb2ede)

* **生日的右側有一個日期圖示按鈕** (點選會出現日期選擇的對話框，可選擇某個日期，會直接將選擇的日期顯示到輸入框上)。

  ![日期選擇](https://github.com/user-attachments/assets/aa01562f-3a05-459f-9fa6-78f4f9bdc9b1) ![被選擇的日期顯示於畫面上](https://github.com/user-attachments/assets/60b6f40c-13ff-4d2e-99e9-68f0270bb220)


### Drawer

* **登入後的抽屜 (日與夜)** (上面就會出現用戶設置的背景與頭像，並且下列會跑出登入後才可觀看的頁面)。

  ![登入後的抽屜(日)](https://github.com/user-attachments/assets/1089fc26-5f2c-462f-b859-d3141f934122) ![登入後的抽屜(夜)](https://github.com/user-attachments/assets/1f117f25-273b-459e-867c-ec4660f68ac9)

### 商品目錄 (商品圖片都是隨意抓的)

* **這裡是各種商品的目錄頁面 (日與夜)**

  ![商品目錄(日)](https://github.com/user-attachments/assets/c6530905-b540-46f3-81b1-609be52ee8a4) ![商品目錄(夜)](https://github.com/user-attachments/assets/c84556ff-c869-4ed4-b204-9ad1f0f3bce2)

* **點選某個商品會進入此商品的介面 (飛魚餅為例)** (這裡是參仿**蝦皮介面**的樣式)。

  ![某個商品的介面](https://github.com/user-attachments/assets/988eae73-72e3-492a-924f-f821daba4ffe) ![某個商品的介面2](https://github.com/user-attachments/assets/a116e0eb-5405-4264-b8de-8bcaf4c7bc40)

* **當點選某個商品下方的愛心可將此商品收藏至喜愛商品的列表裡** (右上角的購物車圖示也會顯示目前收藏商品的量有多少)。

  ![加入收藏](https://github.com/user-attachments/assets/480875e9-8029-4cfd-9e4c-e997b64f6082)

### 喜愛商品

* **加入收藏後會在此頁顯示已收藏的商品 (日與夜)**

  ![加入收藏後的喜愛商品(日)](https://github.com/user-attachments/assets/ec17bd79-9249-423d-8627-9acddb93ed6c) ![加入收藏後的喜愛商品(夜)](https://github.com/user-attachments/assets/2e823ff7-d101-4520-8f32-13768c5f6424)

* **而每個商品的右下角有一個刪除圖示鈕，點選後可取消收藏** (這也是喜愛商品頁面的初始畫面)。

  ![喜愛商品](https://github.com/user-attachments/assets/7877043d-82be-4189-991d-68c9aadabc09)

### 商品通知
**(先假設目前有已下單的商品，但賣家還未確認且出貨)**

* **商品通知的頁面 (日與夜)** (公告那邊有其他廣告的頁面，下圖顯示第一、二頁。目前還未有已出貨的商品，所以顯示尚未有訂單)。

  ![商品通知(日)](https://github.com/user-attachments/assets/11c4a7e1-cbc2-48b9-9828-9d29d7266a55) ![商品通知(夜)](https://github.com/user-attachments/assets/36c293d8-4004-4f69-8999-c52bf9e72739)

* **因賣家還沒確認，所以顯示等待出貨中**

  ![未出貨畫面](https://github.com/user-attachments/assets/a99515e4-550e-41a0-bde9-6ff56fbc48a0)

* **上方公告可點選顯示更多會跳出完整的公告**

  ![公告顯示](https://github.com/user-attachments/assets/d4423409-8bb2-47c1-baf5-a04d75a4c8f7)

### 回報問題

* **如用戶有什麼樣的問題就可在這填入並送出 (日與夜)**

  ![回報問題(日)](https://github.com/user-attachments/assets/416b9207-d7ee-41c9-a811-e9fa4a7fd7ae) ![回報問題(夜)](https://github.com/user-attachments/assets/8617a16b-56e1-47ab-af5e-11d5d22a5aaa)

* **如有一項或全部都未填寫，會跳出提示訊息**

  ![未填入問題](https://github.com/user-attachments/assets/26677d4f-eb94-4d8e-92d5-c380e2823258)

* **全部都填寫完後按下送出會將資料送出並顯示已送出資料的提示訊息** (可選取要問的類型)

  ![填完問題後送出](https://github.com/user-attachments/assets/b4c1319a-39a9-4d24-82bd-5eb58d060d95) ![問題類型](https://github.com/user-attachments/assets/888e49a5-2ac6-4a21-98c0-3dff4611b1d8)


### 浮動按鈕

* 當登入成功後會出現一顆浮動按鈕，可用鼠標拖曳至全螢幕，它的作用為當某些頁面有滾動事件時，滑到下方後直接點選按鈕會直接滾到頁面頂部，樣式是模仿 Apple 的輔助觸控按鈕。

  ![全屏浮動按鈕](https://github.com/user-attachments/assets/74c0e94f-7b64-4de8-b164-629261c61daf)

  
## dependencies

* flutter_screenutil: ^5.9.3
* provider: ^6.1.2
* date_format: ^2.0.9

## Version

* Flutter SDK -- 3.24.4
* Dart Version -- 3.5.4
* DevTools Version -- 2.37.3
* Android SDK -- 35.0.0
* Java JDK -- 17.0.11









  






  
















