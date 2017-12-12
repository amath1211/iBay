class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy, :buy_item]
  before_action :set_user, only: [:new, :create, :destroy, :buy_item]


  # GET /items
  # GET /items.json
  def index
    @items = current_user.items
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = @user.items.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to user_items_path(@user), notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: user_item_path(@user, @item) }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to user_item_path(@user, @item), notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.photo = nil
    @item.destroy
    respond_to do |format|
      format.html { redirect_to user_items_path(@user, @item), notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def buy_item
    trans = Transaction.new(user_id: current_user.id, item_id: @item.id, seller: @item.user.id, status: 'pending')
    respond_to do |format|
      if trans.save
        format.html { redirect_to user_item_path(@user, @item), notice: 'Item was successfully bought.' }
        format.json { render :show, status: :created, location: user_item_path(@user, @item) }
      else
        format.html { redirect_to user_item_path(@user, @item), notice: 'Item was not successfully bought.' }
        format.json { render :show, status: :created, location: user_item_path(@user, @item) }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      set_user
      @item = Item.find(params[:id])
    end

  def set_user
    @user = current_user
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:title, :description, :user_id, :photo)
    end
end
