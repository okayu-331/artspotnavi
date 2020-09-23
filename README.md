# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## organizersテーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| name               | string  | null: false               |
| company_name       | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |

### Association
- has_many :exhibitions
- has_many :events


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

### Association
- belongs_to :organizer
- has_many :events
- has_many_attached :images


## events テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| open_date  | date       | null: false                    | 
| open_time  | time       | null: false                    |
| close_time | time       | null: false                    |
| exhibition | references | null: false, foreign_key: true |
| organizer  | references | null: false, foreign_key: true |

### Association
- belongs_to :exhibition
- belongs_to :organizer