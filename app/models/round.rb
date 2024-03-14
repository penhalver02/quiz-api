# frozen_string_literal: true

class Round < ApplicationRecord
  belongs_to :category
  belongs_to :player
  has_many :answers, dependent: :destroy
  has_many :questions, through: :category
  has_many :options, through: :questions
end
