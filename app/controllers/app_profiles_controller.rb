class AppProfilesController < ApplicationController
  # GET /app_profiles
  # GET /app_profiles.xml
  def index
    @app_profiles = AppProfile.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @app_profiles }
    end
  end

  # GET /app_profiles/1
  # GET /app_profiles/1.xml
  def show
    @app_profile = AppProfile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @app_profile }
    end
  end

  # GET /app_profiles/new
  # GET /app_profiles/new.xml
  def new
    @app_profile = AppProfile.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @app_profile }
    end
  end

  # GET /app_profiles/1/edit
  def edit
    @app_profile = AppProfile.find(params[:id])
  end

  # POST /app_profiles
  # POST /app_profiles.xml
  def create
    @app_profile = AppProfile.new(params[:app_profile])

    respond_to do |format|
      if @app_profile.save
        flash[:notice] = 'AppProfile was successfully created.'
        format.html { redirect_to(@app_profile) }
        format.xml  { render :xml => @app_profile, :status => :created, :location => @app_profile }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @app_profile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /app_profiles/1
  # PUT /app_profiles/1.xml
  def update
    @app_profile = AppProfile.find(params[:id])

    respond_to do |format|
      if @app_profile.update_attributes(params[:app_profile])
        flash[:notice] = 'AppProfile was successfully updated.'
        format.html { redirect_to(@app_profile) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @app_profile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /app_profiles/1
  # DELETE /app_profiles/1.xml
  def destroy
    @app_profile = AppProfile.find(params[:id])
    @app_profile.destroy

    respond_to do |format|
      format.html { redirect_to(app_profiles_url) }
      format.xml  { head :ok }
    end
  end
end
