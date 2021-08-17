ActiveAdmin.register Device do
  permit_params :description, :os, :external_id, :name

  form do |f|
    f.input :name
    f.input :description
    f.input :os
    f.input :external_id

    f.actions
  end
end
