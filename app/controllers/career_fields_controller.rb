class CareerFieldsController < ApplicationController
  before_action :set_career_field, only: [:show, :edit, :update, :destroy]

  # GET /career_fields
  # GET /career_fields.json
  def index
    @career_fields = CareerField.all
  end

  # GET /career_fields/1
  # GET /career_fields/1.json
  def show
  end

  # GET /career_fields/new
  def new
    @career_field = CareerField.new
  end

  # GET /career_fields/1/edit
  def edit
  end

  # POST /career_fields
  # POST /career_fields.json
  def create
    @career_field = CareerField.new(career_field_params)

    respond_to do |format|
      if @career_field.save
        format.html { redirect_to @career_field, notice: 'Career field was successfully created.' }
        format.json { render :show, status: :created, location: @career_field }
      else
        format.html { render :new }
        format.json { render json: @career_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /career_fields/1
  # PATCH/PUT /career_fields/1.json
  def update
    respond_to do |format|
      if @career_field.update(career_field_params)
        format.html { redirect_to @career_field, notice: 'Career field was successfully updated.' }
        format.json { render :show, status: :ok, location: @career_field }
      else
        format.html { render :edit }
        format.json { render json: @career_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /career_fields/1
  # DELETE /career_fields/1.json
  def destroy
    @career_field.destroy
    respond_to do |format|
      format.html { redirect_to career_fields_url, notice: 'Career field was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_career_field
      @career_field = CareerField.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def career_field_params
      params.require(:career_field).permit(:label, :active)
    end
end
