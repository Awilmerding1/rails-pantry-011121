class Measurement < ApplicationRecord
  belongs_to :item
  belongs_to :user
  validates_presence_of :quantity, :unit
  # accepts_nested_attributes_for :item
  scope(:quantity_search, ->(quantity) { self.where("quantity >= ?", quantity) })

  # def self.quantity_search(quantity)
  #   quantity == "" ? self.all : self.where("quantity >= ?", quantity)
  # end


end
