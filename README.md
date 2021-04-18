# README

DB練習の開発コード
テーブル名  
カラム名  
カラムの型  
カラムのオプション（null false制約など）  
アソシエーション  

# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| email    | string | null: false |
| password | string | null: false |
| name     | string | null: false |
| profile  | text   | null: false |
| occupation| text  | null: false |
| position | text   | null: false |


### Association

- has_many :prototypes,comments

## prototypes テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| title  | string | null: false |
| catch_copy| text| null: false |
| concept | text  | null: false |
| image   | ActiveStorage | |
| user   | references   | |

### Association
 - has_many :comments

## comments テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | text | null: false |
| user   | references | null: false |
| prototype | references | null: false |