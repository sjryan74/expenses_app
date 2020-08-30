FactoryBot.define do
  factory :transaction do
    trans_date { "2020-08-30" }
    amount { "9.99" }
    description { "MyString" }
  end
end
