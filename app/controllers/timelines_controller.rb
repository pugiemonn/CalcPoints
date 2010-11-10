class TimelinesController < ApplicationController
  # GET /timelines
  # GET /timelines.xml
  def index
    @timelines = Timeline.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @timelines }
    end
  end

  # GET /timelines/1
  # GET /timelines/1.xml
  def show
    @timeline = Timeline.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @timeline }
    end
  end

  # GET /timelines/new
  # GET /timelines/new.xml
  def new
    @timeline = Timeline.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @timeline }
    end
  end

  # GET /timelines/1/edit
  def edit
    @timeline = Timeline.find(params[:id])
  end

  # POST /timelines
  # POST /timelines.xml
  def create
    @timeline = Timeline.new(params[:timeline])

    respond_to do |format|
      if @timeline.save
        format.html { redirect_to(@timeline, :notice => 'Timeline was successfully created.') }
        format.xml  { render :xml => @timeline, :status => :created, :location => @timeline }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @timeline.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /timelines/1
  # PUT /timelines/1.xml
  def update
    @timeline = Timeline.find(params[:id])

    respond_to do |format|
      if @timeline.update_attributes(params[:timeline])
        format.html { redirect_to(@timeline, :notice => 'Timeline was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @timeline.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /timelines/1
  # DELETE /timelines/1.xml
  def destroy
    @timeline = Timeline.find(params[:id])
    @timeline.destroy

    respond_to do |format|
      format.html { redirect_to(timelines_url) }
      format.xml  { head :ok }
    end
  end
end
