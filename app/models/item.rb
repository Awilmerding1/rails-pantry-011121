class Item < ApplicationRecord

  validates :name, presence: true, uniqueness: true
  validate :is_title_case
  before_validation :make_title_case
  has_many :measurements

  accepts_nested_attributes_for :measurements
  # validates_presence_of :name
  # validates :name, presence: true, name: true
  # validate :custom_presence_validator
  #
  # def custom_presence_validator
  #   if self.name.nil? || self.name.empty?
  #     self.errors.add(:name, "must be present!!!!!!!!!!!")
  #   end
  # end

  # def measurements_attributes=(attrs)
  #   attrs.values.each do |hash|
  #     self.measurements.build(hash)
  #   end
  # end
  #


  def is_title_case
    if self.name != self.name.titlecase
        self.errors.add(:name, "must be tilecase")
    end
  end

  def make_title_case
    self.name = self.name.titlecase
  end



end
