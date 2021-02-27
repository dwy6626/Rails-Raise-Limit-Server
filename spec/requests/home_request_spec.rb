RSpec.describe :Home, type: :request do
  let(:memory_store) { ActiveSupport::Cache.lookup_store(:memory_store) }

  before do
    allow(Rails).to receive(:cache).and_return(memory_store)
    Rails.cache.clear
  end

  before { Rack::Attack.reset! }

  let(:limit) { 60 }
  let(:ip1) { '1.2.3.4' }
  let(:ip2) { '1.2.3.3' }

  it do
    get '/', env: { "REMOTE_ADDR": ip1 }
    expect(request.ip).to eq ip1
  end

  describe 'rate limit throttler' do
    it 'throttle when over limit' do
      1.upto(limit + 100) do |i|
        get '/', env: { "REMOTE_ADDR": ip1 }
        expect(response.status).to eq 200 if i <= limit
        expect(response.status).to eq 429 if i > limit
      end
    end

    it 'ip count independently' do
      1.upto(limit * 2) do |i|
        get '/', env: { "REMOTE_ADDR": i.even? ? ip1 : ip2 }
        expect(response.status).to eq 200
      end

      [ip1, ip2].each do |ip|
        get '/', env: { "REMOTE_ADDR": ip }
        expect(response.status).to eq 429
      end
    end
  end
end
