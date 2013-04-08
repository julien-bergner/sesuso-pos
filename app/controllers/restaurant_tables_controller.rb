class RestaurantTablesController < ApplicationController
  # GET /restaurant_tables
  # GET /restaurant_tables.json
  def index
    @restaurant_tables = RestaurantTable.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @restaurant_tables }
    end
  end

  # GET /restaurant_tables/1
  # GET /restaurant_tables/1.json
  def show
    @restaurant_table = RestaurantTable.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @restaurant_table }
    end
  end

  # GET /restaurant_tables/new
  # GET /restaurant_tables/new.json
  def new
    @restaurant_table = RestaurantTable.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @restaurant_table }
    end
  end

  # GET /restaurant_tables/1/edit
  def edit
    @restaurant_table = RestaurantTable.find(params[:id])
  end

  # POST /restaurant_tables
  # POST /restaurant_tables.json
  def create
    @restaurant_table = RestaurantTable.new(params[:restaurant_table])

    respond_to do |format|
      if @restaurant_table.save
        format.html { redirect_to @restaurant_table, notice: 'Restaurant table was successfully created.' }
        format.json { render json: @restaurant_table, status: :created, location: @restaurant_table }
      else
        format.html { render action: "new" }
        format.json { render json: @restaurant_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /restaurant_tables/1
  # PUT /restaurant_tables/1.json
  def update
    @restaurant_table = RestaurantTable.find(params[:id])

    respond_to do |format|
      if @restaurant_table.update_attributes(params[:restaurant_table])
        format.html { redirect_to @restaurant_table, notice: 'Restaurant table was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @restaurant_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurant_tables/1
  # DELETE /restaurant_tables/1.json
  def destroy
    @restaurant_table = RestaurantTable.find(params[:id])
    @restaurant_table.destroy

    respond_to do |format|
      format.html { redirect_to restaurant_tables_url }
      format.json { head :no_content }
    end
  end
end
