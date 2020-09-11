FactoryBot.define do
  factory :organizer do
    name { "テスト氏名" }
    company_name { "テスト会社名" }
    email { Faker::Internet.safe_email }
    password = Faker::Internet.password(min_length: 8, mix_case: true)
    password { password }
    password_confirmation { password }
  end
end
