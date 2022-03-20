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
