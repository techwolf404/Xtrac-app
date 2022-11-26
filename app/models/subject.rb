class Subject < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :group_subjects, dependent: :destroy
  has_many :groups, through: :group_subjects

  validates :name, presence: true, length: { minimum: 1 }
  validates :amount, numericality: { greater_than: 0 }

  validates :groups, presence: true
end
