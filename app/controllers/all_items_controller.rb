class AllItemsController < ApplicationController

  # GET /all_items
  # GET /all_items.json
  def index
    @items = []
    @users = User.all
    @users.each do |u|
      u.items.each do |i|
        @items << i
      end
    end
  end
end
