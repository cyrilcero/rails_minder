class Task < ApplicationRecord
  belongs_to :category

  #validations
  validates :name, presence: true
  validates :is_done, presence: true
  validates :target_completion_date, presence: true
end
