# frozen_string_literal: true

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
category1 = Category.create(name: 'matemática')

question1 = Question.create(description: 'Quanto é 1+1?', category_id: category1.id,
                            correct_answer: '2')

Option.create(label: '5', question_id: question1.id)
option2 = Option.create(label: '2', question_id: question1.id)
Option.create(label: '7', question_id: question1.id)

question2 = Question.create(description: 'Qual a raiz quadrada de 9?', category_id: category1.id,
                            correct_answer: '3')

Option.create(label: '3', question_id: question2.id)
Option.create(label: '5', question_id: question2.id)
Option.create(label: '9', question_id: question2.id)

question3 = Question.create(description: 'Qual é 2+2', category_id: category1.id,
                            correct_answer: '4')

Option.create(label: '8', question_id: question3.id)
Option.create(label: '4', question_id: question3.id)
Option.create(label: '11', question_id: question3.id)

question4 = Question.create(description: 'Qual a raiz quadrada de 4?', category_id: category1.id,
                            correct_answer: '2')

Option.create(label: '1', question_id: question4.id)
Option.create(label: '3', question_id: question4.id)
Option.create(label: '2', question_id: question4.id)

question5 = Question.create(description: 'Qual é 5-2', category_id: category1.id,
                            correct_answer: '3')

Option.create(label: '5', question_id: question5.id)
Option.create(label: '3', question_id: question5.id)
Option.create(label: '6', question_id: question5.id)

# user1 = Player.create(name: 'Lucas')
# round1 = Round.create(category_id: category1.id, player_id: user1.id)

# Answer.create(question_id: question1.id, option_id: option2.id, correct: true,
#               round_id: round1.id)
# Answer.create(question_id: question2.id, round_id: round1.id)
