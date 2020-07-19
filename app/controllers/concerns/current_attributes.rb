module CurrentAttributes
  extend ActiveSupport::Concern

  included do
    before_action :set_current_attributes
  end

  def current_user
    @current_user ||= begin
      record = super
      UserEntity.new(record)
    end
  end

  def current_account
    @current_account ||= AccountRepository.new.find_by(subdomain: request.subdomain)
  end

  def current_account_user
    @current_account_user ||= AccountUserRepository.new.find_by(account_id: current_account&.id, user_id: current_user&.id)
  end

  private

  def set_current_attributes
    Current.user = current_user if current_user.present?
    Current.account = current_account if current_account.present?
    Current.account_user = current_account_user if current_account_user.present?
  end
end
