# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#
# create category
# 
category_1 = Category.create(name: 'matemática')
category_2 = Category.create(name: 'geografia')


question_1 = Question.create(description: 'Quanto é 1+1?', category_id: category_1.id, correct_answer: '2' )
question_2 = Question.create(description: 'Qual a raiz quadrada de 9?', category_id: category_1.id, correct_answer: '3' )

option_1 = Option.create(label: '5', question_id: question_1.id)
option_2 = Option.create(label: '2', question_id: question_1.id)
option_3 = Option.create(label: '7', question_id: question_1.id)

user_1 = Player.create(name: 'Lucas')
round_1 = Round.create(category_id: category_1.id, player_id: user_1.id)

Answer.create(question_id: question_1.id, option_id: option_2.id, correct: true, round_id: round_1.id)
