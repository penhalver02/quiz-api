# frozen_string_literal: true

class RandomQuestionsService
  def self.call(category_id)
    new(category_id).call
  end

  def initialize(category_id)
    @category_id = category_id
  end

  def call
    list_questions_ids
  end

  private

  def list_questions_ids
    Question.where(category_id: @category_id).order('RANDOM()').select(:id).limit(3)
  end
end
