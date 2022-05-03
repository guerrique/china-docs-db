class Doc < ApplicationRecord
  has_many :projects
  has_many :directors, through: :projects
  # has_many :awards, dependent: :destroy
  has_many :awards, inverse_of: :doc, dependent: :destroy
  has_many :links, dependent: :destroy
  accepts_nested_attributes_for :awards, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :links
end


