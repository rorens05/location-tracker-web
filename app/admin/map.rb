ActiveAdmin.register_page "Map" do
  menu false
  content title: "Map" do
    div class: "blank_slate_container", id: "Map_default_message" do
      render 'main_map'
    end
  end
end
