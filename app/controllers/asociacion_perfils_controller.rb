class AsociacionPerfilsController < ApplicationController
  # GET /asociacion_perfils
  # GET /asociacion_perfils.xml
  def index
    @asociacion_perfils = AsociacionPerfil.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @asociacion_perfils }
    end
  end

  # GET /asociacion_perfils/1
  # GET /asociacion_perfils/1.xml
  def show
    @asociacion_perfil = AsociacionPerfil.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @asociacion_perfil }
    end
  end

  # GET /asociacion_perfils/new
  # GET /asociacion_perfils/new.xml
  def new
    @asociacion_perfil = AsociacionPerfil.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @asociacion_perfil }
    end
  end

  # GET /asociacion_perfils/1/edit
  def edit
    @asociacion_perfil = AsociacionPerfil.find(params[:id])
  end

  # POST /asociacion_perfils
  # POST /asociacion_perfils.xml
  def create
    @asociacion_perfil = AsociacionPerfil.new(params[:asociacion_perfil])

    respond_to do |format|
      if @asociacion_perfil.save
        flash[:notice] = 'AsociacionPerfil was successfully created.'
        format.html { redirect_to(@asociacion_perfil) }
        format.xml  { render :xml => @asociacion_perfil, :status => :created, :location => @asociacion_perfil }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @asociacion_perfil.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /asociacion_perfils/1
  # PUT /asociacion_perfils/1.xml
  def update
    @asociacion_perfil = AsociacionPerfil.find(params[:id])

    respond_to do |format|
      if @asociacion_perfil.update_attributes(params[:asociacion_perfil])
        flash[:notice] = 'AsociacionPerfil was successfully updated.'
        format.html { redirect_to(@asociacion_perfil) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @asociacion_perfil.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /asociacion_perfils/1
  # DELETE /asociacion_perfils/1.xml
  def destroy
    @asociacion_perfil = AsociacionPerfil.find(params[:id])
    @asociacion_perfil.destroy

    respond_to do |format|
      format.html { redirect_to(asociacion_perfils_url) }
      format.xml  { head :ok }
    end
  end
end
