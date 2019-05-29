class CommentFilesController < ApplicationController
  before_action :set_comment_file, only: %i[show edit update destroy]

  # GET /comment_files
  def index
    @comment_files = CommentFile.all
  end

  # GET /comment_files/1
  def show; end

  # GET /comment_files/new
  def new
    @comment_file = CommentFile.new
  end

  # GET /comment_files/1/edit
  def edit; end

  # POST /comment_files
  def create
    @comment_file = CommentFile.new(comment_file_params)

    if @comment_file.save
      redirect_to @comment_file, notice: 'Comment file was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /comment_files/1
  def update
    if @comment_file.update(comment_file_params)
      redirect_to @comment_file, notice: 'Comment file was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /comment_files/1
  def destroy
    @comment_file.destroy
    redirect_to comment_files_url, notice: 'Comment file was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment_file
      @comment_file = CommentFile.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_file_params
      params.require(:comment_file).permit(:comment_id, :file)
    end
end
