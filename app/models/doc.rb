class Doc < ApplicationRecord
  has_many :projects
  has_many :directors, through: :projects
  has_many :awards, dependent: :destroy
  has_many :links, dependent: :destroy
  accepts_nested_attributes_for :awards
  accepts_nested_attributes_for :links
end
