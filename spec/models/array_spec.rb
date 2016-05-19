require 'rails_helper'
require_relative '../../app/models/array'

RSpec.describe Array, type: :model do
  describe '#flatten_out!' do
    let!(:array) { [12, [23, 3, [1], 34, 77], 277, 12, [333, [33,[3]]]] }

    it 'add create in  database users from file' do
      expect(array.flatten_out!).to eq [12, 23, 3, 1, 34, 77, 277, 12, 333, 33, 3]
    end
  end
end
