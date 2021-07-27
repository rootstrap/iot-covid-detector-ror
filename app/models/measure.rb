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
class Measure < ApplicationRecord
  belongs_to :sensor

  validates :value, presence: true
end
