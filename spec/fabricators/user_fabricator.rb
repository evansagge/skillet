Fabricator :user do
  email { Forgery(:internet).email_address }
  password { Forgery(:basic).password }
  password_confirmation { |u| u.password }
end

Fabricator :confirmed_user, from: :user do
  confirmed_at { 1.day.ago }
end