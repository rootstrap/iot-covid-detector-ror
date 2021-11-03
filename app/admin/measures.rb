# frozen_string_literal: true

ActiveAdmin.register Measure do
  permit_params :sensor_id, :value, :created_at
end
