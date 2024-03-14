# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question
  has_one :option, dependent: :destroy
  belongs_to :round
end
