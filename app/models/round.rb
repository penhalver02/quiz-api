class Round < ApplicationRecord
  belongs_to :category
  belongs_to :player
  has_many :answers
end
