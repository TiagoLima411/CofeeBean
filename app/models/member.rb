# frozen_string_literal: true

# app/models/member.rb
class Member
  include ActiveModel::Model

  attr_accessor :id, :name, :email, :password

  validates :name, presence: true, length: { minimum: 5, maximum: 128 }
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, length: { maximum: 192 }
  validates :password, presence: true, length: { minimum: 10, maximum: 72 }

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @email = attributes[:email]
    @password = attributes[:password]
  end
end
