# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MemberService::Create, type: :service do
  let!(:service) { described_class.new(member) }
  let(:member) { attributes_for(:member) }

  describe '#create' do
    context 'when success' do
      before do
        service.create
      end

      it 'returns member instance' do
        expect(service.member).to be_instance_of(Member)
      end

      it 'returns member list' do
        expect(service.list.count).to eq(1)
      end
    end

    context 'when error' do
      let(:member) { attributes_for(:member, name: 'Ary') }

      before do
        service.create
      end

      it 'errors is not nil' do
        expect(service.errors).not_to be_nil
      end

      it 'errors is not nil' do
        expect(service.errors).to eq(['name is too short (minimum is 5 characters)'])
      end
    end
  end
end
