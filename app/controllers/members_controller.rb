# frozen_string_literal: true

# app/controllers/members_controller.rb
class MembersController < ApplicationController
  before_action :set_member, only: %i[show]
  before_action :authenticate_member, :load_client_info, only: %i[show]

  # GET /members/1
  def show
    reset_session if session_expired?
  end

  # POST /members
  def create
    @member = Member.new(member_params)
    service = MemberService::Create.new(@member)
    respond_to do |format|
      if service.create
        format.html { redirect_to "/members/#{service.member.id}", notice: 'Usuário criado com sucesso.' }
      else
        format.html { render 'sessions/_form', status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_member
    service = MemberService::Read.new
    @member = service.find(params[:id].to_i)
  end

  def load_client_info
    @client_info = session[:client_info]
  end

  # Only allow a list of trusted parameters through.
  def member_params
    params.require(:member).permit(:name, :email, :password)
  end
end
