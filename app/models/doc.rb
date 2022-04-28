class Doc < ApplicationRecord
  has_many :projects
  has_many :directors, through: :projects
end
