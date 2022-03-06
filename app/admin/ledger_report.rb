ActiveAdmin.register_page "LedgerReport" do
  menu priority: 1, parent: "Reports", label: "Ledger Report"

  content title: "Ledger Report" do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      div class: 'header' do
        para "Reports of ledgers"
      end
    end
  end 
end
