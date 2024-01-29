# frozen_string_literal: true

module MemberService
  # app/services/member_service/create.rb
  class Create
    extend ActiveModel::Callbacks

    define_model_callbacks :create, only: [:before]
    before_create :validate_member

    attr_accessor :member
    attr_reader :list, :errors

    def initialize(member)
      @service = MemberService::Read.new
      @list = @service.list
      @member = member
      @errors = []
    end

    def create
      run_callbacks :create do
        @member.id = list.nil? ? 1 : @list.length + 1
        insert(@member)
        find(@member.id)

        log("MEMBER CREATED -- ID: #{@member.id} -- NAME: #{@member.name} -- EMAIL: #{@member.email}".upcase)
        true
      end
    end

    private

    def validate_member
      return if @member.valid?

      @member.errors.each do |e|
        errors << "#{e.attribute} #{e.message}"
        log("VALIDATION ERROR -- #{e.attribute} #{e.message}".upcase, level: :error)
      end

      throw :abort
    end

    def insert(member)
      @service.initialize_members if @list.nil?
      @service.list << member
      log("INSERT NEW MEMBER TOTAL -- #{@service.list.count}")
    end

    def find(id)
      @service.find(id)
    end

    def log(message, level: :info)
      Rails.logger.tagged(self.class.name) { Rails.logger.send(level, message) }
    end
  end
end
