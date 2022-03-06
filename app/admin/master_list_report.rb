ActiveAdmin.register_page "MasterListReport" do
  menu priority: 1, parent: "Reports", label: "Master List Report"

  content title: "Master List Report" do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      div class: 'header' do
        para "Reports of ledgers"
      end
    end
  end 
end
