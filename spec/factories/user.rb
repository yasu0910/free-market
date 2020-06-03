FactoryBot.define do
  factory :user do
    nickname              {"佐藤"}
    email                 {"k@gmail.com"}
    password              {"1111111"}
    first_name            {"佐藤"}
    last_name             {"健"}
    first_name_hurigana   {"サトウ"}
    last_name_hurigana    {"タケル"}
    birthday              {"2020-09-10"}
  end
end