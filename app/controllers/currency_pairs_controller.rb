class CurrencyPairsController < ApplicationController
  before_action :set_currency_pair, only: [:show, :edit, :update, :destroy]

  def index
    @currency_pairs = CurrencyPair.all
  end

  def show
  end

  def new
    @currency_pair = CurrencyPair.new
  end

  def edit
  end

  def create
    @currency_pair = CurrencyPair.new(currency_pair_params)

    if @currency_pair.save
      redirect_to @currency_pair, notice: 'Currency pair was successfully created.'
    else
      render :new
    end
  end

  def update
    if @currency_pair.update(currency_pair_params)
      redirect_to @currency_pair, notice: 'Currency pair was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @currency_pair.destroy
    redirect_to currency_pairs_url, notice: 'Currency pair was successfully destroyed.'
  end

  private
    def set_currency_pair
      @currency_pair = CurrencyPair.find(params[:id])
    end

    def currency_pair_params
      params.require(:currency_pair).permit(:amount, :target, :duration)
    end
end