class MuseumController < ApplicationController
  #load_and_authorize_resource

  # GET /albums
  # GET /albums.xml
  def index
    @exhibits = Exhibit.all
    @static = Static.find_by_short_url("museum")
    respond_to do |format|
      format.html # index.html.erb
    end
  end
  #
  ## GET /albums/1
  ## GET /albums/1.xml
  #def exhibit
  #  respond_to do |format|
  #    format.html # show.html.erb
  #  end
  #end

  # GET /albums/1/edit
  def add_exhibitions
  end

end
