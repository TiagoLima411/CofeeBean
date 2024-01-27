# frozen_string_literal: true

module MemberService
  # app/services/member_service/read.rb
  class Read
    attr_accessor :members

    def initialize
      @members ||= []
    end

    def find(id)
      @members.find { |member| member.id == id }
    end

    def list
      @members
    end
  end
end
