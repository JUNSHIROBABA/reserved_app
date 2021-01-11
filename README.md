# README

# DB設計
## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|  
|encrypted_password|string|null: false|
|lastname|string|null: false|
|firstname|string|null: false|
|lastname_kana|string|null: false|
|firstname_kana|string|null: false|
|firstname_kana|string|null: false|
|phone|string|null: false|
|postcode|string|null: false|
|prefecture_id|integer|null: false|
|city|string|null: false|
|address|string|null: false|
|building|string||

### Association
- has_one :card
- has_many :reserves

## cardsテーブル

|Column|Type|Options|
|------|----|-------|
|card_token|string|null: false|
|card_token|string|null: false|
|user|references|foreign_key: true|

### Association
- belongs_to :user

## stationsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

## Association
- has_many :trains, through: :stations_trains

## trainsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|departure_date|date|null: false|
|departure_time|string|null: false|

### Association
- has_many :stations, through: :stations_trains
- has_many :cars
- has_many :reserves

## stations_trainsテーブル

|Column|Type|Options|
|------|----|-------|
|station|references|foreign_key: true|
|train|references|foreign_key: true|

### Association
- belongs_to :station
- belongs_to :train

## carsテーブル
|Column|Type|Options|
|------|----|-------|
|car|integer|null: false|
|train|references|foreign_key: true|

### Association
- belongs_to :train
- has_many :seats

## seatsテーブル

|Column|Type|Options|
|------|----|-------|
|seat|string|null: false|
|car|references|foreign_key: true|

### Association
- belongs_to :car

## reserveテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|foreign_key: true|
|train|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :train