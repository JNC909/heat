class MeetingsMembersController < ApplicationController
    before_action :set_meeting_member, only: %i[show edit update destroy]
  
    # GET /meetings_members
    def index
      @meetings_members = MeetingsMember.includes(:meeting, :member).all
    end
  
    # GET /meetings_members/1
    def show
    end
  
    # GET /meetings_members/new
    def new
      @meeting_member = MeetingsMember.new
      #below line is new
      @meeting_id = params[:meeting_id]
    end
  
    # GET /meetings_members/1/edit
    def edit
    end
  
    # POST /meetings_members
    def create
      @meeting_member = MeetingsMember.new(meeting_member_params)
  
      respond_to do |format|
        # if @meeting_member.save
        #   format.html { redirect_to @meeting_member, notice: 'Meeting member was successfully created.' }
        #   format.json { render :show, status: :created, location: @meeting_member }
        # else
        #   format.html { render :new, status: :unprocessable_entity }
        #   format.json { render json: @meeting_member.errors, status: :unprocessable_entity }
        if @meeting_member.save
          format.html { redirect_to meetings_members_path, notice: 'Member added to meeting successfully!' }
          format.json { render :show, status: :created, location: @meeting_member }
        else
          format.html { redirect_to meetings_members_path, alert: 'Failed to add member to meeting! ' + @meeting_member.errors.full_messages.join(', ') }
          format.json { render json: @meeting_member.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /meetings_members/1
    def update
      respond_to do |format|
        if @meeting_member.update(meeting_member_params)
          format.html { redirect_to @meeting_member, notice: 'Meeting member was successfully updated.' }
          format.json { render :show, status: :ok, location: @meeting_member }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @meeting_member.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /meetings_members/1
    def destroy
      @meeting_member.destroy
      respond_to do |format|
        format.html { redirect_to meetings_members_url, notice: 'Meeting member was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_meeting_member
        @meeting_member = MeetingsMember.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def meeting_member_params
        # Update these parameters according to the join table's columns
        params.require(:meetings_member).permit(:meeting_id, :member_id)
      end
  end
  