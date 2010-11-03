class ContenidosController < ApplicationController
  # GET /contenidos
  # GET /contenidos.xml
  def index
    @contenidos = Contenido.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @contenidos }
    end
  end

  # GET /contenidos/1
  # GET /contenidos/1.xml
  def show
    @contenido = Contenido.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @contenido }
    end
  end

  # GET /contenidos/new
  # GET /contenidos/new.xml
  def new
    @contenido = Contenido.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @contenido }
    end
  end

  # GET /contenidos/1/edit
  def edit
    @contenido = Contenido.find(params[:id])
  end

  # GET /contenidos/admin
  def admin

  end

public 

# POST /contenidos
  # POST /contenidos.xml
  def create
    @contenido = Contenido.new(params[:contenido])

    respond_to do |format|
      if @contenido.save
        flash[:notice] = 'Contenido was successfully created.'
        format.html { redirect_to(@contenido) }
        format.xml  { render :xml => @contenido, :status => :created, :location => @contenido }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @contenido.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /contenidos/1
  # PUT /contenidos/1.xml
  def update
    @contenido = Contenido.find(params[:id])

    respond_to do |format|
      if @contenido.update_attributes(params[:contenido])
        flash[:notice] = 'Contenido was successfully updated.'
        format.html { redirect_to(@contenido) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @contenido.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /contenidos/1
  # DELETE /contenidos/1.xml
  def destroy
    @contenido = Contenido.find(params[:id])
    @contenido.destroy

    respond_to do |format|
      format.html { redirect_to(contenidos_url) }
      format.xml  { head :ok }
    end
  end
  
  
end
