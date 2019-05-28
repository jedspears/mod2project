# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(first_name: "Jed", last_name: "Spears", username:"baba", email:"ggggg@ggg.com", account_balance: 12321432434342)
User.create(first_name: "Qun", last_name: "Huang", username:"tta", email:"hhhh@ggg.com", account_balance:
534675757454)
User.create(first_name: "Carly", last_name: "Pecora", username:"hgds", email:"hjkgj@ggg.com", account_balance:
645645432)
User.create(first_name: "Won", last_name: "Kim", username:"llaaa", email:"uuuuu@ggg.com", account_balance:
47474785848)

Bet.create(description: "helo")

Transacktion.create(user_1_id:1 ,user_2_id:2 ,amount:10, bet_id: 1)

UserTransaction.create(user_id: 1, transacktion_id:1)
UserTransaction.create(user_id: 2, transacktion_id:1)


Bet.create(description: "destroy")

Transacktion.create(user_1_id:1 ,user_2_id:2 ,amount:10, bet_id: 2)
Transacktion.create(user_1_id:1 ,user_2_id:3 ,amount:10, bet_id: 2)
Transacktion.create(user_1_id:1 ,user_2_id:4 ,amount:10, bet_id: 2)

UserTransaction.create(user_id: 1, transacktion_id:2)
UserTransaction.create(user_id: 2, transacktion_id:2)
UserTransaction.create(user_id: 3, transacktion_id:2)
UserTransaction.create(user_id: 4, transacktion_id:2)
