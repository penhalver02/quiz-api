# frozen_string_literal: true

class RandomQuestionsService
  def self.call(category_id)
    new(category_id).call
  end

  def initialize(category_id)
    @category_id = category_id
  end

  def call
    list_questions_ids.sample(3)
  end

  private

  def list_questions_ids
    # Buscar outra alternativa para não voltar todas as questões podendo gerar problema de desempenho,
    # tentar buscar as questões sorteadas utilizando sql
    Question.where(category_id: @category_id).select(:id)
  end
end
