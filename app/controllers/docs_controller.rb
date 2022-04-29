class DocsController < ApplicationController
  def index
    @docs = Doc.all
  end

  def show
    @doc = Doc.find(params[:id])
  end

  def new
    @doc = Doc.new # needed to instantiate the form_for
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

  private

  def doc_params
    params.require(:doc).permit(:name)
  end
end
