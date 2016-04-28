class CheeseAdditionsController < ApplicationController
  before_action :set_cheese_addition, only: [:show, :update, :destroy]

  # GET /cheese_additions
  # GET /cheese_additions.json
  def index
    @cheese_additions = CheeseAddition.all

    render json: @cheese_additions
  end

  # GET /cheese_additions/1
  # GET /cheese_additions/1.json
  def show
    render json: @cheese_addition
  end

  # POST /cheese_additions
  # POST /cheese_additions.json
  def create
    @cheese_addition = CheeseAddition.new(cheese_addition_params)

    if @cheese_addition.save
      render json: @cheese_addition, status: :created, location: @cheese_addition
    else
      render json: @cheese_addition.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cheese_additions/1
  # PATCH/PUT /cheese_additions/1.json
  def update
    @cheese_addition = CheeseAddition.find(params[:id])

    if @cheese_addition.update(cheese_addition_params)
      head :no_content
    else
      render json: @cheese_addition.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cheese_additions/1
  # DELETE /cheese_additions/1.json
  def destroy
    @cheese_addition.destroy

    head :no_content
  end

  private

    def set_cheese_addition
      @cheese_addition = CheeseAddition.find(params[:id])
    end

    def cheese_addition_params
      params.require(:cheese_addition).permit(:board_id, :cheese_id)
    end
end
