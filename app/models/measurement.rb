class Measurement < ApplicationRecord
  belongs_to :item
  validates_presence_of :quantity, :unit
  # accepts_nested_attributes_for :item
end
