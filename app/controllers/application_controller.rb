class ApplicationController < ActionController::Base
  private

  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def token(user_id)
    payload = { user_id: user_id }
    JWT.encode(payload, hmac_secret, 'HS256')
  end

  def hmac_secret
    'myPrivateKey'
  end

  def client_has_valid_token?
    !!current_user
  end

  def current_user
    begin
      token = request.headers['Authorization']
      decoded_array = JWT.decode(token, hmac_secret, true, { algorithm: 'HS256' })
      payload = decoded_array.first
    rescue StandardError # JWT::VerificationError
      return nil
    end
    User.find(payload['user_id'])
  end

  def require_login
    render json: { error: 'Unauthorized Request' }, status: :unauthorized unless client_has_valid_token?
  end
end
