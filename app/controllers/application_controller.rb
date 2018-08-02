class ApplicationController < ActionController::Base
  include SessionsHelper
  protect_from_forgery with: :exception

  before_action :set_locale, :chat_init

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def chat_init
    # Group chưa tạo. Nên lấy tạm 1 group id để tét chát.
    @chatroom = Chatroom.find_by slug: 3
    @message = Message.new
  end

  def default_url_options _options = {}
    {locale: I18n.locale}
  end

  def logged_in_user
    return if logged_in?
    store_location
    flash[:danger] = t "warning.login"
    redirect_to login_url
  end
end
