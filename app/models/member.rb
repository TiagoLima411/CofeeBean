# frozen_string_literal: true

# app/models/member.rb
class Member
  include ActiveModel::Model

  attr_accessor :id, :name, :email, :password

  validates :name, presence: true, length: { minimum: 5, maximum: 128 }
  validates :email, presence: true, format: { with: /\A[A-Za-z0-9!#$%&'*+\-\/=?^_`{|}~.]{1,64}@[A-Za-z0-9\-]+(?:\.[A-Za-z0-9\-]+)*(?:\.[A-Za-z]{1,128})\z/, message: "formato inválido" }, length: { maximum: 192 }
  validates :password, presence: true, length: { minimum: 10, maximum: 72, message: 'deve ter no mínimo 10 caracteres e no máximo 72 caracteres' }
  validate :password_complexity

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @email = attributes[:email]
    @password = attributes[:password]
  end

  private

  def password_complexity
    return unless password.present?

    unless password.match?(/\A(?=.*[0-9].*[0-9])(?=.*[!@#$%^&*().,?":{}|<>].*[!@#$%^&*().,?":{}|<>])(?=.*[A-Z].*[A-Z])(?=.*[a-z].*[a-z])\S+\z/)
      errors.add(:password, 'deve incluir pelo menos 2 dígitos, 2 caracteres especiais, 2 letras maiúsculas e 2 letras minúsculas')
    end
  end
end
