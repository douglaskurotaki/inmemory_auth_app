require 'rails_helper'

RSpec.describe IpinfoGateway do
  describe '.fetch_location' do
    let(:json_response) do
      {
        'ip': '8.8.8.8',
        'hostname': 'dns.google',
        'city': 'Mountain View',
        'region': 'California',
        'country': 'US'
      }.to_json
    end
    let(:url) { "#{described_class::IPINFO_HOST}/#{described_class::FORMAT}?token=#{described_class::IPINFO_TOKEN}" }
    let(:fake_response) { instance_double(Faraday::Response, body: json_response) }
    let(:result) { IpinfoGateway.fetch_location }

    before do
      allow(HttpAdapter).to receive(:get).and_return(fake_response)
    end

    it 'calls the HttpAdapter with the correct URL' do
      result
      expect(HttpAdapter).to have_received(:get).with(url)
    end

    it 'returns the body of the response as JSON' do
      expect(result).to eq(json_response)
    end
  end
end
