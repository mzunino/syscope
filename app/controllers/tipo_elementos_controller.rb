class TipoElementosController < ApplicationController
  # GET /tipo_elementos
  # GET /tipo_elementos.xml
  def index
    @tipo_elementos = TipoElemento.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tipo_elementos }
    end
  end

  # GET /tipo_elementos/1
  # GET /tipo_elementos/1.xml
  def show
    @tipo_elemento = TipoElemento.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tipo_elemento }
    end
  end

  # GET /tipo_elementos/new
  # GET /tipo_elementos/new.xml
  def new
    @tipo_elemento = TipoElemento.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tipo_elemento }
    end
  end

  # GET /tipo_elementos/1/edit
  def edit
    @tipo_elemento = TipoElemento.find(params[:id])
  end

  # POST /tipo_elementos
  # POST /tipo_elementos.xml
  def create
    @tipo_elemento = TipoElemento.new(params[:tipo_elemento])

    respond_to do |format|
      if @tipo_elemento.save
        flash[:notice] = 'TipoElemento was successfully created.'
        format.html { redirect_to(@tipo_elemento) }
        format.xml  { render :xml => @tipo_elemento, :status => :created, :location => @tipo_elemento }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tipo_elemento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tipo_elementos/1
  # PUT /tipo_elementos/1.xml
  def update
    @tipo_elemento = TipoElemento.find(params[:id])

    respond_to do |format|
      if @tipo_elemento.update_attributes(params[:tipo_elemento])
        flash[:notice] = 'TipoElemento was successfully updated.'
        format.html { redirect_to(@tipo_elemento) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tipo_elemento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_elementos/1
  # DELETE /tipo_elementos/1.xml
  def destroy
    @tipo_elemento = TipoElemento.find(params[:id])
    @tipo_elemento.destroy

    respond_to do |format|
      format.html { redirect_to(tipo_elementos_url) }
      format.xml  { head :ok }
    end
  end
end
