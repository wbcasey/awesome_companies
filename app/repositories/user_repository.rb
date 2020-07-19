class UserRepository < ApplicationRepository
  self.model = User
  self.entity = UserEntity
end
