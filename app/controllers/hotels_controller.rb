class HotelsController < FrontController
  def index
    @hotels = Hotel.includes(:hotel_type)
    @search = Search.new
  end

  def search
    search = Search.new(search_params)
    @search_result = search.perform
    render json: @search_result
  end

  private

  def search_params
    params.require(:search).permit(:begin_date, :end_date, :person_count, :room_type)
  end
end