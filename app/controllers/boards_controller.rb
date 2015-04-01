class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]

  def index
    @board = Board.new
  end

  def show
    @cards = @board.cards
    @backlog = @board.cards.where(position: "backlog")
    @doing = @board.cards.where(position: "doing")
    @done = @board.cards.where(position: "done")
  end

  def new
    @board = Board.new
  end

  def edit
  end


  def create
    @board = Board.new(board_params)
    
    respond_to do |format|
      if @board.save
        format.html { redirect_to @board, notice: 'Board was successfully created. Share it!' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @board.update(board_params)
        format.html { redirect_to @board, notice: 'This is your board. Now share it!' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @board.destroy
    respond_to do |format|
      format.html { redirect_to boards_url }
    end
  end

  private
  
    def set_board
      @board = Board.find_by(slug: params[:id])
    end

    def board_params
      params.require(:board).permit(:name, :card)
    end
    
end
