class FuncAppsController < ApplicationController
  # GET /func_apps
  # GET /func_apps.xml
  def index
    @func_apps = FuncApp.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @func_apps }
    end
  end

  # GET /func_apps/1
  # GET /func_apps/1.xml
  def show
    @func_app = FuncApp.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @func_app }
    end
  end

  # GET /func_apps/new
  # GET /func_apps/new.xml
  def new
    @func_app = FuncApp.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @func_app }
    end
  end

  # GET /func_apps/1/edit
  def edit
    @func_app = FuncApp.find(params[:id])
  end

  # POST /func_apps
  # POST /func_apps.xml
  def create
    @func_app = FuncApp.new(params[:func_app])

    respond_to do |format|
      if @func_app.save
        flash[:notice] = 'FuncApp was successfully created.'
        format.html { redirect_to(@func_app) }
        format.xml  { render :xml => @func_app, :status => :created, :location => @func_app }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @func_app.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /func_apps/1
  # PUT /func_apps/1.xml
  def update
    @func_app = FuncApp.find(params[:id])

    respond_to do |format|
      if @func_app.update_attributes(params[:func_app])
        flash[:notice] = 'FuncApp was successfully updated.'
        format.html { redirect_to(@func_app) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @func_app.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /func_apps/1
  # DELETE /func_apps/1.xml
  def destroy
    @func_app = FuncApp.find(params[:id])
    @func_app.destroy

    respond_to do |format|
      format.html { redirect_to(func_apps_url) }
      format.xml  { head :ok }
    end
  end
end
