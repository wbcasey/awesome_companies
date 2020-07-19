class ApplicationController < ActionController::Base
  include CurrentAttributes
  include AccountAccess
end
