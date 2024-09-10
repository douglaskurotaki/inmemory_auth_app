class IpinfoGateway
  IPINFO_HOST = ENV.fetch('IPINFO_HOST')
  IPINFO_TOKEN = ENV.fetch('IPINFO_TOKEN')
  FORMAT = 'json'.freeze

  def self.fetch_location(http_adapter: HttpAdapter)
    http_adapter.get("#{IPINFO_HOST}/#{FORMAT}?token=#{IPINFO_TOKEN}").body
  end
end
