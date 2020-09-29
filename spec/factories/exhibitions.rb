FactoryBot.define do
  factory :exhibition do
    title { "展覧会タイトル-sample123/" }
    subtitle { "サブタイトル-sample123/" }
    venue { "美術館-sample123/" }
    description { "説明のテキスト-sample123/" }  
    start_date { Faker::Date.between(from: '2020-09-01', to: '2020-09-30') }
    end_date { Faker::Date.between(from: '2020-10-01', to: '2020-10-31') }
    basic_open_time { "10:00:00" }
    basic_close_time { "17:00:00" }
    close_day { "休館日-sample123/" }
    special_open_day { "特別開館日-sample123/" }
    admission { "大人1500円¥￥-sample123/" }
    address { "テスト県テスト市テスト町1-1-1"  }
    access { "大人1500円¥￥-sample123/" }
    phone_number { Faker::Number.leading_zero_number(digits: 11) }
    url { Faker::Internet.url(host: 'example.com') }
    prefecture_id { Faker::Number.within(range: 1..47) }
    association :organizer

    after(:build) do |exhibition|
      exhibition.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
