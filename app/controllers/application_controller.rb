class ApplicationController < ActionController::Base
  include CurrentAttributes
  include AccountAccess

  def after_sign_in_path_for(resource)
    dashboard_path(subdomain: current_account.subdomain)
  end
end
