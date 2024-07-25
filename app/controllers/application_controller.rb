class ApplicationController < ActionController::API
  include Authentication
  include ErrorResponse
end
