class PokemonsController < ApplicationController
  before_action :set_pokemon, only: [:show, :edit, :update, :destroy]

  # GET /pokemons
  # GET /pokemons.json
  def index
    if !session[:location_detected]
      p session[:location_detected] = request.location
    end
    if session[:location_detected]["data"]["latitude"] == "0"# IP Geocoding didin't work
      @pokemons = Pokemon.all
    else
      @visitor_city = session[:location_detected]["data"]["city"]
      @pokemons = Pokemon.near([session[:location_detected]["data"]["latitude"], session[:location_detected]["data"]["longitude"]], 20)
    end
    # Let's DYNAMICALLY build the markers for the view.
    @markers = Gmaps4rails.build_markers(@pokemons) do |pokemon, marker|
      marker.lat pokemon.latitude
      marker.lng pokemon.longitude
      # marker.picture ({"url" => "#{view_context.image_url("pokeball.png")}", "width" => 40, "height" => 60})
      marker.picture ({"url" => "#{view_context.image_url("pokeball_32.png")}", "width" => 32, "height" => 32})
      marker.infowindow render_to_string(partial: 'pokemons/infowindow', locals: {pokemon: pokemon})

    end
  end

  # GET /pokemons/1
  # GET /pokemons/1.json
  def show
    @pokemon_coordinates = {latitude: @pokemon.latitude, longitude: @pokemon.longitude }
  end

  # GET /pokemons/new
  def new
    @pokemon = Pokemon.new
  end

  # GET /pokemons/1/edit
  def edit
  end

  # POST /pokemons
  # POST /pokemons.json
  def create
    @pokemon = Pokemon.new(pokemon_params)

    respond_to do |format|
      if @pokemon.save
        format.html { redirect_to @pokemons, notice: 'Pokemon was successfully created.' }
        format.json { render :show, status: :created, location: @pokemon }
      else
        format.html { render :new }
        format.json { render json: @pokemon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pokemons/1
  # PATCH/PUT /pokemons/1.json
  def update
    respond_to do |format|
      if @pokemon.update(pokemon_params)
        format.html { redirect_to @pokemon, notice: 'Pokemon was successfully updated.' }
        format.json { render :show, status: :ok, location: @pokemon }
      else
        format.html { render :edit }
        format.json { render json: @pokemon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pokemons/1
  # DELETE /pokemons/1.json
  def destroy
    @pokemon.destroy
    respond_to do |format|
      format.html { redirect_to pokemons_url, notice: 'Pokemon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pokemon
      @pokemon = Pokemon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pokemon_params
      params.require(:pokemon).permit(:name, :address, :category, :front_default, :back_default)
    end
end
