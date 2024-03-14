# frozen_string_literal: true

class AnswersService
  def self.call(answer, option)
    new(answer, option).call
  end

  def initialize(answer, option)
    @answer = answer
    @option = option
  end

  def call
    update_answer
    @answer.reload.attributes.except('created_at', 'updated_at')
  end

  private

  def correct_answer?
    @answer.question.correct_answer == @option.label
  end

  def update_answer
    @answer.update(option_id: @option.id, correct: correct_answer?)
  end
end
