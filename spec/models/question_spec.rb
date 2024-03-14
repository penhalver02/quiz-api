require 'rails_helper'

RSpec.describe Question, type: :model do
  describe 'validations' do
    it "requires the presence of a description" do
      question = Question.new(correct_answer: '2')
      expect(question).not_to be_valid
    end

    it "requires the presence of a correct_answer" do
      question = Question.new(description: 'valor de 1+1?')
      expect(question).not_to be_valid
    end
  end
end
