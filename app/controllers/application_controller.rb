class ApplicationController < LoginController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def home
  end
  
  def about
  end
  
  def news
  end
  
  def bible
  end
  
  def media
  end
  
  def resources
  end
  
  def contact
  end
  
end
