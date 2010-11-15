class TimelinesController < ApplicationController
  # GET /timelines
  # GET /timelines.xml
  def index
    @timelines = Timeline.all
    @users = User.all
#    @points = Point.find(:all, :group => :date, :order => :date, :include => :user)
    @points = Point.find(:all, :order => :date, :include => :user)

    if params[:date].nil?
      date = Date.today
      date_end = date
    else
    if params[:date].to_date < Date.today.beginning_of_month.to_date

      date = params[:date].to_date
      date_end = date.next_month.beginning_of_month.to_date - 1
    else
      date = Date.today
      date_end = date
    end
    end

    #先月
    @last_month =  date.last_month.beginning_of_month.to_date 
    #次月
    @next_month = @last_month.next_month.next_month 
#    @next_month = @last_month < date.last_month.beginning_of_month ? @last_month.next_month.next_month : nil
    #今月
#    @this_month = @last_month.next_month

    

    date_box = Array.new
    wdays_box = Array.new
    wdays = ["(日)", "（月）", "（火）", "（水）", "（木）", "（金）", "土"]
    #その月の日付リスト
#    @date_box = ((5.days.ago.to_date)..(Date.today)).to_a.reverse
     @date_box = ((date.beginning_of_month.to_date)..(date_end)).to_a.reverse   

    #平日のリストを作る
    @date_box.each do |t|
      if t.wday > 0 && t.wday < 6
        #print t.to_s
        date_box << t.to_s
        #曜日の指定
        #wdays_box << wdays[t.wday]
      end
    end

    @date_box = date_box
    #@wdays_box = wdays_box



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
