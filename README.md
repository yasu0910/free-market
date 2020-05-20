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

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|password|integer|null: false|
|email|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_hurigana|string|null: false|
|last_name_hurigana|string|null: false|
|birthday|date|null: false|
### Association
- has_many :items
- has_one :credit
- has_one :delivery_info

## delivery_infosテーブル
|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_hurigana|string|null: false|
|last_name_hurigana|string|null: false|
|postal_code|integer|null: false|
|state|string|null: false|
|city|string|null: false|
|street|string|null: false|
|building_name|string|null: false|
|room_number|integer|
|phone_number|integer|
### Association
- has_one :user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|name|string|null: false|
|content|text|null: false|
|brand|string|null: false|
|status|string|null: false|
|postage|integer|null: false|
|ship_from_address|string|null: false|
|shipping_days|date|null: false|
|price|integer|null: false|
|category_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :images
- belongs_to :category

## categorysテーブル
|Column|Type|Options|
|------|----|-------|
|category_name|string|null: false|
|ancestry|string|
### Association
- has_many :items
- has_ancestry

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|image_url|string|null: false|
### Association
- belongs_to :item

## creditsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|credit_card_number|integer|null: false|
|expiration_date|date|null: false|
|credit_card_security_code|integer|null: false|
### Association
- belongs_to :user
