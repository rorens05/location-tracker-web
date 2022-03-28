class Api::V2::LocationsController < Api::V2::ApiController


  def index
    if params[:reference_number]
      @location_histories = LocationHistory.where(tracker: Tracker.find_by_reference_number(params[:reference_number]))
      render json: @location_histories.as_json(include: [
        {
          tracker: {
            methods: [:image_path]
          }
        }
      ]), status: :ok
    else
      render json: []
    end
  end

  def create
    @location_history = LocationHistory.new(
      tracker: Tracker.find_by_reference_number(params[:reference_number]),
      latlong: params[:latlong],
      location_date: params[:location_date]
    )
    if @location_history.save
      render json: @location_history, status: :created
    else
      render json: @location_history.errors.full_messages, status: :unprocessable_entity
    end
  end

end
