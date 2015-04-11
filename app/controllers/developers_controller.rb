class DevelopersController < ApplicationController
  before_action :set_developer, only: [:show, :edit, :update, :destroy]

  # GET /developers
  # GET /developers.json
  def index
    @developers = Developer.all
  end

  # GET /developers/1
  # GET /developers/1.json
  def show
  end

  # GET /developers/new
  def new
    @developer = Developer.new
  end

  # GET /developers/1/edit
  def edit
  end

  # POST /developers
  # POST /developers.json
  def create
    @developer = Developer.new(developer_params)

    respond_to do |format|
      if @developer.save
        format.html { redirect_to @developer, notice: 'Developer was successfully created.' }
        format.json { render :show, status: :created, location: @developer }
      else
        format.html { render :new }
        format.json { render json: @developer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /developers/1
  # PATCH/PUT /developers/1.json
  def update
    respond_to do |format|
      if @developer.update(developer_params)
        format.html { redirect_to @developer, notice: 'Developer was successfully updated.' }
        format.json { render :show, status: :ok, location: @developer }
      else
        format.html { render :edit }
        format.json { render json: @developer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /developers/1
  # DELETE /developers/1.json
  def destroy
    @developer.destroy
    respond_to do |format|
      format.html { redirect_to developers_url, notice: 'Developer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def dashboard
    @tables = [ { name: 'Persons', url: 'persons' }, { name: 'Users', url: 'users' }, { name: 'Titles', url: 'titles' }, { name: 'Suffixes', url: 'suffixes' } ]
  end

  def clear_table
    if params[:table] == 'persons'
      Person.delete_all
    elsif params[:table] == 'users'
      User.delete_all
    elsif params[:table] == 'titles'
      Title.delete_all
    elsif params[:table] == 'suffixes'
      Suffix.delete_all
    end
    respond_to do |format|
      format.html { redirect_to '/developer/index_table/' + params[:table], notice: params[:table] + ' cleared' }
    end
  end

  def remove_row
    if params[:table] == 'persons'
      Person.find(params[:id]).delete
    elsif params[:table] == 'users'
      User.find(params[:id]).delete
    elsif params[:table] == 'titles'
      Title.find(params[:id]).delete
    elsif params[:table] == 'suffixes'
      Suffix.find(params[:id]).delete
    end
    respond_to do |format|
      format.html { redirect_to '/developer/index_table/' + params[:table], notice: params[:table] + ' cleared' }
    end
  end
  
  def index_table
    @table = params[:table]
    if @table == 'persons'
      @title = 'Persons'
      @cols = [ 'id', 'name', 'email', 'isUser', 'isMember' ]
      @rows = []
      Person.all.each do |p|
        @rows << [ p.id.to_s, p.name, p.email, p.user?, p.member? ]
      end
    elsif params[:table] == 'users'
      @title = 'Users'
      @cols = User.icols
      @rows = []
      User.all.each do |a|
        @rows << a.irow
      end
    elsif params[:table] == 'titles'
      @title = 'Titles'
      @cols = [ 'id', 'name' ]
      @rows = []
      Title.all.each do |t|
        @rows << [ t.id.to_s, t.name ]
      end
    elsif params[:table] == 'suffixes'
      @title = 'Suffixes'
      @cols = [ 'id', 'name' ]
      @rows = []
      Suffix.all.each do |s|
        @rows << [ s.id.to_s, s.name ]
      end
    elsif params[:table] == 'addresses'
      @title = 'Addresses'
      @cols = Address.icols
      @rows = []
      Address.all.each do |a|
        @rows << a.irow
      end
    elsif params[:table] == 'admins' or params[:table] == 'administrators'
      @title = 'Administrators'
      @cols = [ 'id', 'member_id', 'description', 'permissions' ]
      @rows = []
      Administrator.all.each do |a|
        @rows << [ a.id.to_s, a.member_id, a.description, a.permissions ]
      end
    elsif params[:table] == 'developers'
      @title = 'Developers'
      @cols = [ 'id', 'user_id', 'description', 'permissions' ]
      @rows = []
      Developer.all.each do |a|
        @rows << [ a.id.to_s, a.user_id, a.description, a.permissions ]
      end
    elsif params[:table] == 'maintainers'
      @title = 'Maintainers'
      @cols = [ 'id', 'member_id', 'description', 'permissions' ]
      @rows = []
      Maintainer.all.each do |a|
        @rows << [ a.id.to_s, a.member_id, a.description, a.permissions ]
      end
    elsif params[:table] == 'members'
      @title = 'Members'
      @cols = [ 'id', 'person_id', 'since' ]
      @rows = []
      Member.all.each do |a|
        @rows << [ a.id.to_s, a.person_id, a.since.to_s ]
      end
    elsif params[:table] == 'parties'
      @title = 'Parties'
      @cols = [ 'id', 'name', 'description' ]
      @rows = []
      Party.all.each do |a|
        @rows << [ a.id.to_s, a.name, a.description ]
      end
    elsif params[:table] == 'party_memberships'
      @title = 'Party Memberships'
      @cols = [ 'id', 'person', 'party' ]
      @rows = []
      PartyMembership.all.each do |a|
        @rows << [ a.id.to_s, a.person.name, a.party.name ]
      end
    end
  end

  def reset_titles
    settit
    respond_to do |format|
      format.html { redirect_to '/developer/index_table/titles', notice: 'titles reset.' }
    end
  end

  def reset_suffixes
    setsuf
    respond_to do |format|
      format.html { redirect_to '/developer/index_table/suffixes', notice: 'suffixes reset' }
    end
  end

  def add_admin
    respond_to do |format|
      if addadm
        format.html { redirect_to index_table_developer_path( 'admins' ), notice: 'admin added' }
      else
        format.html { redirect_to dashboard_developer_path, notice: @user.errors.to_s }
      end
    end
  end
  
  def setup_env
    settit
    setsuf
    respond_to do |format|
      if addadm
        format.html { redirect_to index_table_developer_path( 'admins' ), notice: 'admin added' }
      else
        format.html { redirect_to dashboard_developer_path, notice: @user.errors.to_s }
      end
    end
  end
  
  def show_session
    @ds = {}
    if not session.nil?
      if not session[:person_id].nil?
        @ds[:person_id] = session[:person_id]
      end
    end
  end

  def add_test_users
    @user = User.new( unom: 'Developer', email: 'lnugentgibson@gmail.com', name_f: 'Admin', name_l: 'System', status: 0 )
    @user.passhash = 'admintest'
    @user.personify
    @user.save
    redirect_to '/developer/index_table/users'
  end

  private

    def settit
      Title.delete_all
      Title.new( name: '' ).save
      Title.new( name: 'Mr.' ).save
      Title.new( name: 'Ms.' ).save
      Title.new( name: 'Mrs.' ).save
    end

    def setsuf
      Suffix.delete_all
      Suffix.new( name: '' ).save
      Suffix.new( name: 'Jr.' ).save
      Suffix.new( name: 'Sr.' ).save
    end

    def addadm
      @user = User.new( unom: 'Developer', email: 'lnugentgibson@gmail.com', name_f: 'Admin', name_l: 'System', status: 0 )
      @user.passhash = 'admintest'
      if @user.save
        Administrator.create( member: Member.create( person: @user.person, since: DateTime.now ), description: 'test admin' )
      end
      not @user.nil?
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_developer
      @developer = Developer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def developer_params
      params.require(:developer).permit(:user_id, :description, :permissions)
    end
end
