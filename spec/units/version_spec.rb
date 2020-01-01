# frozen_string_literal: true

RSpec.describe 'GemTemplate version' do
  specify { expect(GemTemplate::VERSION).to eq('0.1.0') }
end
