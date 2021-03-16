class Item < ApplicationRecord

  # validates :name, presence: true, uniqueness: true
  # validates_presence_of :name
  validates :name, presence: true, name: true
  # validate :custom_presence_validator
  #
  # def custom_presence_validator
  #   if self.name.nil? || self.name.empty?
  #     self.errors.add(:name, "must be present!!!!!!!!!!!")
  #   end
  # end



end
