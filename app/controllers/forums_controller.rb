class ForumsController < ApplicationController
  before_filter :admin_required, :except => [:index, :show]

  # GET /forums
  # GET /forums.xml
  def index
    # reset the page of each forum we have visited when we go back to index
    session[:forum_page] = nil

    @forums = current_site.ordered_forums

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @forums }
    end
  end

  # GET /forums/1
  # GET /forums/1.xml
  def show
    @forum = current_site.forums.find(params[:id])
    (session[:forums] ||= {})[@forum.id] = Time.now.utc if logged_in?
    (session[:forum_page] ||= Hash.new(1))[@forum.id] = params[:page].to_i if params[:page]

    respond_to do |format|
      format.html do # show.html.erb
        @topics = @forum.topics.paginate :page => params[:page]
      end
      format.xml  { render :xml => @forum }
    end
  end

  # GET /forums/new
  # GET /forums/new.xml
  def new
    @forum = Forum.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @forum }
    end
  end

  # GET /forums/1/edit
  def edit
    @forum = current_site.forums.find(params[:id])
  end

  # POST /forums
  # POST /forums.xml
  def create
    @forum = current_site.forums.build(params[:forum])

    respond_to do |format|
      if @forum.save
        flash[:notice] = 'Forum was successfully created.'
        format.html { redirect_to(@forum) }
        format.xml  { render :xml => @forum, :status => :created, :location => @forum }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @forum.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /forums/1
  # PUT /forums/1.xml
  def update
    @forum = current_site.forums.find(params[:id])

    respond_to do |format|
      if @forum.update_attributes(params[:forum])
        flash[:notice] = 'Forum was successfully updated.'
        format.html { redirect_to(@forum) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @forum.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /forums/1
  # DELETE /forums/1.xml
  def destroy
    @forum = current_site.forums.find(params[:id])
    @forum.destroy

    respond_to do |format|
      format.html { redirect_to(forums_url) }
      format.xml  { head :ok }
    end
  end
end
