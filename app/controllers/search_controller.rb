class SearchController < FrontController
  def index
    # begin_datetime = params[:begin_datetime]
    # end_datetime = params[:end_datetime]
    # person_count = params[:person_count]
    render json: params
  end
end