class UsersController < ApplicationController
  include Pagy::Backend

  before_action :authenticate_user!

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @items = params[:per_page] || 10
    @query = params[:search]
    records = @query.blank? ? User.all : User.search(@query)
    @pagy, @users = pagy(records, items: @items)
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # GET /users/edit_profile
  def edit_profile
    @user = current_user
  end

  # POST /users/update_profile
  def update_profile
    @user = current_user
    if @user.update(user_params.delete_if{|k,v| v.blank?})
      # Sign in the user by passing validation in case their password changed
      bypass_sign_in(@user)
      redirect_to root_path, notice: t('message.success_updated', :model => User.model_name.human)
    else
      render "edit_profile"
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: t('message.success_created', model: User.model_name.human) }
        format.json { render :show, status: :created, location: @user }
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
      if @user.update(user_params.delete_if{|k,v| v.blank?})
        format.html { redirect_to users_path, notice: t('message.success_updated', :model => User.model_name.human) }
        format.json { render :show, status: :ok, location: @user }
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
      format.html { redirect_to users_url, notice: t('message.success_destroyed', :model => User.model_name.human) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :pasword_confirmation, :role_id, :company, :status)
    end
end
