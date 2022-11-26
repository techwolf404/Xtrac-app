class Group < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :group_subjects, dependent: :destroy
  has_many :subjects, through: :group_subjects

  validates :name, presence: true
  validates :icon, presence: true
end
