# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

require 'faker'

admin = User.create!(:name => "Admin user",
                     :email => "admin@kontakty.pl",
                     :password => "admin",
                     :password_confirmation => "admin")
admin.toggle!(:admin)

99.times do |n|
  name = Faker::Name.name
  email = "user-#{n+1}@kontakty.org"
  password = "password"
  User.create(:name => name,
              :email => email,
              :password => password,
              :password_confirmation => password)
end

User.all(:limit => 10).each do |user|
  10.times do
    # TODO
    user.contacts.create!(  :name     => Faker::Name.first_name,
                            :surname  => Faker::Name.last_name,
                            :email    => Faker::Internet.email,
                            :home_url => Faker::Internet.domain_name,
                            :phone    => Faker::PhoneNumber.phone_number,
                            :city     => Faker::Address.city,
                            :street   => Faker::Address.street_name + " " + Random.new.rand(1..200).to_s + (rand > 0.5 ? "/" + Random.new.rand(1..50).to_s : ""))
  end
end
