# frozen_string_literal: true

# == Schema Information
#
# Table name: devices
#
#  id          :bigint           not null, primary key
#  description :string
#  os          :integer
#  name        :string
#
require 'rails_helper'

RSpec.describe Device, type: :model do
  describe 'associations' do
    it 'has many sensors' do
      is_expected.to have_many(:sensors)
    end
  end

  describe 'validations' do
    it 'validate presences' do
      is_expected.to validate_presence_of(:name)
    end

    it 'validate uniqueness' do
      is_expected.to validate_uniqueness_of(:name)
    end
  end
end
