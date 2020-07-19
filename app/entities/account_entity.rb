class AccountEntity < ApplicationEntity
  safe_delegate :id, :name, :subdomain, to: :model
end
