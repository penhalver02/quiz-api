require 'rails_helper'

RSpec.describe RoundService::Creator do
  let!(:category) { Category.create(name: 'matemática') }
  let!(:question1) { Question.create(description: 'Quanto é 1+1?', category_id: category.id, correct_answer: '2' ) }

  let!(:option1) { Option.create(label: '5', question_id: question1.id) }
  let!(:option2) { Option.create(label: '2', question_id: question1.id) }
  let!(:option3) { Option.create(label: '7', question_id: question1.id) }
  let(:params) do
    {
      player_name: 'Lucas',
      category_id: category.id
    }
  end

  subject { described_class.call(params)}

  it { expect(subject).to eql(Round.last) }
end
