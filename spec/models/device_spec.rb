# frozen_string_literal: true

# == Schema Information
#
# Table name: devices
#
#  id          :bigint           not null, primary key
#  description :string
#  os          :integer
#
require 'rails_helper'

RSpec.describe Device, type: :model do
  describe 'associations' do
    it 'has many sensors' do
      is_expected.to have_many(:sensors)
    end
  end
end
