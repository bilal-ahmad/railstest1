require 'factory_bot'
require 'faker'

FactoryBot.define do
  factory :project do |f|
    f.name { Faker::Name.name }
  end
end
