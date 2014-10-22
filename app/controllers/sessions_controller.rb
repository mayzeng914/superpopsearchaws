class SessionsController < ApplicationController
  def destroy
    reset_session
    redirect_to searchy_path
  end
end