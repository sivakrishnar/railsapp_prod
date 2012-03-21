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
    p params
    @video.title = params[:title] if params[:title]
    @video.url = params[:url] if params[:url]
    @video.image_url = params[:image_url] if params[:image_url]
    @video.active = params[:active] if params[:active]

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
    @data = Hash.new{}
    client = YouTubeIt::Client.new
    url = 'http://www.ap7am.com/telugu-videos-1-all-videos.html'
    puts "Crawling url: #{url}"
    agent = Mechanize.new
    pg = agent.get(url)
    index = 0;
    pg.images_with(:src => /default.jpg$/).each do |link|
      url = link.src
      url = url.gsub(/^.*com\/vi\//,'').gsub(/\/default.jpg$/,'')
      ytid = url.to_s
      ytv = client.video_by(ytid)
      next unless ytv;
      title = ytv.title
      puts "Fetched:   #{ytid} -> Desc:  #{title}"
      yt = {}
      yt[ytid]=title
      @data[index] = yt
      index+= 1
      #puts Video.new({:url => ytid, :image_url => ytid, :title => title, :active => 1}).save
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
