class Menu < ApplicationRecord
  has_many :order_details

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, length: { maximum: 150 }
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  

  def self.by_letter(letter)
    where("name LIKE ?", "#{letter}%").order(:name)
  end
end
