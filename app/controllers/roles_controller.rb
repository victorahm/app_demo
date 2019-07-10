class RolesController < ApplicationController
  include Pagy::Backend

  before_action :authenticate_user!

  before_action :set_role, only: [:show, :edit, :update, :destroy, :edit_menus, :update_menus]

  # GET /roles
  # GET /roles.json
  def index
    @items = params[:per_page] || 10
    @query = params[:search]
    records = @query.blank? ? Role.all : Role.search(@query)
    @pagy, @roles = pagy(records, items: @items)
  end

  # GET /roles/1
  # GET /roles/1.json
  def show
  end

  # GET /roles/new
  def new
    @role = Role.new
  end

  # GET /roles/1/edit
  def edit
  end

  # GET /roles/1/edit_menus
  def edit_menus
  end

  # POST /roles/1/update_menus
  def update_menus
    @role.menu_ids = params[:menus_ids]
    if @role.save
      redirect_to roles_path, notice: t('message.success_updated', :model => Role.model_name.human)
    else
      render 'edit_menus'
    end
  end

  # POST /roles
  # POST /roles.json
  def create
    @role = Role.new(role_params)

    respond_to do |format|
      if @role.save
        format.html { redirect_to roles_path, notice: t('message.success_created', model: Role.model_name.human) }
        format.json { render :show, status: :created, location: @role }
      else
        format.html { render :new }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /roles/1
  # PATCH/PUT /roles/1.json
  def update
    respond_to do |format|
      if @role.update(role_params)
        format.html { redirect_to roles_path, notice: t('message.success_updated', :model => Role.model_name.human) }
        format.json { render :show, status: :ok, location: @role }
      else
        format.html { render :edit }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roles/1
  # DELETE /roles/1.json
  def destroy
    @role.destroy
    respond_to do |format|
      format.html { redirect_to roles_url, notice: t('message.success_destroyed', :model => Role.model_name.human) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_role
      @role = Role.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def role_params
      params.require(:role).permit(:name, :description)
    end
end
