class CocktailsController < ApplicationController
  def home
    @cocktails = Cocktail.all
    @cocktail_random = @cocktails.sample
  end
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
    @ingredients = Ingredient.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.save
   redirect_to cocktail_path(@cocktail)
  end

  private
  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end

end

