class UsersController < ApplicationController
  before_action :import_users

  def index
    @users = User.where('distance < ?', (params[:distance].to_i * 1000))
  end

  private
  def import_users
    User.import! unless User.first
  end
end
