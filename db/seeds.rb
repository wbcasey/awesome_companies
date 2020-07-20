# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

account_owner = User.find_by(username: "hulk")
account_owner ||= FactoryBot.create(:user, email: "hulk@avengers.net", name: "Bruce Banner", username: "hulk")
account_owner.confirm

account = Account.find_by(subdomain: "avengers", owner: account_owner)
account ||= FactoryBot.create(:account, subdomain: "avengers", name: "Avengers Inc", owner: account_owner)
account_user = AccountUser.find_by(account_id: account.id, user_id: account_owner.id)
account_user ||= FactoryBot.create(:account_user, account: account, user: account_owner)
