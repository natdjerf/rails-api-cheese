class CheesesController < ApplicationController
  before_action :set_cheese, only: [:show, :update, :destroy]

  # GET /cheeses
  # GET /cheeses.json
  def index
    @cheeses = Cheese.all

    render json: @cheeses
  end

  # GET /cheeses/1
  # GET /cheeses/1.json
  def show
    render json: @cheese
  end

  # POST /cheeses
  # POST /cheeses.json
  def create
    @cheese = Cheese.new(cheese_params)

    if @cheese.save
      render json: @cheese, status: :created, location: @cheese
    else
      render json: @cheese.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cheeses/1
  # PATCH/PUT /cheeses/1.json
  def update
    @cheese = Cheese.find(params[:id])

    if @cheese.update(cheese_params)
      head :no_content
    else
      render json: @cheese.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cheeses/1
  # DELETE /cheeses/1.json
  def destroy
    @cheese.destroy

    head :no_content
  end

  private

    def set_cheese
      @cheese = Cheese.find(params[:id])
    end

    def cheese_params
      params.require(:cheese).permit(:family, :name, :milk_type, :country_of_origin, :flavor)
    end
end
