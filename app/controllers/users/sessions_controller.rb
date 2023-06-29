class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(_resource, _opts = {})
    return log_in_success if current_user

    log_in_failure
  end

  def respond_to_on_destroy
    log_out_success && return if current_user

    log_out_failure
  end

  def log_in_success
    response.headers['Access-Control-Expose-Headers'] = '*'
    render json: { message: 'You are logged in successfully', resource: }, status: :ok
  end

  def log_in_failure
    render json: { errors: resource.errors.full_messages || 'Login Failed!' }, status: :unprocessable_entity
  end

  def log_out_success
    render json: { message: 'You are logged out.' }, status: :ok
  end

  def log_out_failure
    render json: { errors: resource&.errors&.full_messages || 'Logout failed' }, status: :unprocessable_entity
  end
end
