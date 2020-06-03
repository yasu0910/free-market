FactoryBot.define do

  factory :delivery_info do
    first_name            {"佐藤"}
    last_name             {"健"}
    first_name_hurigana   {"サトウ"}
    last_name_hurigana    {"タケル"}
    postal_code           {"111-1111"}
    prefecture_id         {13}
    city                  {"墨田区"}
    street                {1-9-3}
  end

end