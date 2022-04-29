class Doc < ApplicationRecord
  has_many :projects
  has_many :directors, through: :projects
  has_many :awards
  has_many :goodlinks
end
