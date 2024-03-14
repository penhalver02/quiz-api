require 'rails_helper'

RSpec.describe AnswersService do
  let!(:category) { Category.create(name: 'matemática') }
  let!(:question1) { Question.create(description: 'Quanto é 1+1?', category_id: category.id, correct_answer: '2' ) }
  let!(:player) { Player.create(name: 'Lucas') }
  let!(:round) { Round.create(category_id: category.id, player_id: player.id) }
  let!(:option) { Option.create(label: '5', question_id: question1.id) }
  let!(:answer) { Answer.create(question_id: question1.id, round_id: round.id) }

  subject { described_class.call(answer, option)}

  it 'retuns the answer updated' do
    expect(subject["correct"]).to eql false
    expect(subject["option_id"]).to eql option.id
  end
end
