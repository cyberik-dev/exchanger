require 'spec_helper'

RSpec.describe User, type: :model do
  context 'associations' do
    it { should have_many(:currency_pairs) }
  end
end
