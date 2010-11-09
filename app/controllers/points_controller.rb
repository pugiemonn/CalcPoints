class PointsController < ApplicationController
  # GET /points
  # GET /points.xml

  def create
    #render :text => "hogehoge"
    @user_id = params[:user_id]
    @point = params[:point]
    @date = params[:date]

#    @flag = Point.find(:all, :conditions => ["user_id = ? and date = ? ",  @user_id , @date ])

    #ログテーブルへの書き込み
    if Log.exists?(["user_id = ? and date = ? ", @user_id, @date])
      @point_old = Point.find(:all, :conditions => ["user_id = ? and date = ? ", @user_id, @date ])
      @point_diff = @point_old[0].point.to_i - @point.to_i
      p @point_old[0].point.to_i

#      update=Log.find(all, :conditions => ["user_id = ? and date = ? ",  @user_id , @date ])
#      update.point_sum=@point     
#      update.update_attribute(:point_sum, @point)
#      update.save
      Log.update_all("point_sum=" + @point_diff.to_s + "", ["user_id = ? and date = ? ",  @user_id , @date ] )
    else
      log = Log.new
      log.user_id = @user_id
      log.point_sum = @point
      log.spent_sum = @point
      log.date = @date
      log.save
    end


    if Point.exists?(["user_id = ? and date = ? ",  @user_id , @date ])
#      update=Point.find(:all, :conditions => ["user_id = ? and date = ? ",  @user_id , @date ])
#      update.point=@point     
#      update.update_attribute(:point, @point)
#      update.save
     Point.update_all("point=" + @point + "", ["user_id = ? and date = ? ",  @user_id , @date ] )
    else
      point = Point.new
      point.user_id = @user_id
      point.point = @point
      point.date = @date
      point.save
    end


    @point = Point.find(:all, :conditions => ["user_id = ? and date = ? ",  @user_id , @date ])
    @point_sum = Point.find_by_sql("select sum(point) as point  from points where user_id =1")

    #render :text  => User.find(:all, :select => "id" ,:conditions => "id == 3")
    render :inline  => "<input type=\"text\" id=\"input_<%= @date %>\" name=\"input_<%= @date %>\"  value=\"<%= @point_sum[0].point %>\" />"
# onChange=\"<%= remote_function(:update => \"td_1_#{@date}\",
#:with => \"'user_id=#{@user_id}&point=' + $('input_#{@date}').value + '&date=#{@date}' \",
#:url => { 
#:action => 'update_point'
#}) -%>\"
#  />"
    #render :text => CGI.escapeHTML(params[:user_id])
  end



  def index
    #userが居ないとuser初期ページに飛ばす
    if User.exists?
      #redirect_to :controller => 'users' 
      @users = User.all 
    else   
      redirect_to :controller => 'users' 
    end

    @points = Point.find(:all, :group => :date, :order => 'date desc', :include => :user)
    @points1 = Point.find(:all, :conditions => "user_id == 1", :order => 'date desc', :include => :user)
    @points2 = Point.find(:all, :conditions => "user_id == 2", :order => 'date desc', :include => :user)
    @points3 = Point.find(:all, :conditions => "user_id == 3", :order => 'date desc', :include => :user)
    @points4 = Point.find(:all, :conditions => "user_id == 4", :order => 'date desc', :include => :user)
    @points5 = Point.find(:all, :conditions => "user_id == 5", :order => 'date desc', :include => :user)
    @points6 = Point.find(:all, :conditions => "user_id == 6", :order => 'date desc', :include => :user)

#    @point_sum = Point.find_by_sql("select sum(point) as point  from points where user_id = 1")
#    p @point_sum[0].point

   
     @point_sum = Point.find_by_sql("select sum(point) as point  from points where user_id =1")

#    date = Date.today
#    #20日分の日付リスト
#    date_box = Array.new
#    for i in 0..20
#      date_box << date - i
#    end
#    @date_box = date_box
    @date_box = ((20.days.ago.to_date)..(Date.today)).to_a.reverse

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @points }
    end
  end

  # GET /points/1
  # GET /points/1.xml
  def show
    @point = Point.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @point }
    end
  end

  # GET /points/new
  # GET /points/new.xml
  def new
    @point = Point.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @point }
    end
  end

  # GET /points/1/edit
  def edit
    @point = Point.find(params[:id])
  end

  # POST /points
  # POST /points.xml
#  def create
#    @point = Point.new(params[:point])
#
#    respond_to do |format|
#      if @point.save
#        format.html { redirect_to(@point, :notice => 'Point was successfully created.') }
#        format.xml  { render :xml => @point, :status => :created, :location => @point }
#      else
#        format.html { render :action => "new" }
#        format.xml  { render :xml => @point.errors, :status => :unprocessable_entity }
#      end
#    end
#  end

  # PUT /points/1
  # PUT /points/1.xml
  def update
    @point = params[:point]
    @date = date[:date]
    
    render :text => 'hoge'  

#    @point = Point.find(params[:id])
#    respond_to do |format|
#      if @point.update_attributes(params[:point])
#        format.html { redirect_to(@point, :notice => 'Point was successfully updated.') }
#        format.xml  { head :ok }
#      else
#        format.html { render :action => "edit" }
#        format.xml  { render :xml => @point.errors, :status => :unprocessable_entity }
#      end
#    end
  end

  # DELETE /points/1
  # DELETE /points/1.xml
  def destroy
    @point = Point.find(params[:id])
    @point.destroy

    respond_to do |format|
      format.html { redirect_to(points_url) }
      format.xml  { head :ok }
    end
  end
end
