class MenuController < ApplicationController
  before_action :authenticate_user!
  before_action :load_menu, only: [:show]

  respond_to :js

  def show
    respond_with(@menu)
  end

  private

  def load_menu
    @menu = Menu.find(params[:id])
  end
end