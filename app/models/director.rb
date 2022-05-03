class Director < ApplicationRecord
  has_many :projects
  has_many :docs, through: :projects
  has_many :pages, dependent: :destroy
  accepts_nested_attributes_for :pages
end
