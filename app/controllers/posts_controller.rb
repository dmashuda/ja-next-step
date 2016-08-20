class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  prepend_before_action :authenticate_user!, only: [:edit, :update, :new, :create, :destroy]


  # GET /posts
  # GET /posts.json
  def index
    if user_signed_in?

      if params[:stakeholder_id].present?
        activeWhere = Post.where(:stakeholder_id => params[:stakeholder_id])
      end
      if params[:active].present?
        activeWhere = activeWhere ? activeWhere.where(:active => params[:active]) : Post.where(:active => params[:active])
      end

    end

    if !activeWhere
      # Start and end date are not required so NULL checks need added
      activeWhere = Post.where(:active => true, :start_date => [20000.year.ago..Date.today, nil], :end_date => [Date.today..20000.year.from_now, nil])
    end

    if params[:keyword_ids].present?
      activeWhere = activeWhere.joins(:keywords).where(keyword: {:id => params[:keyword_ids]})

      @keywords = Keyword.find(params[:keyword_ids])
    end

    @posts = activeWhere.paginate(:page => params[:page], :per_page => 20)

    @career_fields = CareerField.includes(:keywords).all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = current_user.stakeholder.posts.new(params[:post])
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:subject, :start_date, :end_date, :abstract, :body, :contact_email, :email_subject, :email_body, :active, :photo, :stakeholder_id, keyword_ids: [])
    end
end
