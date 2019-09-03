class MainController < ApplicationController
  def index
    @folders = Folder.where(parent: nil)
    @notes = Note.where(folder: nil)

    @current_folder = nil
  end
end
