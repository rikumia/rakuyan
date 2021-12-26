FactoryBot.define do
  factory :cliant do
    cliant_name    { 'aaa' }
    email          { Faker::Internet.free_email }
    tell           { '09000000000' }
    address        { 'aaa' }
  end
end
