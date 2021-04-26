require_relative "../models/project_model"
require_relative "../models/user_model"

FactoryBot.define do
  factory :user, class: UserModel do
    id { 0 }
    name { "Joe" }
    email { "joe@joejoe.com" }
    password { "3443FFSSF" }

    after(:build) do |user|
      result = ApiUser.auth(user.to_hash)
      user.id = result.parsed_response["user"]["_id"]
      user.email = result.parsed_response["user"]["email"]
    end
  end

  # new user

  factory :new_user, class: UserModel do
    name { Faker::JapaneseMedia::OnePiece.character }
    email { Faker::Internet.free_email(name: name) }
    password { "kamehameha" }
  end

  factory :empty_email_user, class: UserModel do
    name { Faker::JapaneseMedia::OnePiece.character }
    email { "" }
    password { Faker::Alphanumeric.alphanumeric(number: 10) }
  end

  factory :empty_password_user, class: UserModel do
    name { Faker::JapaneseMedia::OnePiece.character }
    email { Faker::Internet.free_email(name: name) }
    password { "" }
  end

  factory :null_email_user, class: UserModel do
    name { Faker::JapaneseMedia::OnePiece.character }
    password { Faker::Alphanumeric.alphanumeric(number: 10) }
  end

  factory :null_password_user, class: UserModel do
    name { Faker::JapaneseMedia::OnePiece.character }
    email { Faker::Internet.free_email(name: name) }
  end

  # auth user

  factory :empty_password_user_auth, class: UserModel do
    email { "joe@joejoe.com" }
    password { "" }
  end

  factory :wrong_password_user_auth, class: UserModel do
    email { "joe@joejoe.com" }
    password { Faker::Alphanumeric.alphanumeric(number: 10) }
  end

  factory :wrong_email_user_auth, class: UserModel do
    email { Faker::Internet.free_email }
    password { "3443FFSSF" }
  end

  # project

  factory :new_project, class: ProjectModel do
    title { Faker::JapaneseMedia::OnePiece.akuma_no_mi }
    description { Faker::JapaneseMedia::OnePiece.quote }
    name { Faker::Books::Dune.character }
    assignedTo { @user_id }
  end

  factory :updated_project, class: ProjectModel do
    title { Faker::TvShows::Friends.location }
    description { Faker::TvShows::Friends.quote }
    name { Faker::TvShows::Friends.character }
    assignedTo { @user_id }
  end
end
