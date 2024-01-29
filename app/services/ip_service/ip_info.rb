# frozen_string_literal: true

require 'net/http'
require 'json'

module IpService
  # app/services/ip_service/ip_info.rb
  class IpInfo
    BASE_URL = 'https://ipinfo.io'

    def initialize(ip)
      @ip = ip
    end

    def info
      uri = URI("#{BASE_URL}/#{@ip}?token=1624919ce2bea9")
      response = Net::HTTP.get(uri)
      JSON.parse(response)
    end
  end
end
