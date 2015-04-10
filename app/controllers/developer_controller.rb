class DeveloperController < ApplicationController

  def index
    @tables = [ { name: 'Persons', url: 'persons' }, { name: 'Users', url: 'users' }, { name: 'Titles', url: 'title' }, { name: 'Suffixes', url: 'suffixes' } ]
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
      @cols = [ 'id', 'unom', 'email', 'name' ]
      @rows = []
      User.all.each do |u|
        @rows << [ u.id.to_s, u.unom, u.email, u.name ]
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
    end
  end

  def reset_titles
    Title.delete_all
    Title.new( name: '' ).save
    Title.new( name: 'Mr.' ).save
    Title.new( name: 'Ms.' ).save
    Title.new( name: 'Mrs.' ).save
    respond_to do |format|
      format.html { redirect_to '/developer/index_table/titles', notice: 'titles reset.' }
    end
  end

  def reset_suffixes
    Suffix.delete_all
    Suffix.new( name: '' ).save
    Suffix.new( name: 'Jr.' ).save
    Suffix.new( name: 'Sr.' ).save
    respond_to do |format|
      format.html { redirect_to '/developer/index_table/suffixes', notice: 'suffixes reset' }
    end
  end

  def add_admin
    @user = User.new( unom: 'Developer', email: 'lnugentgibson@gmail.com', name_f: 'Admin', name_l: 'System', status: 0 )
    @user.passhash = 'admintest'
    @user.personify
    @user.save
    redirect_to '/developer/index_table/users'
  end
  
end
