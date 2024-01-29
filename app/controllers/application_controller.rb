# frozen_string_literal: true

# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  def authenticate_member
    redirect_to sessions_sign_in_path unless current_member
  end

  def current_member
    @current_member ||= MemberService::Read.new.find(session[:member_id]) if session[:member_id] && !session_expired?
  end

  def session_expired?
    session[:expires_at] && session[:expires_at] < Time.now
  end

  def store_client_info_in_session
    client_ip = request.remote_ip
    ipinfo_service = IpService::IpInfo.new(client_ip)
    client_info = ipinfo_service.info

    session[:client_info] = client_info
  end
end
