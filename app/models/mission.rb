class Mission < ApplicationRecord
  belongs_to :user
  has_many :taggings, as: :taggable
  has_many :tags, through: :taggings
  accepts_nested_attributes_for :taggings
end
