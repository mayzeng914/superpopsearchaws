class OauthController < ApplicationController
  CALLBACK_URL = "http://localhost:3000/oauth/callback"

  Instagram.configure do |config|
    config.client_id = '3bc0d5915ec24cea94a5dfa4586d60c3'
    config.client_secret = 'fd6f7b58d558424ca6519eb2400a4f3a'
    # For secured endpoints only
    #config.client_ips = '<Comma separated list of IPs>'
  end

  def connect
     redirect_to Instagram.authorize_url(:redirect_uri => CALLBACK_URL)
  end

  def callback
    response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK_URL)
    session[:access_token] = response.access_token
    puts '**************'
    puts response
    print response
    puts response.access_token
    print response.access_token
    puts '**************'

    # todo: create a user with this information
    # access_token, username, full_name, prof_pic, instragram_id
    u = User.find_by(instagram_id: response.user.id) || User.create!(access_token: response.access_token, username: response.user.username, 
      full_name: response.user.full_name, prof_pic: response.user.profile_picture, instagram_id: response.user.id)
    session[:user_id] = u.id.to_s

    redirect_to "/searches"
  end

end