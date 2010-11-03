class ContainersController < ApplicationController

  # GET /layouts
  # GET /layouts.xml
  def index
    @containers = Container.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @containers }
    end
  end

  # GET /layouts/1
  # GET /layouts/1.xml
  def show
    @container = Container.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @container }
    end
  end

  # GET /layouts/new
  # GET /layouts/new.xml
  def new
    @container = Container.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @container }
    end
  end

  # GET /layouts/1/edit
  def edit
    @container = Container.find(params[:id])
  end

  # POST /layouts
  # POST /layouts.xml
  def create
    @container = Container.new(params[:container])

    respond_to do |format|
      if @container.save
        flash[:notice] = 'El contenedor fue creado con éxito.'
        format.html { redirect_to(@container) }
        format.xml  { render :xml => @container, :status => :created, :location => @container }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @container.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /layouts/1
  # PUT /layouts/1.xml
  def update
    @container = Container.find(params[:id])

    respond_to do |format|
      if @container.update_attributes(params[:container])
        flash[:notice] = 'El contenedor fue actualizado correctamente.'
        format.html { redirect_to(@container) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @container.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /layouts/1
  # DELETE /layouts/1.xml
  def destroy
    @container = Container.find(params[:id])
    @container.destroy

    respond_to do |format|
      format.html { redirect_to(containers_url) }
      format.xml  { head :ok }
    end
  end
end
