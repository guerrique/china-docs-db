class Director < ApplicationRecord
  has_many :projects
  has_many :docs, through: :projects
  has_many :goodlinks
end
