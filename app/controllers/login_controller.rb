class LoginController < ActionController::Base
  
  before_action :log
  
  protected
  
    def chklog
      if not @isuser
        respond_to do |format|
          format.html { redirect_to login_user_path, notice: 'You must be logged in to view this page.' }
          format.json { render inline '{error:"You must be logged in to view this page."}' }
        end
      end
    end
    
    def chknlog
      if @isuser
        redirect_to user_path
      end
    end
  
    def log
      @isuser = loggedin?
      if @isuser
        @ismember = @current_user.member?
        @ismaintainer = @current_user.maintainer?
        @isdeveloper = @current_user.developer?
        @isadmin = @current_user.admin?
      else
        @ismember = false
        @ismaintainer = false
        @isdeveloper = false
        @isadmin = false
      end
    end
    
    def loggedin?
      if not session[:person_id].nil?
        if Person.exists?(session[:person_id])
          @current_person = Person.find(session[:person_id])
          @current_user = @current_person.user
        else
          session[:person_id] = nil
        end
      end
      not @current_person.nil?
    end
  
end
