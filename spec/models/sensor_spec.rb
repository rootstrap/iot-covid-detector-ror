# frozen_string_literal: true

# == Schema Information
#
# Table name: sensors
#
#  id          :bigint           not null, primary key
#  device_id   :bigint
#  description :string
#
# Indexes
#
#  index_sensors_on_device_id  (device_id)
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
end
