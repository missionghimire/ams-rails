module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_request
  end

  private

  def authenticate_request
    header = request.headers['Authorization']
    if header.present?
      header = header.split(' ').last
      if header != 'null'
        decoded = decode_token(header)
        @current_user = User.find(decoded['user_id']) if decoded
      else
        render json: { errors: 'Token is null' }, status: :unauthorized
      end
    else
      render json: { errors: 'No token found' }, status: :unauthorized
    end
  rescue ActiveRecord::RecordNotFound, JWT::DecodeError
    render json: { errors: 'Unauthorized' }, status: :unauthorized
  end

  def decode_token(token)
    JWT.decode(token, Rails.application.credentials.secret_key_base)[0]
  rescue
    nil
  end
end
