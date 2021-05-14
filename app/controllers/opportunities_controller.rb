class OpportunitiesController < ApplicationController
  before_action :set_opportunity, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  # GET /opportunities
  # GET /opportunities.json
  def index 
    if current_user.role == "admin" || current_user.role == "manager"
      @page_title = "Manager View of Pipeline"
      @opportunities = opportunity.filter(params.slice(:stage, :carrier, :quantity_gte, :quantity_lte, :fullname, :user_with_name_like, :created_before, :created_after, :created_at, :updated_before, :updated_after, :updated_at )).page params[:page]
      @total_opps = Opportunity.all
    else
      @page_title = "Team Opportunity Pipeline"
      @my_opportunities = Opportunity.where(carrier: current_user.carrier).order(updated_at: :desc).page params[:page]
      @opportunities = @my_opportunities.filter(params.slice(:stage, :carrier, :quantity_gte, :quantity_lte, :fullname, :user_with_name_like, :created_before, :created_after, :created_at, :updated_before, :updated_after, :updated_at )).page params[:page]
      @total_opps = @my_opportunities
    end
  end

  def search
    @page_title = "Custom Search"
    if params[:search]
      search_term = params[:search].downcase.gsub(/\s+/, "")
      #@opportunities = Opportunity.all.page params[:page]
      @opportunities = Opportunity.all.select { |opportunity|
              opportunity.customer_name.downcase.include?(search_term) || 
              opportunity.product.model.downcase.include?(search_term) || 
              opportunity.carrier.include?(search_term) || 
              opportunity.account_exec_user.fullname.downcase.include?(search_term) || 
              opportunity.sys_engineer_user.fullname.downcase.include?(search_term) ||
              opportunity.use_case.downcase.include?(search_term) ||
              opportunity.stage == search_term
              #opportunity.industry.downcase.include?(search_term)
            }
    else
      @opportunities = []
    end

  end

  def tracking
    @page_title = "My Top Opps"
    @top_opportunities = Opportunity.where(carrier: current_user.carrier, tracking: :true).order(updated_at: :desc).page params[:page]
  end

  # GET /opportunities/1
  # GET /opportunities/1.json
  def show
  end

  # GET /opportunities/new
  def new
    @opportunity = Opportunity.new
    3.times { @opportunity.comments.build }
  end

  # GET /opportunities/1/edit
  def edit
  end

  # POST /opportunities
  # POST /opportunities.json
  def create
    @opportunity = Opportunity.new(opportunity_params)

    respond_to do |format|
      if @opportunity.save
        format.html { redirect_to opportunities_path, notice: 'Opportunity was successfully created.' }
        format.json { render :show, status: :created, location: @opportunity }
      else
        format.html { render :new }
        format.json { render json: @opportunity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /opportunities/1
  # PATCH/PUT /opportunities/1.json
  def update
    respond_to do |format|
      if @opportunity.update(opportunity_params)
        format.html { redirect_to opportunities_path, notice: 'Opportunity was successfully updated.' }
        format.json { render :show, status: :ok, location: @opportunity }
      else
        format.html { render :edit }
        format.json { render json: @opportunity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /opportunities/1
  # DELETE /opportunities/1.json
  def destroy
    @opportunity.destroy
    respond_to do |format|
      format.html { redirect_to opportunities_url, notice: 'Opportunity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_opportunity
      @opportunity = Opportunity.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def opportunity_params
      params.require(:opportunity).permit(:customer_name, :stage, :quantity, :quantity_gte, :quantity_lte, :created_before, :created_after, :created_at, :user_with_name_like, :fullname, :use_case, 
                                          :sales_stage_id, :product_id, :model, :account_exec_user_id, 
                                          :sys_engineer_user_id, :carrier, :tracking,
                                          comments_attributes: [ :id, :author, :content, :_destroy ])
    end
end
