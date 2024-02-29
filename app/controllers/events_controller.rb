class EventsController < ApplicationController
    before_action :set_events, only: %i[ show edit update destroy ]
    
    # GET /events or /events.json
    def index
      @events = Events.all
    end
    
    # GET /events/1 or /events/1.json
    def show
    end
    
    # GET /events/new
    def new
      @events = Events.new
    end
    
    # GET /events/1/edit
    def edit
    end
    
    # POST /events or /events.json
    def create
      @events = Events.new(events_params)
    
      respond_to do |format|
        if @events.save
          format.html { redirect_to events_url(@events), notice: "Events was successfully created." }
          format.json { render :show, status: :created, location: @events }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @events.errors, status: :unprocessable_entity }
        end
      end
    end
    
    # PATCH/PUT /events/1 or /events/1.json
    def update
      respond_to do |format|
        if @events.update(events_params)
          format.html { redirect_to events_url(@events), notice: "Events was successfully updated." }
          format.json { render :show, status: :ok, location: @events }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @events.errors, status: :unprocessable_entity }
        end
      end
    end
    
    # DELETE /events/1 or /events/1.json
    def destroy
      @events.destroy
    
      respond_to do |format|
        format.html { redirect_to events_url, notice: "Events was successfully destroyed." }
        format.json { head :no_content }
      end
    end
    
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_events
        @events = Events.find(params[:id])
      end
    
      # Only allow a list of trusted parameters through.
      def events_params
        params.require(:events).permit(:name, :date, :location)
      end
  end