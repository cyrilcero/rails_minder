class Category < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy

  #validations
  validates :name, presence: true, uniqueness: { scope: :user, case_sensitive: false }
end
