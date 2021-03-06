class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_stakeholder

  prepend_before_action :stakeholder_admin_only
  prepend_before_action :authenticate_user!
  prepend_before_action :has_stakeholder_access, only: [:create]


  # GET /users
  # GET /users.json
  def index
    @users = @stakeholder.users.paginate(:page => params[:page])
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = @stakeholder.users.new(params[:user])
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    p = user_params
    p[:password] = SecureRandom.base64(8)

    @user = User.new(p)

    respond_to do |format|
      if @user.save
        if p[:is_admin]
          @user.user_roles.create(role: UserRole.roles[:stakeholder_admin])
        end

        @user.send_reset_password_instructions
        format.html { redirect_to [@stakeholder, @user], notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: [@stakeholder, @user] }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to [@stakeholder, @user], notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: [@stakeholder, @user]  }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.

  def set_stakeholder
    @stakeholder = Stakeholder.find(params[:stakeholder_id])
  end

  def set_user
    @user = User.find(params[:id])
  end

  def has_stakeholder_access
    sameStakeholder = (current_user.stakeholder_id === user_params[:stakeholder_id].to_i)

    if !sameStakeholder && !current_user.is_admin?
      redirect_to new_stakeholder_user_url, :alert => 'Access denied. -> you do not have access to this stakeholder'
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:email, :stakeholder_id, :is_admin)
  end
end
