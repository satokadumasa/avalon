# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 管理者
# user = User.create :username => "admin", :email => "webmaster@rainyrook.sakura.ne.jp", :password => "glxre297"

user = User.new
user.username = "admin"
user.email = "hoge@example.com"
user.password = "glxre297"
user.confirmed_at = "2018-05-10 00:00:00"
user.admin_flg = true
user.save
user.add_role "admin"

# user2 = User.create :username => "operator", :email => "webmaster@rainyrook.sakura.ne.jp", :password => "glxre297"
user = User.new
user.username = "operator"
user.email = "hoge2@example.com"
user.password = "glxre297"
user.confirmed_at = "2018-05-10 00:00:00"
user.admin_flg = true
user.save
user.add_role "operators"

user = User.new
user.username = "user1"
user.email = "hoge3@example.com"
user.password = "glxre297"
user.confirmed_at = "2018-05-10 00:00:00"
user.admin_flg = true
user.save

user = User.new
user.username = "user2"
user.email = "hoge4@example.com"
user.password = "glxre297"
user.confirmed_at = "2018-05-10 00:00:00"
user.admin_flg = true
user.save

category = Category.new
category.name = "ファンタジー"
category.save

category = Category.new
category.name = "SF"
category.save

category = Category.new
category.name = "恋愛"
category.save

category = Category.new
category.name = "ホラー"
category.save

category = Category.new
category.name = "ミステリー"
category.save

category = Category.new
category.name = "エッセイ・ノンフィクション"
category.save

category = Category.new
category.name = "歴史・時代・伝奇"
category.save

category = Category.new
category.name = "評論"
category.save

category = Category.new
category.name = "詩・童話"
category.save
