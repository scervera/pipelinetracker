class SalesStagesController < ApplicationController
  before_action :set_sales_stage, only: [:show, :edit, :update, :destroy]

  # GET /sales_stages
  # GET /sales_stages.json
  def index
    @sales_stages = SalesStage.all
  end

  # GET /sales_stages/1
  # GET /sales_stages/1.json
  def show
  end

  # GET /sales_stages/new
  def new
    @sales_stage = SalesStage.new
  end

  # GET /sales_stages/1/edit
  def edit
  end

  # POST /sales_stages
  # POST /sales_stages.json
  def create
    @sales_stage = SalesStage.new(sales_stage_params)

    respond_to do |format|
      if @sales_stage.save
        format.html { redirect_to sales_stages_path, notice: 'Sales stage was successfully created.' }
        format.json { render :show, status: :created, location: @sales_stage }
      else
        format.html { render :new }
        format.json { render json: @sales_stage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales_stages/1
  # PATCH/PUT /sales_stages/1.json
  def update
    respond_to do |format|
      if @sales_stage.update(sales_stage_params)
        format.html { redirect_to sales_stages_path, notice: 'Sales stage was successfully updated.' }
        format.json { render :show, status: :ok, location: @sales_stage }
      else
        format.html { render :edit }
        format.json { render json: @sales_stage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales_stages/1
  # DELETE /sales_stages/1.json
  def destroy
    @sales_stage.destroy
    respond_to do |format|
      format.html { redirect_to sales_stages_url, notice: 'Sales stage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sales_stage
      @sales_stage = SalesStage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sales_stage_params
      params.require(:sales_stage).permit(:stage)
    end
end
