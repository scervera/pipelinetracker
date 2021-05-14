class SupportOpportunitiesController < ApplicationController
  before_action :get_opportunity, except: [:index, :acopps]
  before_action :set_support_opportunity, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @page_title = "All AppleCare Opportunities"
    @support_opportunities = SupportOpportunity.all
    
  end

  def acopps
    carrier = current_user.carrier
    @page_title = "#{carrier.upcase} Team AppleCare Opportunities"
    @support_opportunities = SupportOpportunity.joins(:opportunity).where(opportunities: {carrier: carrier })
  
    #else
    #  @articles = SupportOpportunity.all
    #end
  end

  def show
  end

  def new
    #@support_opportunity = SupportOpportunity.new
    @support_opportunity = @opportunity.support_opportunities.build
  end

  def edit
  end

  def create
    @support_opportunity = @opportunity.support_opportunities.build(support_opportunity_params)

    respond_to do |format|
      if @support_opportunity.save
        format.html { redirect_to opportunity_path(@opportunity), notice: 'Support Opportunity was successfully created.' }
        #format.json { render :show, status: :created, location: @support_opportunity }
      else
        format.html { render :new }
        format.json { render json: @support_opportunity.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @support_opportunity.update(support_opportunity_params)
        format.html { redirect_to opportunity_support_opportunity_path(@opportunity), notice: 'Support Opportunity was successfully updated.' }
        format.json { render :show, status: :ok, location: @support_opportunity }
      else
        format.html { render :edit }
        format.json { render json: @support_opportunity.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @support_opportunity.destroy
    respond_to do |format|
      format.html { redirect_to opportunity_path(@opportunity), notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def get_opportunity
      @opportunity = Opportunity.find(params[:opportunity_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_support_opportunity
      @support_opportunity = SupportOpportunity.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def support_opportunity_params
      params.require(:support_opportunity).permit(:opportunity_id, :apple_care_id, :fiscal_year, :fiscal_quarter, apple_cares_attributes: [ :id, :product, :_destroy ], support_opportunities_attributes: [ :id, :_destroy ])
    end

end