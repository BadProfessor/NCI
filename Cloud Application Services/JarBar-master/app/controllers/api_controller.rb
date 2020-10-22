module Api
  module V1
class Api::V1::ApiController < AddsController
  respond_to :json
  before_action :authenticate


  # defines All Ads posted 
def index
    adds = Add.order('created_at DESC')
  render json: {status: 'SUCCESS', message:'add has been loaded', data:adds},status: :ok
  end
  
  def show
    add = Add.find(params[:id])
    render json: {status: 'SUCCESS', message:'specified add has been loaded', data:add},status: :ok
  end
  
  def create
    add = current_user.adds.build(add_params)
 
    if add.save  
      render json: {status: 'SUCCESS', message:'add has been Saved', data:add},status: :ok
  else
    render json: {status: 'WARNING!!!', message:'add has not beed saved', data:add.errors},status: :unprocessable_entity
  end
  end
  
  private
  
  def add_params
    params.permit(:category, :title, :description, :vintage, :price)
  end
  
  def authenticate
      authenticate_or_request_with_http_token do |token, _options|
        User.find_by(token: token)
      end
    def current_user
         @current_user ||= authenticate
       end
  end
end
end
end
