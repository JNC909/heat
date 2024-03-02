class EventsMembersController < ApplicationController
    before_action :set_event_member, only: %i[show edit update destroy]
  
    # GET /events_members
    def index
      @events_members = EventsMember.includes(:event, :member).all
    end
  
    # GET /events_members/1
    def show
    end
  
    # GET /events_members/new
    def new
      @event_member = EventsMember.new
    end
  
    # GET /events_members/1/edit
    def edit
    end
  
    # POST /events_members
    def create
      @event_member = EventsMember.new(event_member_params)
  
      respond_to do |format|
        if @event_member.save
          format.html { redirect_to @event_member, notice: 'Event member was successfully created.' }
          format.json { render :show, status: :created, location: @event_member }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @event_member.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /events_members/1
    def update
      respond_to do |format|
        if @event_member.update(event_member_params)
          format.html { redirect_to @event_member, notice: 'Event member was successfully updated.' }
          format.json { render :show, status: :ok, location: @event_member }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @event_member.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /events_members/1
    def destroy
      @event_member.destroy
      respond_to do |format|
        format.html { redirect_to events_members_url, notice: 'Event member was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_event_member
        @event_member = EventsMember.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def event_member_params
        params.require(:events_member).permit(:event_id, :member_id)
      end
  end
  