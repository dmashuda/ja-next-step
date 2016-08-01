class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update]
  prepend_before_action :authenticate_user!, only: [:edit, :update]


  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @posts = @stakeholder.posts.where(active: "t").order(:created_at).first(3)
  end

  # GET /profiles/1/edit
  def edit
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to [@stakeholder, @profile], notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: [@stakeholder, @profile] }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_profile
    @stakeholder = Stakeholder.find(params[:stakeholder_id])
    @profile = @stakeholder.profile
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def profile_params
    params.require(:profile).permit(:logo, :banner, :website_url, :facebook_url, :youtube_url, :twitter_url, :instagram_url, :name, :email, :phone, :street, :city, :state, :zip, :about_us)
  end
end
