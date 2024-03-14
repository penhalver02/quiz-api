require 'rails_helper'

RSpec.describe RandomQuestionsService do
  let!(:category) { Category.create(name: 'matemática') }
  let!(:question1) { Question.create(description: 'Quanto é 1+1?', category_id: category.id, correct_answer: '2' ) }
  let!(:question2) { Question.create(description: 'Quanto é 1+3?', category_id: category.id, correct_answer: '4' ) }
  let!(:question3) { Question.create(description: 'Quanto é 1+10?', category_id: category.id, correct_answer: '11' ) }
  let!(:question4) { Question.create(description: 'Quanto é 2+2?', category_id: category.id, correct_answer: '4' ) }
  let!(:question5) { Question.create(description: 'Quanto é 1-1?', category_id: category.id, correct_answer: '0' ) }

  subject { described_class.call(category.id)}

  it 'retuns the array of ids' do
    expect(subject.count).to eq 3
  end
end
