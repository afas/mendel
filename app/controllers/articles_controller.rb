class ArticlesController < ApplicationController
  load_and_authorize_resource

  # GET /articles
  # GET /articles.xml
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.xml
  def show
    @category = @article.category
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @article }
    end
  end

  # GET /articles/new
  # GET /articles/new.xml
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @article }
    end
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.xml
  def create
    respond_to do |format|
      if @article.save
        format.html { redirect_to(@article,
                                  :notice => I18n.t('backend.actions.success_create',
                                                    :model => I18n.t('activerecord.capitalized_models.article'))) }
        format.xml  { render :xml => @article, :status => :created, :location => @article }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.xml
  def update
    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to(@article,
                                  :notice => I18n.t('backend.actions.success_update',
                                                    :model => I18n.t('activerecord.capitalized_models.article'))) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.xml
  def destroy
    @article.destroy

    respond_to do |format|
      format.html { redirect_to(articles_url,
                                :notice => I18n.t('backend.actions.success_destroy',
                                                  :model => I18n.t('activerecord.capitalized_models.article'))) }
      format.xml  { head :ok }
    end
  end
end
