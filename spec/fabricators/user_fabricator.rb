Fabricator(:user) do
  email { Forgery(:internet).email_address }
  password { Forgery(:basic).password }
  password_confirmation { |u| u.password }
end
