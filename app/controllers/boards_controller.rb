# Protected Controller to index only current user's boards
class BoardsController < ProtectedController
  before_action :set_cheeses, only: [:show, :update]
  before_action :set_board, only: [:destroy]
  # GET /boards
  # GET /boards.json
  def index
    @boards = Board.all

    # render json: @boards
    render json: base_query
  end

  # GET /boards/1
  # GET /boards/1.json
  def show
    render json: @board
  end

  # POST /boards
  # POST /boards.json
  def create
    @board = Board.new(board_params)

    if @board.save
      render json: @board, status: :created, location: @board
    else
      render json: @board.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /boards/1
  # PATCH/PUT /boards/1.json
  def update
    @board = Board.find(params[:id])

    if @board.update(board_params)
      render json: @board
    else
      render json: @board.errors, status: :unprocessable_entity
    end
  end

  # DELETE /boards/1
  # DELETE /boards/1.json
  def destroy
    @board.destroy

    head :no_content
  end

  private

  def set_cheeses
    @board = Board.find(params[:id]).cheeses
  end

  def set_board
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:name, :user_id)
  end

  def base_query
    Board.where('user_id = :user', user: current_user.id)
  end
end
