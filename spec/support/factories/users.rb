FactoryGirl.define do
  factory :user do
    uid "abcdefg"
    name "Nicholas Jacques"
    account_completed? true
  end

  factory :unfinished_user, class: User do
    uid "abcdefg"
    name "Nicholas Jacques"
    account_completed? false
  end
end
