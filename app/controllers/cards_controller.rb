class CardsController < ApplicationController
  before_action :set_board
  
  def index
    @cards = @board.cards
  end
  
  def new
    @card = @board.cards.new
  end
  
  def create
    @card = @board.cards.create!(card_params)
    respond_to do |format|
      format.html { redirect_to board_path }
      format.js
    end
  end
  
  def update
    @card = @board.cards.find(params[:id])
    @card.update_attributes!(params[:card])
    respond_to do |format|
      format.html { redirect_to board_path }
      format.js
    end
  end
  
  
  def destroy
    @card = @board.cards.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to board_path }
      format.js
    end
  end
  
  
  private
  
  def card_params
    params.require(:card).permit(:name)
  end
  
  def set_board
    @board = Board.find_by!(slug: params[:board_id])
  end
end