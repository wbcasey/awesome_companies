Dry::Rails.container do
  auto_register!("app/operations")
  auto_register!("app/contracts")
  auto_register!("app/entities")
  auto_register!("app/repositories")
end
