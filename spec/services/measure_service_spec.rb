# frozen_string_literal: true

describe 'MeasureService' do
  describe '#new_measure' do
    let(:value) { Faker::Number.between(100, 1000) }

    context 'when the sensor exists' do
      subject { MeasureService.new(sensor.id).new_measure(value) }

      let(:sensor) { create(:sensor) }

      it 'creates a measure' do
        expect { subject }.to change { sensor.measures.count }.from(0).to(1)
      end
    end

    context 'when the sensor does not exist' do
      subject { MeasureService.new(123).new_measure(value) }

      it 'does not save the measure' do
        expect { subject }.not_to change(Measure, :count)
      end
    end
  end
end
