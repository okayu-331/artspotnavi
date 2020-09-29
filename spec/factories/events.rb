FactoryBot.define do
  factory :event do
    open_date { Faker::Date.between(from: '2020-09-01', to: '2020-09-30') }
    open_time { "10:00:00" }
    close_time { "17:00:00" }
    association :organizer
    association :exhibition
  end
end
