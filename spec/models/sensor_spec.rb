# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Sensor, type: :model do
  describe 'associations' do
    it 'belongs to device' do
      is_expected.to belong_to(:device)
    end
  end
end
