class AccountRepository < ApplicationRepository
  self.model = Account
  self.entity = AccountEntity
end
