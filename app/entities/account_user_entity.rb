class AccountUserEntity < ApplicationEntity
  safe_delegate :id, :account_id, :user_id, to: :model
end
