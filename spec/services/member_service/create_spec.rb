# frozen_string_literal: true

# spec/services/member_service/create_spec.rb
require 'rails_helper'

RSpec.describe MemberService::Create, type: :service do
  describe '#create' do
    let(:member) { build(:member) }

    subject { described_class.new(member) }

    context 'when member is valid' do
      it 'creates a new member' do
        expect { subject.create }.to change { subject.list.count }.by(1)
      end

      it 'assigns an ID to the member' do
        subject.create
        expect(subject.member.id).to be_present
      end

      it 'returns true' do
        expect(subject.create).to eq(true)
      end
    end

    context 'when member is invalid' do
      before { member.name = nil } # Making the member invalid

      it 'does not create a new member' do
        expect { subject.create }.not_to change { subject.list.count }
      end

      it 'returns false' do
        expect(subject.create).to eq(false)
      end

      it 'logs validation errors' do
        expect(Rails.logger).to receive(:error).at_least(:once)
        subject.create
      end
    end
  end
end
