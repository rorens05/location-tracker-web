ActiveAdmin.register Tracker do

  permit_params :name, :description, :reference_number, :image

  index do
    selectable_column
    id_column
    column :image do |tracker|
      if tracker.image.attached?
        image_tag(tracker.image.variant(resize: '100x100'))
      else
        image_tag('/images/no-image.png', style: 'width: 100px;')
      end
    end
    column :name
    column :description
    column :reference_number
    actions
  end

  form do |f|
    f.inputs "Tracker Details" do
      f.input :image, as: :file
      f.input :name
      f.input :description
      f.input :reference_number
    end
    f.actions
  end

  show do
    panel tracker.name do
      columns do
        column span: 3 do
          attributes_table_for tracker do
            row :name
            row :description
            row :reference_number
          end
          a "View in map", target: '_blank', href: admin_map_path(reference_number: tracker.reference_number ), class: 'button'
          br
          br
          h3 "Location History"
          table_for resource.location_histories.order(location_date: :desc) do 
            column :latlong
            column :location_date
          end
        end
        if tracker.image.attached? 
          column span: 1 do
            image_tag(tracker.image.variant(resize: '200x200')) if tracker.image.attached?
          end
        end
      end

    end
  end
  
end
