class Director < ApplicationRecord
  include PgSearch::Model
  multisearchable against: [:name]

  has_many :projects
  has_many :docs, through: :projects
  has_many :pages, inverse_of: :director, dependent: :destroy
  has_one_attached :photo
  accepts_nested_attributes_for :pages, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: true, uniqueness: true
end
