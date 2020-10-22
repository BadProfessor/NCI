class AddsController < ApplicationController
  before_action :set_add, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # defines All Ads posted 
def index
  @adds = Add.all

  end
  

# defines the posted by users only
  def myads
     @adds = Add.all
  end
  
  
 # defines the paramaters passed into the fields a queries for matches
  def search
     @adds=Add.where("title LIKE ?", "%" + params[:q] + "%")
  end


  def show
  end

  # defines the Newly created Ad
  def new
    @add = current_user.adds.build
  end


  def edit
  end

  # defines the New Add creation
  def create
    @add = current_user.adds.build(add_params)

    respond_to do |format|
      if @add.save
        format.html { redirect_to @add, notice: 'Add was successfully created.' }
        format.json { render :show, status: :created, location: @add }
      else
        format.html { render :new }
        format.json { render json: @add.errors, status: :unprocessable_entity }
      end
    end
  end

  # defines the update function
  def update
    respond_to do |format|
      if @add.update(add_params)
        format.html { redirect_to @add, notice: 'Add was successfully updated.' }
        format.json { render :show, status: :ok, location: @add }
      else
        format.html { render :edit }
        format.json { render json: @add.errors, status: :unprocessable_entity }
      end
    end
  end

  # defines the DELETE function  
  def destroy
    @add.destroy
    respond_to do |format|
      format.html { redirect_to adds_url, notice: 'Add was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_add
      @add = Add.find(params[:id])
    end

    # only allow the defined items list through.
    def add_params
      params.require(:add).permit(:category, :title, :description, :vintage, :price, :image, :user_id,)
    end
end