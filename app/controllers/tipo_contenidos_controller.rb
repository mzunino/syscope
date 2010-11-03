class TipoContenidosController < ApplicationController
  # GET /tipo_contenidos
  # GET /tipo_contenidos.xml
  def index
    @tipo_contenidos = TipoContenido.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tipo_contenidos }
    end
  end

  # GET /tipo_contenidos/1
  # GET /tipo_contenidos/1.xml
  def show
    @tipo_contenido = TipoContenido.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tipo_contenido }
    end
  end

  # GET /tipo_contenidos/new
  # GET /tipo_contenidos/new.xml
  def new
    @tipo_contenido = TipoContenido.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tipo_contenido }
    end
  end

  # GET /tipo_contenidos/1/edit
  def edit
    @tipo_contenido = TipoContenido.find(params[:id])
  end

  # POST /tipo_contenidos
  # POST /tipo_contenidos.xml
  def create
    @tipo_contenido = TipoContenido.new(params[:tipo_contenido])

    respond_to do |format|
      if @tipo_contenido.save
        flash[:notice] = 'TipoContenido was successfully created.'
        format.html { redirect_to(@tipo_contenido) }
        format.xml  { render :xml => @tipo_contenido, :status => :created, :location => @tipo_contenido }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tipo_contenido.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tipo_contenidos/1
  # PUT /tipo_contenidos/1.xml
  def update
    @tipo_contenido = TipoContenido.find(params[:id])

    respond_to do |format|
      if @tipo_contenido.update_attributes(params[:tipo_contenido])
        flash[:notice] = 'TipoContenido was successfully updated.'
        format.html { redirect_to(@tipo_contenido) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tipo_contenido.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_contenidos/1
  # DELETE /tipo_contenidos/1.xml
  def destroy
    @tipo_contenido = TipoContenido.find(params[:id])
    @tipo_contenido.destroy

    respond_to do |format|
      format.html { redirect_to(tipo_contenidos_url) }
      format.xml  { head :ok }
    end
  end
end
