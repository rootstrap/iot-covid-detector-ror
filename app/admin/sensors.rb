ActiveAdmin.register Sensor do
  permit_params :device_id, :description

  form do |f|
    f.input :device, as: :select, collection: Device.all.map { |u|
                                                [u.name, u.id]
                                              }, include_blank: false
    f.input :description

    actions
  end
end
