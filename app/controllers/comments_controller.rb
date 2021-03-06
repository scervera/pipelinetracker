class CommentsController < ApplicationController
  # The order of these before actions is vital to functionality
  before_action :get_opportunity
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    #@comments = Comment.all
    @comments = @opportunity.comments.order(created_at: :asc)
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    #@comment = Comment.new
    @comment = @opportunity.comments.build
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    # @comment = Comment.new(comment_params)
    @comment = @opportunity.comments.build(comment_params)

    respond_to do |format|
      if @comment.save
        format.js

        #format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        #format.html { redirect_to opportunity_comments_path(@opportunity), notice: 'Comment was successfully created.' }
        #format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        #format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.html { redirect_to opportunity_comment_path(@opportunity), notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      #format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.html { redirect_to opportunity_comments_path(@opportunity), notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def get_opportunity
      @opportunity = Opportunity.find(params[:opportunity_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    #def set_comment
      #@comment = Comment.find(params[:id])
      #@comment = @opportunity.comments.find(params[:id])
    #end
    def set_comment
      #@comment = Comment.find(params[:id])
      @comment = @opportunity.comments.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:author, :content, :opportunity_id)
    end
end
