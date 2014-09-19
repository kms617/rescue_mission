class Question < ActiveRecord::Base
  has_many :answers, dependent: :delete_all, validate: :false
  accepts_nested_attributes_for :answers

  validates :title, length: {minimum: 40}
  validates :description, length: {minimum: 150}
end
