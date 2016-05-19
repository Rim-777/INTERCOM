require 'rails_helper'

RSpec.describe User, type: :model do

  describe '.distance' do
    let!(:lat) { 77.1804 }
    let!(:long) { 129.55 }
    it 'return 5182291' do
      expect(User.distance(lat, long)).to eq(5182291)
    end
  end
end
