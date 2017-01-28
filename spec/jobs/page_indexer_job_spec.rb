require 'rails_helper'

RSpec.describe PageIndexerJob, type: :job do
  let(:link) { double('Link') }
  subject(:job) { described_class.new(link) }

  it 'is in default queue' do
    expect(described_class.new.queue_name).to eq('default')
  end

  after do
    clear_enqueued_jobs
    clear_performed_jobs
  end
end
