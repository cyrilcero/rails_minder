class Task < ApplicationRecord
  include TasksHelper
  belongs_to :category

  #validations
  validates :name, presence: true
  validates :target_completion_date, presence: true
end
