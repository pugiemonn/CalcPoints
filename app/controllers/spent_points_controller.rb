class SpentPointsController < ApplicationController
  # GET /spent_points
  # GET /spent_points.xml
  def index
    @spent_points = SpentPoint.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @spent_points }
    end
  end

  # GET /spent_points/1
  # GET /spent_points/1.xml
  def show
    @spent_point = SpentPoint.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @spent_point }
    end
  end

  # GET /spent_points/new
  # GET /spent_points/new.xml
  def new
    @spent_point = SpentPoint.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @spent_point }
    end
  end

  # GET /spent_points/1/edit
  def edit
    @spent_point = SpentPoint.find(params[:id])
  end

  # POST /spent_points
  # POST /spent_points.xml
  def create
    @spent_point = SpentPoint.new(params[:spent_point])

    respond_to do |format|
      if @spent_point.save
        format.html { redirect_to(@spent_point, :notice => 'SpentPoint was successfully created.') }
        format.xml  { render :xml => @spent_point, :status => :created, :location => @spent_point }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @spent_point.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /spent_points/1
  # PUT /spent_points/1.xml
  def update
    @spent_point = SpentPoint.find(params[:id])

    respond_to do |format|
      if @spent_point.update_attributes(params[:spent_point])
        format.html { redirect_to(@spent_point, :notice => 'SpentPoint was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @spent_point.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /spent_points/1
  # DELETE /spent_points/1.xml
  def destroy
    @spent_point = SpentPoint.find(params[:id])
    @spent_point.destroy

    respond_to do |format|
      format.html { redirect_to(spent_points_url) }
      format.xml  { head :ok }
    end
  end
end
