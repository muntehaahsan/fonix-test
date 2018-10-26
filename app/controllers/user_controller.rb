class UserController < ApplicationController
  require 'zensend'
  require "base64"

  #enter mobile number on index page
  def index

  end

  #send user code to mobile number
  def user_code
    random_str = [*('1'..'9')].sample(4).join
    client = ZenSend::Client.new("5pPy6oDeZgz9ZZ8YXxHfWQ")
    begin
       result = client.send_sms(
          originator: "447858302548",
          originator_type: 'msisdn',
          # Add your number here to send a message to yourself
          #The number should be in international format.
          #For example GB numbers will be 447400123456
          numbers: [params[:phone]],
          body: "Hello! Enter #{random_str} to verify your number"
    )
      @encoded_random_str =  Base64.encode64(random_str)
      flash[:notice] = 'A confirmation code has been sent on your mobile number sucessfully'
    rescue ZenSend::ZenSendException => e
        redirect_to :root, alert: "ZenSendException: #{e.parameter} => #{e.failcode}"
    end

  end

  #verify user code sent on mobile number
  def verify_user
    decoded_random_str = Base64.decode64(params[:code_sent])
    if params[:code] == decoded_random_str
      respond_to do |format|
        format.js
      end
    else
      root_redirection_alert("Oops! You have entered invalid code")
    end
  end

  def show_warning
    root_redirection_alert("Warning! You need to enter mobile number to get code")
  end

  private

  def root_redirection_alert(msg)
    redirect_to :root, alert: msg
  end

end
