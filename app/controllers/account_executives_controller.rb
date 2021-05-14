class AccountExecutivesController < ApplicationController
  before_action :set_account_executive, only: [:show, :edit, :update, :destroy]

  # GET /account_executives
  # GET /account_executives.json
  def index
    @account_executives = AccountExecutive.all
  end

  # GET /account_executives/1
  # GET /account_executives/1.json
  def show
  end

  # GET /account_executives/new
  def new
    @account_executive = AccountExecutive.new
  end

  # GET /account_executives/1/edit
  def edit
  end

  # POST /account_executives
  # POST /account_executives.json
  def create
    @account_executive = AccountExecutive.new(account_executive_params)

    respond_to do |format|
      if @account_executive.save
        format.html { redirect_to @account_executive, notice: 'Account executive was successfully created.' }
        format.json { render :show, status: :created, location: @account_executive }
      else
        format.html { render :new }
        format.json { render json: @account_executive.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /account_executives/1
  # PATCH/PUT /account_executives/1.json
  def update
    respond_to do |format|
      if @account_executive.update(account_executive_params)
        format.html { redirect_to @account_executive, notice: 'Account executive was successfully updated.' }
        format.json { render :show, status: :ok, location: @account_executive }
      else
        format.html { render :edit }
        format.json { render json: @account_executive.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /account_executives/1
  # DELETE /account_executives/1.json
  def destroy
    @account_executive.destroy
    respond_to do |format|
      format.html { redirect_to account_executives_url, notice: 'Account executive was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account_executive
      @account_executive = AccountExecutive.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def account_executive_params
      params.require(:account_executive).permit(:firstname, :lastname, :carrier)
    end
end
