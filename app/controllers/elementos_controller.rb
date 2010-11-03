class ElementosController < ApplicationController
  # GET /elementos
  # GET /elementos.xml
  def index
    @elementos = Elemento.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @elementos }
    end
  end


  def nuevo_elemento
    
    @id_elemento_actual = params[:id]
    
    # muestra una noticia determinada
    render(:layout => false)
  
  end


  # GET /elementos/1
  # GET /elementos/1.xml
  def show
    @elemento = Elemento.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @elemento }
    end
  end

  # GET /elementos/new
  # GET /elementos/new.xml
  def new
    @elemento = Elemento.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @elemento }
    end
  end

  # GET /elementos/1/edit
  def edit
    @elemento = Elemento.find(params[:id])
  end

  # POST /elementos
  # POST /elementos.xml
  def create
    @elemento = Elemento.new(params[:elemento])

    respond_to do |format|
      if @elemento.save
        flash[:notice] = 'Elemento was successfully created.'
        format.html { redirect_to(@elemento) }
        format.xml  { render :xml => @elemento, :status => :created, :location => @elemento }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @elemento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /elementos/1
  # PUT /elementos/1.xml
  def update
    @elemento = Elemento.find(params[:id])

    respond_to do |format|
      if @elemento.update_attributes(params[:elemento])
        flash[:notice] = 'Elemento was successfully updated.'
        format.html { redirect_to(@elemento) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @elemento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /elementos/1
  # DELETE /elementos/1.xml
  def destroy
    @elemento = Elemento.find(params[:id])
    @elemento.destroy

    respond_to do |format|
      format.html { redirect_to(elementos_url) }
      format.xml  { head :ok }
    end
  end
end
