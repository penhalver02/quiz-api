require 'rails_helper'

RSpec.describe RoundSerializer do
  describe '#attributes' do
    let!(:category) { Category.create(name: 'matemática') }
    let!(:question1) { Question.create(description: 'Quanto é 1+1?', category_id: category.id, correct_answer: '2' ) }
    let!(:question2) { Question.create(description: 'Quanto é 2+1?', category_id: category.id, correct_answer: '3' ) }

    let!(:option1) { Option.create(label: '5', question_id: question1.id) }
    let!(:option2) { Option.create(label: '2', question_id: question1.id) }
    let!(:option3) { Option.create(label: '7', question_id: question1.id) }

    let!(:option4) { Option.create(label: '3', question_id: question2.id) }
    let!(:option5) { Option.create(label: '8', question_id: question2.id) }
    let!(:option6) { Option.create(label: '2', question_id: question2.id) }

    let!(:player) { Player.create(name: 'Lucas') }
    let!(:round) { Round.create(category_id: category.id, player_id: player.id) }

    let!(:answer) { Answer.create(question_id: question1.id, option_id: option2.id, correct: true, round_id: round.id) }
    let!(:answer2) { Answer.create(question_id: question2.id, option_id: nil, round_id: round.id) }

    let(:expected_response) do
      {
        round: {
          id: round.id,
          player_id: player.id,
          questions: [
            {
              id: question1.id,
              description: question1.description,
              options: [
                { id: option1.id, label: option1.label},
                { id: option2.id, label: option2.label},
                { id: option3.id, label: option3.label}
              ]
            },
            {
              id: question2.id,
              description: question2.description,
              options: [
                { id: option4.id, label: option4.label},
                { id: option5.id, label: option5.label},
                { id: option6.id, label: option6.label}
              ]
            }
          ],
          answers: [
            {
              id: answer.id,
              question_id: answer.question_id,
              option_id: answer.option_id,
              correct: answer.correct
            }
          ]
        }
      }
    end


    subject { described_class.new(round).attributes }

    it { expect(subject).to eql(expected_response) }
  end
end
