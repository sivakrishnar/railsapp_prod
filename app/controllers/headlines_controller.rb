class HeadlinesController < ApplicationController
  # GET /headlines
  # GET /headlines.xml
  def index
    @headlines = Headline.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @headlines }
    end
  end

  # GET /headlines/1
  # GET /headlines/1.xml
  def show
    @headline = Headline.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @headline }
    end
  end

  # GET /headlines/new
  # GET /headlines/new.xml
  def new
    @headline = Headline.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @headline }
    end
  end

  # GET /headlines/1/edit
  def edit
    @headline = Headline.find(params[:id])
  end

  # POST /headlines
  # POST /headlines.xml
  def create
    @headline = Headline.new(params[:headline])

    respond_to do |format|
      if @headline.save
        format.html { redirect_to(@headline, :notice => 'Headline was successfully created.') }
        format.xml  { render :xml => @headline, :status => :created, :location => @headline }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @headline.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /headlines/1
  # PUT /headlines/1.xml
  def update
    @headline = Headline.find(params[:id])

    respond_to do |format|
      if @headline.update_attributes(params[:headline])
        format.html { redirect_to(@headline, :notice => 'Headline was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @headline.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /headlines/1
  # DELETE /headlines/1.xml
  def destroy
    @headline = Headline.find(params[:id])
    @headline.destroy

    respond_to do |format|
      format.html { redirect_to(headlines_url) }
      format.xml  { head :ok }
    end
  end
end
