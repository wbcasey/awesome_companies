class UserEntity < ApplicationEntity
  safe_delegate :id, :name, :email, :password, to: :model
end

