# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MemberService::Read, type: :service do
  let(:service) { described_class.new }
  let(:member) { build(:member) }

  describe '#find' do
    context 'when members nil' do
      it 'returns nil' do
        expect(service.find(1)).to eq(nil)
      end
    end

    context 'when members exists' do
      before do
        service.members << member
      end
      it 'returns member instance' do
        expect(service.find(1)).to be_instance_of(Member)
      end
    end
  end

  describe '#list' do
    context 'when members is empty' do
      it 'returns empty array' do
        expect(service.list).to eq([])
      end
    end

    context 'when members is not empty' do
      before do
        service.members << member
        service.members << member
      end
      it 'returns list size equal 2' do
        expect(service.list.count).to eq(2)
      end
    end
  end
end
