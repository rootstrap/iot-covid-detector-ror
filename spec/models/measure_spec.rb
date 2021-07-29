# frozen_string_literal: true

# == Schema Information
#
# Table name: measures
#
#  id         :bigint           not null, primary key
#  sensor_id  :bigint
#  value      :float            not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_measures_on_sensor_id  (sensor_id)
#
require 'rails_helper'

RSpec.describe Measure, type: :model do
  describe 'associations' do
    it 'belongs to sensor' do
      is_expected.to belong_to(:sensor)
    end
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:value) }
  end
end
