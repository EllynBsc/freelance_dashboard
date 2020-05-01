class NotesController < ApplicationController
 def new
    @note = Note.new
    @note.taggings.build
  end

  def create
    @note = Note.new(note_params)
    # raise
    @note.user = current_user
    if @note.save
      redirect_to notes_path
    else
      render :new
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    @note.update(note_params)
    if @note
      redirect_to notes_path
    else
      render :edit
    end
  end

  def destroy
   @note = Note.find(params[:id])
   @note.destroy
   redirect_to notes_path
  end

  def index
    @notes = Note.all
  end

  def show
    @note = Note.find(params[:id])
  end

  private

  def note_params
    params.require(:note).permit(:title, :content, :taggings_attributes)
  end

end
