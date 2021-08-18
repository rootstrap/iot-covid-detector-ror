# frozen_string_literal: true

# == Schema Information
#
# Table name: sensors
#
#  id          :bigint           not null, primary key
#  device_id   :bigint
#  description :string
#  external_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_sensors_on_device_id    (device_id)
#  index_sensors_on_external_id  (external_id) UNIQUE
#
require 'rails_helper'

RSpec.describe Sensor, type: :model do
  describe 'associations' do
    it 'belongs to device' do
      is_expected.to belong_to(:device)
    end

    it 'has many measures' do
      is_expected.to have_many(:measures)
    end
  end

  describe 'validations' do
    it 'validate presences' do
      is_expected.to validate_presence_of(:external_id)
    end

    it 'validate uniqueness' do
      is_expected.to validate_uniqueness_of(:external_id)
    end
  end
end
