class StakeholdersController < ApplicationController
  before_action :set_stakeholder, only: [:show, :edit, :update, :destroy]
  prepend_before_action :admin_only, only: [:edit, :update, :new, :create, :destroy]
  prepend_before_action :authenticate_user!, only: [:edit, :update, :new, :create, :destroy]


  # GET /stakeholders
  # GET /stakeholders.json
  def index
    @stakeholders = Stakeholder.paginate(:page => params[:page])
  end

  # GET /stakeholders/1
  # GET /stakeholders/1.json
  def show
  end

  # GET /stakeholders/new
  def new
    @stakeholder = Stakeholder.new
  end

  # GET /stakeholders/1/edit
  def edit
  end

  # POST /stakeholders
  # POST /stakeholders.json
  def create
    @stakeholder = Stakeholder.new(stakeholder_params)

    respond_to do |format|
      if @stakeholder.save
        format.html { redirect_to @stakeholder, notice: 'Stakeholder was successfully created.' }
        format.json { render :show, status: :created, location: @stakeholder }
      else
        format.html { render :new }
        format.json { render json: @stakeholder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stakeholders/1
  # PATCH/PUT /stakeholders/1.json
  def update
    respond_to do |format|
      if @stakeholder.update(stakeholder_params)
        format.html { redirect_to @stakeholder, notice: 'Stakeholder was successfully updated.' }
        format.json { render :show, status: :ok, location: @stakeholder }
      else
        format.html { render :edit }
        format.json { render json: @stakeholder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stakeholders/1
  # DELETE /stakeholders/1.json
  def destroy
    @stakeholder.destroy
    respond_to do |format|
      format.html { redirect_to stakeholders_url, notice: 'Stakeholder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stakeholder
      @stakeholder = Stakeholder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stakeholder_params
      params.require(:stakeholder).permit(:name)
    end
end
