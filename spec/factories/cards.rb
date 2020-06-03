FactoryBot.define do
  factory :card do
    customer_id {"customer-id-test"}
    card_id     {"card-id-test"}
    user
  end
end
