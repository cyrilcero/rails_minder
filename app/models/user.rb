class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable, :rememberable

  has_many :categories, dependent: :destroy
  has_many :tasks, through: :categories
end
