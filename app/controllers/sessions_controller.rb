# frozen_string_literal: true

# app/controllers/members_controller.rb
class SessionsController < ApplicationController
  before_action :set_member, :store_client_info_in_session, only: %i[create]

  # POST /sessions/sign_up
  def sign_up
    @member = Member.new
  end

  # GET /sessions/sign_in
  def new
    @member = Member.new
  end

  # POST /sessions/create
  def create
    respond_to do |format|
      if @current_member.present?
        session[:member_id] = @current_member.id
        session[:expires_at] = 5.seconds.from_now

        format.html { redirect_to "/members/#{@current_member.id}", notice: 'Logado com sucesso.' }
      else
        flash[:error] = 'Usuário não cadastrado.'
        format.html { redirect_to '/sessions/sign_in' }
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def member_params
    params.require(:member).permit(:name, :email, :password)
  end

  def set_member
    service = MemberService::Read.new
    @current_member = service.find_by_email_and_password(member_params[:email], member_params[:password])
    @member = Member.new if @current_member.nil?
  end
end
