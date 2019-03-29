# Swift Study Jam#1


## 題目

來寫一個設定頁面吧- Table View static cell 和dynamic cell的混用

>  ### 總共三個頁面：
### 頁面一始初畫面 包括：
* Tabel View * 1 (section * 2，cell 各一)

第一個section的第一個cell包括一個**UISwitch**

第二個section的第一個cell會有**indicator**圖示

像這樣：

![](https://i.imgur.com/U1A9Vb4.png)

### 頁面二Editing頁面 包括：
* Label * 1
* Text Field * 1
* Button * 1
像這樣：

![](https://i.imgur.com/QczVvpA.png)

### 頁面三Food頁面 包括：
* Right Bar Button Item * 1(Add 樣式)
* Tabel View * 1 (section * 1，cell 若干)
像這樣：

![](https://i.imgur.com/D058UL5.png)


### 流程
1. 一進入APP，會顯示什麼都沒設定的頁面一，並在console印出：

![](https://i.imgur.com/wxJmlFy.png)

2. 打開第一個section的第一個cell中的**UISwitch**，畫面會顯示可編輯的項目，關閉UISwitch會隱藏可編輯的項目，可編輯的項目的格式如下圖：

![](https://i.imgur.com/KguieJI.png)


3. 按下第一個section的第一個以外cell會跳轉Editing頁面,Label會顯示："請輸入*XXX*:"，按下Button後返回會顯在cell上，都編輯完返回主頁，主頁會像這樣：

![](https://i.imgur.com/PfwGU3k.png)

Console 會印出：

![](https://i.imgur.com/aLW2BiQ.png)


4. 按下第二個section的第一個cell會跳轉Food頁面，Select cell 會打勾，像這樣：

![](https://i.imgur.com/ahI6WMC.png)


5. 返回主頁，第二個section會顯示勾選了的食物，像這樣：

![](https://i.imgur.com/PZLdkQ8.png)

6. 在Food頁面，打了勾的cell再按會取消打勾，主頁只會顯示有打勾的食物

### Optional:
- 完成Food頁面新增食物的功能


## 範例

https://youtu.be/HYyY4Ud4RYI


## Starter Project:

#### @Master branch:
https://github.com/lumanmann/SettingPage

![](https://i.imgur.com/Af9w0dJ.png)

包括寫好的一些元件和一些設定

#### food 字串：
var foods = ["柑", "蘋果", "葡萄", "香蕉", "楊桃", "梨", "鳳梨", "文旦", "西瓜"]


有需要請拿來使用～～



