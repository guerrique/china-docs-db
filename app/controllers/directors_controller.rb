class DirectorsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    if params[:query].present?
      @directors = Director.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @directors = Director.all
    end
  end

  def show
    @director = Director.find(params[:id])
  end

  def new
    @director = Director.new # needed to instantiate the form_for
    @director.pages.build
    @director.docs.build
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

  def edit
    @director = Director.find(params[:id])
  end

  def update
    @director = Director.find(params[:id])
    @director.update(director_params)

    redirect_to director_path(@director)
  end

  def destroy
    @director = Director.find(params[:id])
    @director.destroy

    redirect_to directors_path
  end

  private

  def director_params
    params.require(:director)
    .permit(:name,
      :bio_short,
      :bio_long,
      :bio_source,
      :birth_year,
      :death_year,
      :photo,
      doc_ids: [],
      pages_attributes: [:id, :description, :url, :_destroy],
      directors_attributes: [:id, :name])
  end
end
