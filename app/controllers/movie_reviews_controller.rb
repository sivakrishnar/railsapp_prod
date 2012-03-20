class MovieReviewsController < ApplicationController
  # GET /movie_reviews
  # GET /movie_reviews.xml
  def index
    @movie_reviews = MovieReview.find(:all, :select => "id, title", :order => "updated_at desc", :limit => 40)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @movie_reviews }
    end
  end
  
  # GET /movie_reviews/1
  # GET /movie_reviews/1.xml
  def mobile_show
      @movie_review = MovieReview.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @movie_review }
      end
  end

  # GET /movie_reviews/1
  # GET /movie_reviews/1.xml
  def show
    @movie_review = MovieReview.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @movie_review }
    end
  end

  # GET /movie_reviews/new
  # GET /movie_reviews/new.xml
  def new
    @movie_review = MovieReview.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @movie_review }
    end
  end

  # GET /movie_reviews/1/edit
  def edit
    @movie_review = MovieReview.find(params[:id])
  end

  # POST /movie_reviews
  # POST /movie_reviews.xml
  def create
    @movie_review = MovieReview.new(params[:movie_review])

    respond_to do |format|
      if @movie_review.save
        format.html { redirect_to(@movie_review, :notice => 'Movie review was successfully created.') }
        format.xml  { render :xml => @movie_review, :status => :created, :location => @movie_review }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @movie_review.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /movie_reviews/1
  # PUT /movie_reviews/1.xml
  def update
    @movie_review = MovieReview.find(params[:id])

    respond_to do |format|
      if @movie_review.update_attributes(params[:movie_review])
        format.html { redirect_to(@movie_review, :notice => 'Movie review was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @movie_review.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /movie_reviews/1
  # DELETE /movie_reviews/1.xml
  def destroy
    @movie_review = MovieReview.find(params[:id])
    @movie_review.destroy

    respond_to do |format|
      format.html { redirect_to(movie_reviews_url) }
      format.xml  { head :ok }
    end
  end
end
