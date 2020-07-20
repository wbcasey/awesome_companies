module AccountAccess
  extend ActiveSupport::Concern

  included do
    before_action :ensure_user_has_account_access
  end

  def ensure_user_has_account_access
    return if current_account_user.present?
    raise ActiveRecord::RecordNotFound
  end
end
