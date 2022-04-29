class DirectorsController < ApplicationController
  def index
    @directors = Director.all
  end

  def show
    @director = Director.find(params[:id])
  end

  def new
    @director = Director.new # needed to instantiate the form_for
  end

  def create
    @director = Director.new(director_params)
    if @director.save
      flash[:notice] = 'Director has been successfully created.'
      redirect_to directors_path(@director)
    else
      render :new
    end
  end

  private

  def director_params
    params.require(:director).permit(:name)
  end
end
