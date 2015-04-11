class UsersController < ApplicationController
  before_action :logged_in, only: [:new, :show, :index, :edit, :destroy, :logout]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @persons = Person.all
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
    @signup = false
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.status = 0
    if params[:user][:passhash] != params[:user][:passhash_confirmation]
      respond_to do |format|
        format.html { render params[:signup], notice: 'passwords do not match' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
    @user.passhash = params[:user][:passhash]
    @user.personify

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

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user.personify
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
  
  def signin
    if params[:commit] == 'Sign Up'
      @user = User.new( unom: params[:unom] )
      render :signup
    end
  end
  
  def logout
  end
  
  def signup
    @user = User.new
    if not @current_person.nil?
      @user.person = @current_person
    end
    @signup = true
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
    def logged_in
      if not session[:persion_id].nil?
        @current_person = Person.find(session[:person_id])
      end
      if not session[:user_id].nil?
        @current_user = User.find(session[:user_id])
      else
        respond_to do |format|
          format.html { redirect_to login_user_path, notice: 'You must be logged in to view this page.' }
          format.json { render inline '{error:"You must be logged in to view this page."}' }
        end
      end
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:unom, :email, :name_t, :name_f, :name_m, :name_l, :name_s, :contact_id, :birthdate)
    end
end
