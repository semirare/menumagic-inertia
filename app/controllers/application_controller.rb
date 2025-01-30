class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :set_flash_messages

  private

  def set_flash_messages
    @inertia_flash = { notice: flash[:notice] } if flash[:notice].present?
  end

  def inertia_share
    { flash: @inertia_flash }
  end
end
