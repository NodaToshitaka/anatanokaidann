FactoryBot.define do
  factory :contact do
    name { "test" }
    email { "test@test" }
    phone_number { "00000000000" }
    message { "testmessage" }
  end
end
