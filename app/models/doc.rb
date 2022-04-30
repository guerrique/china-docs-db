class Doc < ApplicationRecord
  has_many :projects
  has_many :directors, through: :projects
  has_many :awards, dependent: :destroy
  has_many :goodlinks, dependent: :destroy
  accepts_nested_attributes_for :awards
  accepts_nested_attributes_for :goodlinks
end
