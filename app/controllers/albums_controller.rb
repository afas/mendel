class AlbumsController < ApplicationController
  load_and_authorize_resource

  # GET /albums
  # GET /albums.xml
  def index
    @category = Category.find_by_short_url(params[:short_url]) if params[:short_url]
    @albums = Album.find_all_by_category_id(@category.id) if @category
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @albums }
    end
  end

  # GET /albums/1
  # GET /albums/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @album }
    end
  end

  # GET /albums/new
  # GET /albums/new.xml
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @album }
    end
  end

  # GET /albums/1/edit
  def edit
  end

  # POST /albums
  # POST /albums.xml
  def create
    respond_to do |format|
      if @album.save
        format.html { redirect_to(@album,
                                  :notice => I18n.t('backend.actions.success_create',
                                                    :model => I18n.t('activerecord.capitalized_models.album'))) }
        format.xml  { render :xml => @album, :status => :created, :location => @album }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @album.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /albums/1
  # PUT /albums/1.xml
  def update
    respond_to do |format|
      if @album.update_attributes(params[:album])
        format.html { redirect_to(@album,
                                  :notice => I18n.t('backend.actions.success_update',
                                                    :model => I18n.t('activerecord.capitalized_models.album'))) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @album.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1
  # DELETE /albums/1.xml
  def destroy
    @album.destroy

    respond_to do |format|
      format.html { redirect_to(albums_url,
                                :notice => I18n.t('backend.actions.success_destroy',
                                                  :model => I18n.t('activerecord.capitalized_models.album'))) }
      format.xml  { head :ok }
    end
  end
end
