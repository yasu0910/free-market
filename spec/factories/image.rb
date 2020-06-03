FactoryBot.define do
  factory :image do
    url { File.open('public/images/test_image_1.jpeg')}
  end
end