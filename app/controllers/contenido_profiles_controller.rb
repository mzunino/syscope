class ContenidoProfilesController < ApplicationController
  # GET /contenido_profiles
  # GET /contenido_profiles.xml
  def index
    @contenido_profiles = ContenidoProfile.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @contenido_profiles }
    end
  end

  # GET /contenido_profiles/1
  # GET /contenido_profiles/1.xml
  def show
    @contenido_profile = ContenidoProfile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @contenido_profile }
    end
  end

  # GET /contenido_profiles/new
  # GET /contenido_profiles/new.xml
  def new
    @contenido_profile = ContenidoProfile.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @contenido_profile }
    end
  end

  # GET /contenido_profiles/1/edit
  def edit
    @contenido_profile = ContenidoProfile.find(params[:id])
  end

  # POST /contenido_profiles
  # POST /contenido_profiles.xml
  def create
    @contenido_profile = ContenidoProfile.new(params[:contenido_profile])

    respond_to do |format|
      if @contenido_profile.save
        flash[:notice] = 'ContenidoProfile was successfully created.'
        format.html { redirect_to(@contenido_profile) }
        format.xml  { render :xml => @contenido_profile, :status => :created, :location => @contenido_profile }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @contenido_profile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /contenido_profiles/1
  # PUT /contenido_profiles/1.xml
  def update
    @contenido_profile = ContenidoProfile.find(params[:id])

    respond_to do |format|
      if @contenido_profile.update_attributes(params[:contenido_profile])
        flash[:notice] = 'ContenidoProfile was successfully updated.'
        format.html { redirect_to(@contenido_profile) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @contenido_profile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /contenido_profiles/1
  # DELETE /contenido_profiles/1.xml
  def destroy
    @contenido_profile = ContenidoProfile.find(params[:id])
    @contenido_profile.destroy

    respond_to do |format|
      format.html { redirect_to(contenido_profiles_url) }
      format.xml  { head :ok }
    end
  end
end
