![画像の説明](./app/assets/images/artspotnavi_logo.png)

# 概要
**アートスポットナビ**は、展覧会の情報検索アプリケーションです。  
アートスポットナビでは、エリア・日時・タイトルから展覧会を検索することができます。

<br>

# 開発環境
ruby 2.6.5  
Rails 6.0.0  
mysql 5.6   
Bootstrap v4.5  
FullCalendar v5.3.1  

<br>

# DEMO
### 展覧会情報詳細ページ サンプル 

![readme_demo01](https://user-images.githubusercontent.com/68980915/94213600-32808880-ff12-11ea-8ebb-1aa94025c6a6.png)

<br>

# 制作背景

「今度の休みに美術館でも行こうかな？」  
「旅行先で面白そうな展覧会はやってないかな？」  
「予定が早く終わりそう！帰りに寄れる展覧会はあるかな？」

そう思って展覧会情報を検索した結果……  

「行こうと思ったら休館日だった。」  
「夜間延長開館していたことに気づかなかった。気づいていたら行けたのに。」  

と何度嘆いたことでしょう。  

たとえ情報サイトで検索して得た結果であっても、  
展覧会の公式ウェブサイトで休館日・開館時間のチェックは必須です。  

この不便さを解消するために、  
エリア・日付から展覧会情報を検索できるウェブアプリケーションを制作しました。  

<br>

# 工夫したポイント
展覧会の開館日を日付ごとにレコードとして保存することで、開館日を条件にした検索を可能にしました。  
展覧会情報の登録を実行すると、展覧会の基本情報はexhibitionsテーブルに保存されます。   
それと同時に、会期日数分のレコードが生成され、eventsテーブルに保存されます。  

<img width="974" alt="readme_demo02" src="https://user-images.githubusercontent.com/68980915/94146184-88234980-feae-11ea-987a-9dfefc059431.png">

<br>
<br>


画像を選択するとプレビュー画像が表示されます。  
画像の選択を誤ってしまった場合は、プレビュー画像下の削除ボタンから選択を取り消すことができます。  
複数画像の投稿が可能です。画像を選択するボタンは見た目上１つなので、周囲のデザインに影響しません。  

<br>

![demo](https://user-images.githubusercontent.com/68980915/94145804-0cc19800-feae-11ea-9ba9-b52ef1d0c4bd.gif)

<br>

レスポンシブ対応しました。

<img width="682" alt="readme_demo03" src="https://user-images.githubusercontent.com/68980915/94146189-8b1e3a00-feae-11ea-887f-c99a3c43c0aa.png">

<br>
<br>

# 実装予定の内容

- 展覧会の開館時間設定のUI修正。  
展覧会の開館時間設定画面にカレンダーを表示して、開館時間を直感的にわかりやすくします。  
カレンダーに表示された開館時間をクリックすることで開館時間の編集用フォームをモーダル表示します。  
この機能を実装することにより、直感的な編集操作が可能になります。  

- 検索フォームのモーダル表示。  
ヘッダーに検索アイコンを設置し、検索アイコンをクリックすることで検索フォームをモーダル表示します。  
この機能により、トップページ以外からでも気軽に検索を行うことができるようになります。

- 一般ユーザー登録機能。  
展覧会を探すサイト閲覧者のユーザー登録ができるようにします。  
この機能により、次のブックマーク機能の実装を可能にします。

- 展覧会情報へのブックマーク機能。  
ユーザーはログイン後、任意の展覧会に印をつけることができます。  
ユーザーはマイページから印をつけた展覧会情報一覧を閲覧することができます。  
この機能により、ユーザーが任意の展覧会情報へ再度アクセスすることが、より簡単にできるようになります。

<br>

# テーブル設計
## organizersテーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| name               | string  | null: false               |
| company_name       | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |

<br>

### Association
- has_many :exhibitions
- has_many :events

<br>

## exhibitions テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| title            | string     | null: false                    | 
| subtitle         | string     |                                |
| venue            | string     | null: false                    |
| description      | text       |                                |
| start_date       | date       | null: false                    |
| end_date         | date       | null: false                    |
| basic_open_time  | time       | null: false                    |
| basic_close_time | time       | null: false                    |
| close_day        | string     |                                |
| special_open_day | string     |                                |
| admission        | string     | null: false                    |
| address          | string     | null: false                    |
| access           | string     |                                |
| phone_number     | string     |                                |
| url              | string     |                                |
| prefecture_id    | integer    | null: false                    |
| organizer        | references | null: false, foreign_key: true |

<br>

### Association
- belongs_to :organizer
- has_many :events
- has_many_attached :images

<br>

## events テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| open_date  | date       | null: false                    | 
| open_time  | time       | null: false                    |
| close_time | time       | null: false                    |
| exhibition | references | null: false, foreign_key: true |
| organizer  | references | null: false, foreign_key: true |

<br>

### Association
- belongs_to :exhibition
- belongs_to :organizer