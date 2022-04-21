class Order < ApplicationRecord
    validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP, uniqueness: true
    validates :date_order, presence: true
    validates :status, presence: true
end
