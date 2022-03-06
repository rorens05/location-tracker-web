ActiveAdmin.register_page "LedgerReport" do
  menu priority: 1, parent: "Reports", label: "Ledger Report"

  content title: "Ledger Report" do
    start_date = Date.today
    end_date = Date.today
    particular = "all"
    user = nil
    if params["date-range"].present?
      start_date = Date.strptime(params["date-range"].split(" - ")[0], '%m/%d/%Y')
      end_date = Date.strptime(params["date-range"].split(" - ")[1], '%m/%d/%Y')
    end
    if params[:particular].present?
      particular = params[:particular]
    end
    if params[:user_id].present?
      user = User.find_by_id(params[:user_id])
    end
    render 'reports', start_date: start_date, end_date: end_date, particular: particular, user: user
  end 
end
