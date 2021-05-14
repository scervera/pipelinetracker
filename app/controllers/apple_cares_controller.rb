class AppleCaresController < ApplicationController
  before_action :set_apple_care, only: [:show, :edit, :update, :destroy]

  # GET /apple_cares
  # GET /apple_cares.json
  def index
    @apple_cares = AppleCare.all
  end

  # GET /apple_cares/1
  # GET /apple_cares/1.json
  def show
  end

  # GET /apple_cares/new
  def new
    @apple_care = AppleCare.new
  end

  # GET /apple_cares/1/edit
  def edit
  end

  # POST /apple_cares
  # POST /apple_cares.json
  def create
    @apple_care = AppleCare.new(apple_care_params)

    respond_to do |format|
      if @apple_care.save
        format.html { redirect_to @apple_care, notice: 'Apple care was successfully created.' }
        format.json { render :show, status: :created, location: @apple_care }
      else
        format.html { render :new }
        format.json { render json: @apple_care.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apple_cares/1
  # PATCH/PUT /apple_cares/1.json
  def update
    respond_to do |format|
      if @apple_care.update(apple_care_params)
        format.html { redirect_to @apple_care, notice: 'Apple care was successfully updated.' }
        format.json { render :show, status: :ok, location: @apple_care }
      else
        format.html { render :edit }
        format.json { render json: @apple_care.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apple_cares/1
  # DELETE /apple_cares/1.json
  def destroy
    @apple_care.destroy
    respond_to do |format|
      format.html { redirect_to apple_cares_url, notice: 'Apple care was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apple_care
      @apple_care = AppleCare.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def apple_care_params
      params.require(:apple_care).permit(:product)
    end
end
