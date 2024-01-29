# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MemberService::Read, type: :service do
  let(:member_service) { described_class.new }

  before do
    described_class.clear_members # Limpar a lista antes de cada teste
    described_class.initialize_members_if_needed
  end

  describe '#find' do
    it 'returns nil when member is not found' do
      expect(member_service.find(1)).to be_nil
    end

    it 'returns the member when found' do
      member = build(:member)
      member_service.class.members << member
      expect(member_service.find(member.id)).to eq(member)
    end
  end

  describe '#find_by_email_and_password' do
    it 'returns nil when member is not found' do
      expect(member_service.find_by_email_and_password('nonexistent@example.com', 'password')).to be_nil
    end

    it 'returns the member when found by email and password' do
      member = build(:member)
      member_service.class.members << member
      expect(member_service.find_by_email_and_password(member.email, member.password)).to eq(member)
    end
  end

  describe '#list' do
    it 'returns the list of members' do
      members = [
        build(:member, id: 1, name: "Janetta Kulas", email: "jarrett.veum@welch.test", password: "99jYUO%AL5ct$9"),
        build(:member, id: 2, name: "Alphonse Gibson", email: "clint@greenholt.example", password: "pR57@E0uZS&"),
        build(:member, id: 3, name: "Connie Stiedemann", email: "karly@rippin.example", password: "nF88EHHnUc@D"),
        build(:member, id: 4, name: "Theodore Bayer", email: "louis@kassulke-runolfsson.example", password: "Ny%^QcdX7!@2F*u"),
        build(:member, id: 5, name: "Patricia Dickinson", email: "jinny@rolfson-gislason.test", password: "j6EW3!@&36$RgIwL0iKy")
      ]

      members.each { |member| member_service.class.members << member }
      expect(member_service.list).to contain_exactly(*members)
    end
  end
end
