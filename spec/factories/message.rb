FactoryGirl.define do

  factory :message do
    body   { Faker::Lorem.sentence }
    image  { File.open("#{Rails.root}/spec/fixtures/image.jpg") }
    user
    group
    created_at { Faker::Time.between(2.days.ago, Date.today, :all) }
    updated_at { Faker::Time.between(2.days.ago, Date.today, :all) }
  end

end
