class HomeController < FrontController
  def index
    @search = Search.new
    @search_result ||= [] 
  end

  def search
    @search = Search.new(search_params)
    @search_result = @search.perform(search_params)
    redirect_to search_result_path(rooms: @search_result)
  end

  def search_result
    @rooms = Room.includes(:room_type, :hotel).find(params[:rooms])
  end

  private

  def search_params
    params.require(:search).permit(:begin_date, :end_date, :person_count, :room_type)
  end
end