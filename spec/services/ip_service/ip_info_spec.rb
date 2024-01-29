# spec/services/ip_service/ip_info_spec.rb

require 'rails_helper'
require 'webmock/rspec'

RSpec.describe IpService::IpInfo, type: :service do
  let(:ip_info_service) { described_class.new('8.8.8.8') }

  before do
    # Configurando o stub para simular a resposta da solicitação HTTP
    stub_request(:get, 'https://ipinfo.io/8.8.8.8?token=1624919ce2bea9')
      .to_return(
        body: '{"ip": "8.8.8.8", "city": "Mountain View", "region": "California", "country": "US"}',
        headers: { 'Content-Type' => 'application/json' }
      )
  end

  describe '#info' do
    it 'returns information about the IP' do
      info = ip_info_service.info

      expect(info['ip']).to eq('8.8.8.8')
      expect(info['city']).to eq('Mountain View')
      expect(info['region']).to eq('California')
      expect(info['country']).to eq('US')
    end
  end
end
