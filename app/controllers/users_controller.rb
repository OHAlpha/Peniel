class UsersController < ApplicationController
  before_action :chknlog, only: [ :login, :signin, :new, :create ]
  before_action :chklog, only: [ :dashboard, :edit, :update, :destroy ]
  
  def dashboard
  end

  # GET /users
  # GET /users.json
  def index
    @persons = Person.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /user/new
  # GET /user/signup
  def new
    @user = User.new
  end

  # GET /user/edit
  def edit
  end

  # POST /user
  # POST /user.json
  def create
    @user = User.new(user_params)
    @user.status = 0
    if params[:user][:passhash].nil? or params[:user][:passhash] == ''
      respond_to do |format|
        format.html { render params[:signup], notice: 'password is required' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    elsif params[:user][:passhash_confirmation].nil? or params[:user][:passhash_confirmation] == ''
      respond_to do |format|
        format.html { render params[:signup], notice: 'password confirmation is required' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    elsif params[:user][:passhash] != params[:user][:passhash_confirmation]
      respond_to do |format|
        format.html { render params[:signup], notice: 'passwords do not match' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
    @user.passhash = params[:user][:passhash]

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render params[:signup] }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user
  # PATCH/PUT /user.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def login
  end
  
  # POST /user/signin
  def signin
    @user = User.find_by unom: params[:unom]
    if @user.nil?
      respond_to do |format|
        format.html { render :login, notice: 'Email or password incorrect' }
      end
    end
    salt_passhash = Digest::SHA256.hexdigest(params[:pass]+@user.salt)
    if @user.salt_passhash != salt_passhash
      respond_to do |format|
        format.html { render :login, notice: 'Email or password incorrect' }
      end
    end
    session[:person_id] = @user.person_id
    redirect_to dashboard_user_path
  end
  
  # GET /user/logout
  def logout
    session[:person_id] = nil
    redirect_to root_path
  end

  # DELETE /user
  # DELETE /user.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:unom, :email, :name_t, :name_f, :name_m, :name_l, :name_s, :contact_id, :birthdate)
    end
end
