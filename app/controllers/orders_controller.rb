class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_menu

  respond_to :js

  def new
    @menu_items = @menu.items.group_by {|menu_item| menu_item.course.kind}.sort.to_h
    respond_with(@order = Order.new)
  end

  def create
    Order.transaction do
      @order = Order.create(user: current_user)
      order_params.each do |kind, data|
        menu_item = MenuItem.find_by_id(data[:id])
        if menu_item
          @order.items.create(order: @order, menu_item: menu_item, amount: data[:amount])
        end
      end
      if @order.items.count==0
        raise ActiveRecord::Rollback
      end
    end
    unless @order.persisted?
      @order.errors.add(:base, I18n.t("errors.order.empty"))
      errors_to_flash @order
    end
    respond_with(@order)
  end

  private

  def load_menu
    @menu = Menu.find(params[:menu_id])
  end

  def order_params
    params.require(:order).permit(first: [:id, :amount], main: [:id, :amount], drink: [:id, :amount])
  end
end