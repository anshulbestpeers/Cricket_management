class PlayersController < ApplicationController
  before_action :parse_stats, only: %i[create update]
  before_action :set_player, only: %i[ show edit update destroy ]

  def index
    @players = Player.all
  end

  def new
    @player = Player.new
  end

  def show
  end

  def edit
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to players_path
    else
      render :new
    end
  end

  def update
    if @player.update(player_params)
      ScoresUpdatesChannel.broadcast_to(@player, player: @player)
      redirect_to players_path
    else
      render :edit
    end
  end
  
  private 

  def player_params
    params.require(:player).permit(:name, :role, batting_stats: {}, bowling_stats: {})
  end

  def set_player
    @player = Player.find(params[:id])
  end

  def parse_stats
    if params[:player] && params[:player][:batting_stats].is_a?(String) && !params[:player][:batting_stats].empty? 
      params[:player][:batting_stats] = JSON.parse(params[:player][:batting_stats])
    elsif params[:player] && params[:player][:bowling_stats].is_a?(String) && !params[:player][:bowling_stats].empty?
      params[:player][:bowling_stats] = JSON.parse(params[:player][:bowling_stats])
    end
  rescue JSON::ParserError => e
    flash.now[:alert] = "Error parsing stats JSON: #{e.message}"
  end
end
