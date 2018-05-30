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
user2 = User.new
user2.username = "operator"
user2.email = "hoge2@example.com"
user2.password = "glxre297"
user2.confirmed_at = "2018-05-10 00:00:00"
user2.admin_flg = true
user2.save
user2.add_role "operators"

