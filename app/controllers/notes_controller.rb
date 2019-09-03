class NotesController < ApplicationController
  def index
  end

  def create
    note = Note.new(note_params)

    note.save!

    redirect_back fallback_location: root_path
  end

  def show
    @note = Note.find_by(id: params[:id])
    @folder = @note.folder

    @folders = @folder&.folders || []
  end

  private

  def note_params
    params.require(:note).permit(:name, :content, :folder_id)
  end
end
