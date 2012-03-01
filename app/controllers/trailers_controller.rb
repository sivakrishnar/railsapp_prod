class TrailersController < ApplicationController
  # GET /trailers
  # GET /trailers.xml
  def index
    @trailers = Trailer.find(:all, :order => "updated_at", :limit => 40)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @trailers }
    end
  end

  # GET /trailers/1
  # GET /trailers/1.xml
  def show
    @trailer = Trailer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @trailer }
    end
  end

  # GET /trailers/new
  # GET /trailers/new.xml
  def new
    @trailer = Trailer.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @trailer }
    end
  end

  # GET /trailers/1/edit
  def edit
    @trailer = Trailer.find(params[:id])
  end

  # POST /trailers
  # POST /trailers.xml
  def create
    @trailer = Trailer.new(params[:trailer])

    respond_to do |format|
      if @trailer.save
        format.html { redirect_to(@trailer, :notice => 'Trailer was successfully created.') }
        format.xml  { render :xml => @trailer, :status => :created, :location => @trailer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @trailer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /trailers/1
  # PUT /trailers/1.xml
  def update
    @trailer = Trailer.find(params[:id])

    respond_to do |format|
      if @trailer.update_attributes(params[:trailer])
        format.html { redirect_to(@trailer, :notice => 'Trailer was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @trailer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /trailers/1
  # DELETE /trailers/1.xml
  def destroy
    @trailer = Trailer.find(params[:id])
    @trailer.destroy

    respond_to do |format|
      format.html { redirect_to(trailers_url) }
      format.xml  { head :ok }
    end
  end
end
