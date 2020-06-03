FactoryBot.define do
  factory :item do
    name              {"test"}
    content           {"test"}
    brand             {"test"}
    status            {"test"}
    postage           {"test"}
    prefecture_id     {"999"}
    shipping_days     {"test"}
    price             {"999"}
    user
    category          { create(:category) }
    after(:build)     {|item| item.images << FactoryBot.build(:image)}
  end
end