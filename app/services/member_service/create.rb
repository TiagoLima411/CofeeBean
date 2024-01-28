# frozen_string_literal: true

module MemberService
  # app/services/member_service/create.rb
  class Create
    extend ActiveModel::Callbacks

    define_model_callbacks :create, only: [:before]
    before_create :validate_member

    attr_accessor :member
    attr_reader :list, :errors

    def initialize(params)
      @service_read = MemberService::Read.new
      @list = @service_read.list
      @params = params
      @member = nil
      @errors = []
    end

    def create
      run_callbacks :create do
        @member.id = @list.length + 1
        insert(@member)
        find(@member.id)

        true
      end
    end

    private

    def validate_member
      @member = Member.new(@params)
      return if @member.valid?

      @member.errors.each do |e|
        errors << "#{e.attribute} #{e.message}"
      end

      throw :abort
    end

    def insert(member)
      @list << member
    end

    def find(id)
      @service_read.find(id)
    end
  end
end
