# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :category
  has_many :options, dependent: :destroy

  validates :description, :correct_answer, presence: true
end
