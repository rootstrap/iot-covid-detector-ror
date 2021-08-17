ActiveAdmin.register Sensor do
  permit_params :device_id, :description, :external_id

  form do |f|
    f.input :device, as: :select, collection: Device.all.map { |u|
                                                [u.name, u.id]
                                              }, include_blank: false
    f.input :description
    f.input :external_id

    f.actions
  end
end
