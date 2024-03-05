class Task < ApplicationRecord
  belongs_to :category

  validates :name, presence: true
  validates :target_completion_date, presence: true
end
