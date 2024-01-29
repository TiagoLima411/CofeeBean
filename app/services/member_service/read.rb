# frozen_string_literal: true

module MemberService
  # app/services/member_service/read.rb
  class Read
    class << self
      attr_accessor :members

      def initialize_members_if_needed
        @members ||= []
        Rails.logger.tagged(self.class.name) { Rails.logger.send(:info, "MERBERS ENGINE STARTED -- #{Time.now}") } if @members.count.zero?
      end

      def find(id)
        initialize_members_if_needed
        @members.find { |m| m.id == id }
      end

      def find_by_email_and_password(email, password)
        initialize_members_if_needed
        @members.find { |m| m.email == email && m.password == password }
      end

      def list
        initialize_members_if_needed
        @members
      end

      def clear_members
        @members = nil
      end
    end

    attr_reader :member

    def initialize
      self.class.initialize_members_if_needed
    end

    def find(id)
      @member = self.class.find(id)
      log("FIND -- MEMBER FOUND -- ID: #{@member.id} -- NAME: #{@member.name} -- EMAIL: #{@member.email}".upcase) if @member.present?
      @member
    end

    def find_by_email_and_password(email, password)
      @member = self.class.find_by_email_and_password(email, password)
      return if @member.nil?

      log("FIND_BY_EMAIL_AND_PASSWORD -- MEMBER CREATED -- ID: #{@member.id} -- NAME: #{@member.name} -- EMAIL: #{@member.email}".upcase)
      @member
    end

    def list
      self.class.list
    end

    def log(message, level: :info)
      Rails.logger.tagged(self.class.name) { Rails.logger.send(level, message) }
    end
  end
end
