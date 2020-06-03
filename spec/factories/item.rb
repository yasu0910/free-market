FactoryBot.define do
  factory :item do
    name              {"test"}
    category_id       {"0"}
    content           {"test"}
    brand             {"test"}
    status            {"test"}
    postage           {"test"}
    prefecture_id     {"0"}
    shipping_days     {"test"}
    price             {"9999"}
  end
end