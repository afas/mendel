class ExhibitsController < ApplicationController
  #layout false

  def show
    @static = Static.find_by_short_url("museum")
    @exhibit = Exhibit.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def edit
    @exhibit = Exhibit.find(params[:id])
  end

  def upload
    filename = params[:qqfile]
    file = File.open("/tmp/#{filename}", 'wb')
    file.write(request.body.read)
    file.close

    exhibit = Exhibit.create(:image => File.open("/tmp/#{filename}", 'r'))

    File.delete("/tmp/#{filename}")

    render :text => "{success:true, new_filename:'#{exhibit.image.url(:preview_item)}'}"
  rescue Exception => e
    render :text => "{error:#{e.message}}"
  end

  def destroy
    @exhibit = Exhibit.find(params[:id])
    @exhibit.destroy

    respond_to do |format|
      format.html { redirect_to(museum_path,
                                :notice => I18n.t('backend.actions.success_destroy',
                                                  :model => I18n.t('activerecord.capitalized_models.exhibit'))) }
      format.xml  { head :ok }
    end
  end

  def update
    @exhibit = Exhibit.find(params[:id])

    respond_to do |format|
      if @exhibit.update_attributes(params[:exhibit])
        format.html { redirect_to(@exhibit,
                                  :notice => I18n.t('backend.actions.success_update',
                                                    :model => I18n.t('activerecord.capitalized_models.exhibit'))) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @exhibit.errors, :status => :unprocessable_entity }
      end
    end
  end

  #def update
  #  exhibit = Exhibit.find(params[:id])
  #
  #  unless exhibit.nil?
  #    #image.cover = params[:cover]
  #    #image.preview = params[:preview]
  #    if params[:title] == 'empty'
  #      exhibit.title = ''
  #    else
  #      exhibit.title = params[:title]
  #    end
  #    exhibit.save
  #  end
  #
  #  render :text => "Ok"
  #end
end
