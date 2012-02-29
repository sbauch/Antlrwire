class FanPagesController < ApplicationController
  before_filter :authenticate_user!
  
  def toggle_primary
    user = current_user
    pages = FanPage.find_all_by_user_id(user.id)
    pages.each do |p|
      p.update_attributes(:primary => FALSE)
    end
    @fanpage = FanPage.find(params[:id])
    @fanpage.toggle!(:primary)
    respond_to do |format|
      flash[:success] = "Primary Page Changed"
      format.html { redirect_to root_path }
      format.js
    end
  end
  # GET /fan_pages
  # GET /fan_pages.json
  def index
    unless params[:fan_page].nil?
         unless FbGraph::Page.fetch("#{params[:fan_page][:url]}").name.nil?
           
    page = FbGraph::Page.fetch("#{params[:fan_page][:url]}")
  
   
    @fan_page = FanPage.new(
       :name => page.name,
       :user_id => current_user.id,
       :primary => FALSE,
       :url => page.link)
     end
   else
     
  end
  @fan_page = FanPage.new
  
    @user = current_user
    @fan_pages = @user.fan_pages 
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fan_pages }
    end
  end

  # GET /fan_pages/1
  # GET /fan_pages/1.json
  def show
    @fan_page = FanPage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fan_page }
    end
  end

  # GET /fan_pages/new
  # GET /fan_pages/new.json
  def new
    @fan_page = FanPage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fan_page }
    end
  end

  # GET /fan_pages/1/edit
  def edit
    @fan_page = FanPage.find(params[:id])
  end

  # POST /fan_pages
  # POST /fan_pages.json
  def create
    
    page = FbGraph::Page.fetch("#{params[:fan_page][:url]}")
    @fan_page = FanPage.new(
     :name => page.name,
     :user_id => current_user.id,
     :primary => FALSE,
     :url => page.link)
    

    respond_to do |format|
      if @fan_page.save
        format.html { redirect_to '/fan_pages', notice: 'Fan page was successfully created.' }
        format.json { render json: @fan_page, status: :created, location: @fan_page }
      else
        format.html { render action: "new" }
        format.json { render json: @fan_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fan_pages/1
  # PUT /fan_pages/1.json
  def update
    @fan_page = FanPage.find(params[:id])

    respond_to do |format|
      if @fan_page.update_attributes(params[:fan_page])
        format.html { redirect_to @fan_page, notice: 'Fan page was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @fan_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fan_pages/1
  # DELETE /fan_pages/1.json
  def destroy
    @fan_page = FanPage.find(params[:id])
    @fan_page.destroy

    respond_to do |format|
      format.html { redirect_to fan_pages_url }
      format.json { head :ok }
    end
  end
end