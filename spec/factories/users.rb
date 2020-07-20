FactoryBot.define do
  factory :user do
    password { "google" }
    password_confirmation { "google" }
  end
end
