class CollectionsController < ApplicationController
before_action :authenticate_user!
before_action :set_collection, only: [:show, :edit, :update, :destroy]

def set_collection
  @collection = current_user.collections.find(params[:id])
end
def index
    @collections = current_user.collections
  end

  def show
    @collection = current_user.find(params [:id])
  end

  def new
    @collection = Collection.new
  end

  def create
    @collection = current_user.collections.build(collection_params)

    if @collection.save
      redirect_to @collection, notice: "collection créée avec succès"
    else
      render :new, status: unprocessable_entity
    end
  end
   private
   def collection_params
     params.require(:collection).permit(:name)
   end
  def edit
    @collection = current_user.collection
  end

  def update
    @collection = current_user.collections.find(params[:id])

    if @collection.update(collection_params)
    redirect_to @collection, notice: "Le nom a été modifié!"
   else
    render :edit, status: :unprocessable_entity
   end
  end

   def destroy
    @collection = current_user.collections.find(params[:id])
    collection_name = @collection.name
    @collection.destroy

    redirect_to collection_path, notice: "#{collection_name} Collection supprimée"
  end
end
