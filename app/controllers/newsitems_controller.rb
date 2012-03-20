class NewsitemsController < ApplicationController
  # GET /newsitems
  # GET /newsitems.xml
  def index
    @newsitems = Newsitem.find(:all, :select => "id, title", :order => "updated_at desc", :limit => 40)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @newsitems }
    end
  end
  
  # GET /newsitems/1
  # GET /newsitems/1.xml
  def mobile_show
      @newsitem = Newsitem.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @newsitem }
      end
  end

  # GET /newsitems/1
  # GET /newsitems/1.xml
  def show
    @newsitem = Newsitem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @newsitem }
    end
  end

  # GET /newsitems/new
  # GET /newsitems/new.xml
  def new
    @newsitem = Newsitem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @newsitem }
    end
  end

  # GET /newsitems/1/edit
  def edit
    @newsitem = Newsitem.find(params[:id])
  end

  # POST /newsitems
  # POST /newsitems.xml
  def create
    @newsitem = Newsitem.new(params[:newsitem])

    respond_to do |format|
      if @newsitem.save
        format.html { redirect_to(@newsitem, :notice => 'Newsitem was successfully created.') }
        format.xml  { render :xml => @newsitem, :status => :created, :location => @newsitem }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @newsitem.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /newsitems/1
  # PUT /newsitems/1.xml
  def update
    @newsitem = Newsitem.find(params[:id])

    respond_to do |format|
      if @newsitem.update_attributes(params[:newsitem])
        format.html { redirect_to(@newsitem, :notice => 'Newsitem was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @newsitem.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /newsitems/1
  # DELETE /newsitems/1.xml
  def destroy
    @newsitem = Newsitem.find(params[:id])
    @newsitem.destroy

    respond_to do |format|
      format.html { redirect_to(newsitems_url) }
      format.xml  { head :ok }
    end
  end
end
