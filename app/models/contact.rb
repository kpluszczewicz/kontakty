class Contact < ActiveRecord::Base
  attr_accessible :name, :surname, :email, :phone, :city, :street

  belongs_to :user

  validates :user_id,   :presence => true
end
