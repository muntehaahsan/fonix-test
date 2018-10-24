class UserController < ApplicationController
  require 'zensend'

  #enter mobile number on index page
  def index

  end

  #send user code to mobile number
  def user_code
    @random_str = [*('1'..'9')].sample(4).join
    #client = ZenSend::Client.new("5pPy6oDeZgz9ZZ8YXxHfWQ")
    #begin
    #   result = client.send_sms(
    #      originator: "SPINTOWIN",
    #     # Add your number here to send a message to yourself
    #   #The number should be in international format.
    #   #For example GB numbers will be 447400123456
    #   numbers: [params[:phone]],
    #      body: "Hello from SPINTOWIN! Enter #{@random_str} to verify your number"
    #)
    #  flash[:notice] = 'A confirmation code has been sent on your mobile number sucessfully'
    #rescue ZenSend::ZenSendException => e
    #    redirect_to :root, alert: "ZenSendException: #{e.parameter} => #{e.failcode}"
    #end

  end

  #verify user code sent on mobile number
  def verify_user
       redirect_to :root, alert: "Oops! You have entered invalid code"
  end

end
