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
|user-first-name|string|null: false|
|user-last-name|string|null: false|
|user-first-name-hurigana|string|null: false|
|user-last-name-hurigana|string|null: false|
|birthday|date|null: false|
|delivery-first-name|string|null: false|
|delivery-last-name|string|null: false|
|delivery-first-name-hurigana|string|null: false|
|delivery-last-name-hurigana|string|null: false|
|postal-code|integer|null: false|
|state|string|null: false|
|city|string|null: false|
|street|string|null: false|
|building-name|string|null: false|
|room-number|integer|
|phone-number|integer|
### Association
- has_many :items
- belongs_to :credit
## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|user-id|references|null: false, foreign_key: true|
|item-name|string|null: false|
|item-content|text|null: false|
|item-category|string|null: false|
|item-brand|string|null: false|
|item-status|string|null: false|
|postage|integer|null: false|
|ship-from-address|string|null: false|
|shipping-days|date|null: false|
|price|integer|null: false|
### Association
- belongs_to :user
- has_many :images
## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item-id|references|null: false, foreign_key: true|
|image-url|string|null: false|
### Association
- belongs_to :item
## creditsテーブル
|Column|Type|Options|
|------|----|-------|
|user-id|references|null: false, foreign_key: true|
|credit-card-number|integer|null: false|
|expiration-date|date|null: false|
|credit-card-security-code|integer|null: false|
### Association
- belongs_to :user
