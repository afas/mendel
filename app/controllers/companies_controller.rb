class CompaniesController < ApplicationController
  load_and_authorize_resource

  # GET /companies
  # GET /companies.xml
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @companies }
    end
  end

  # GET /companies/1
  # GET /companies/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @company }
    end
  end

  # GET /companies/new
  # GET /companies/new.xml
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @company }
    end
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  # POST /companies.xml
  def create
    respond_to do |format|
      if @company.save
        format.html { redirect_to(@company,
                                  :notice => I18n.t('backend.actions.success_create',
                                                    :model => I18n.t('activerecord.capitalized_models.company'))) }
        format.xml  { render :xml => @company, :status => :created, :location => @company }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @company.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /companies/1
  # PUT /companies/1.xml
  def update
    respond_to do |format|
      if @company.update_attributes(params[:company])
        format.html { redirect_to(@company,
                                  :notice => I18n.t('backend.actions.success_update',
                                                    :model => I18n.t('activerecord.capitalized_models.company'))) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @company.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.xml
  def destroy
    @company.destroy

    respond_to do |format|
      format.html { redirect_to(companies_url,
                                :notice => I18n.t('backend.actions.success_destroy',
                                                  :model => I18n.t('activerecord.capitalized_models.company'))) }
      format.xml  { head :ok }
    end
  end
end
