require 'rails_helper'

RSpec.describe User, type: :model do
  describe '.import!' do
    it 'add create in  database users from file' do
      User.import!
      expect(User.first.name).to eq 'Christina McArdle'
      expect(User.last.name).to eq 'David Behan'
    end

    it 'change users number in database' do
      expect(User.all.size).to eq(0)
      User.import!
      expect(User.all.size).to eq(32)
    end
  end

  describe '.distance' do
    let!(:lat) { 77.1804 }
    let!(:long) { 129.55 }
    it 'return 5182291' do
      expect(User.distance(lat, long)).to eq(5182291)
    end
  end
end
