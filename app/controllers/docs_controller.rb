class DocsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    if params[:query].present?
      @docs = Doc.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @docs = Doc.all
    end
  end

  def show
    @doc = Doc.find(params[:id])
  end

  def new
    @doc = Doc.new # needed to instantiate the form_for
    @doc.awards.build
    @doc.links.build
    @doc.directors.build
  end

  def create
    @doc = Doc.new(doc_params)
    if @doc.save
      flash[:notice] = 'Doc has been successfully created.'
      redirect_to docs_path(@doc)
    else
      render :new
    end
  end

  def edit
    @doc = Doc.find(params[:id])
  end

  def update
    @doc = Doc.find(params[:id])
    @doc.update(doc_params)

    redirect_to doc_path(@doc)
  end

  def destroy
    @doc = Doc.find(params[:id])
    @doc.destroy

    redirect_to docs_path
  end

  private

  def doc_params
    params.require(:doc)
    .permit(:name,
      :chinese_name,
      :year,
      :duration,
      :doc_summary_short,
      :doc_summary_long,
      :doc_summary_source,
      :trailer_link,
      :poster,
      director_ids: [],
      awards_attributes: [:id, :name, :year, :location, :_destroy],
      links_attributes: [:id, :description, :url, :_destroy],
      directors_attributes: [:id, :name]
      )
  end
end
