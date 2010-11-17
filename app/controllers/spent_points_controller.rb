class SpentPointsController < ApplicationController
  # GET /spent_points
  # GET /spent_points.xml
  def index
    @spent_points = SpentPoint.all
    @users = User.all
#    @spent_point = SpentPoint.find(:select)

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
    @last_month =  date.prev_month.beginning_of_month.to_date 
    #次月
    @next_month = @last_month.next_month.next_month 



    #20日分の日付リストをつくる
#    @date_box = ((20.days.ago.to_date)..(Date.today)).to_a.reverse
#    @date_box = ((Time.now.beginning_of_month.to_date)..(Date.today)).to_a.reverse

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



  respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @spent_points }
    end
  end

  # GET /spent_points/1
  # GET /spent_points/1.xml
  def show
    @spent_point = SpentPoint.find(params[:id])
    @user = User.find(:first, :joins => "inner join spent_points on users.id = spent_points.user_id", :conditions => [ "spent_points.id = ?",params[:id]])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @spent_point }
    end
  end

  # GET /spent_points/new
  # GET /spent_points/new.xml
  def new
    @spent_point = SpentPoint.new
    @users = User.all
    @user = User.find(params[:user_id])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @spent_point }
    end
  end

  # GET /spent_points/1/edit
  def edit
    @spent_point = SpentPoint.find(params[:id])
    @user = User.find(params[:user_id])
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
