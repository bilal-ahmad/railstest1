require 'factory_bot'
require 'faker'

FactoryBot.define do
  factory :client do |f|
    f.name { Faker::Name.name }
  end
end
