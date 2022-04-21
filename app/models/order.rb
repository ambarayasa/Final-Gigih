class Order < ApplicationRecord
    has_many :order_details


    validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP, uniqueness: true
    validates :date_order, presence: true
    validates :status, presence: true
end
