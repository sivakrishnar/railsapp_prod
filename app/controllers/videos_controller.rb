require 'anemone'
require 'mechanize'
require 'youtube_it'

class VideosController < ApplicationController
  # GET /videos
  # GET /videos.xml
  def index
    @videos = Video.find(:all, :order => "updated_at desc", :limit => 40)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @videos }
    end
  end

  # GET /videos/1
  # GET /videos/1.xml
  def show
    @video = Video.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @video }
    end
  end

  # GET /videos/new
  # GET /videos/new.xml
  def new
    @video = Video.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @video }
    end
  end

  # GET /videos/1/edit
  def edit
    @video = Video.find(params[:id])
  end

  # POST /videos
  # POST /videos.xml
  def create
    @video = Video.new(params[:video])

    respond_to do |format|
      if @video.save
        format.html { redirect_to(@video, :notice => 'Video was successfully created.') }
        format.xml  { render :xml => @video, :status => :created, :location => @video }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @video.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /videos/1
  # PUT /videos/1.xml
  def update
    @video = Video.find(params[:id])

    respond_to do |format|
      if @video.update_attributes(params[:video])
        format.html { redirect_to(@video, :notice => 'Video was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @video.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def fetch_new
    @data = {}
    client = YouTubeIt::Client.new
    url = 'http://www.ap7am.com/telugu-videos-1-all-videos.html'
    puts "Crawling url: #{url}"
    agent = Mechanize.new
    pg = agent.get(url)
    pg.images_with(:src => /default.jpg$/).each do |link|
      url = link.src
      url = url.gsub(/^.*com\/vi\//,'').gsub(/\/default.jpg$/,'')
      ytid = url.to_s
      title = client.video_by(ytid).title
      puts "#{ytid} -> Desc:  #{title}"
      @data[ytid]=title
    end
    respond_to do |format|
          format.html # index.html.erb
          format.xml  { render :xml => @data }
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.xml
  def destroy
    @video = Video.find(params[:id])
    @video.destroy

    respond_to do |format|
      format.html { redirect_to(videos_url) }
      format.xml  { head :ok }
    end
  end
end
