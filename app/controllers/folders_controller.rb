class FoldersController < ApplicationController
  def index
    # Just get root folders
    folders = Folder.where(parent: nil)

    render(
      adapter: :json,
      root: :data,
      json: folders,
      status: :ok
    )
  end

  def create
    folder = Folder.new(folder_params)

    folder.save!

    redirect_to(root_path) and return if folder.parent.nil?

    redirect_to(folder_path(folder))
  end

  def show
    @folder = Folder.find_by(id: params[:id])

    @folders = @folder.folders
    @notes = @folder.notes
    @current_folder = @folder
  end

  private

  def folder_params
    params.require(:folder).permit(:name, :parent_id)
  end
end
