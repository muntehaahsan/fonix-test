class UserController < ApplicationController
  require 'zensend'

  #enter mobile number on index page
  def index

  end

  #send user code to mobile number
  def user_code
    @random_str = [*('1'..'9')].sample(4).join
    

  end

  #verify user code sent on mobile number
  def verify_user
    root_redirection_alert("Oops! You have entered invalid code")
  end

  def show_warning
    root_redirection_alert("Warning! You need to enter mobile number to get code")
  end

  private

  def root_redirection_alert(msg)
    redirect_to :root, alert: msg
  end

end
