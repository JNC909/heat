require 'axlsx'

class MeetingsMembersController < ApplicationController
    before_action :set_meeting_member, only: %i[show edit update destroy]
  
    # GET /meetings_members
    def index
      #@meetings_members = MeetingsMember.includes(:meeting, :member).all
      @meetings_members = MeetingsMember.includes(:meeting, :member).order('meetings.date DESC')
      @meetings = Meeting.all
    end

    #for exporting table data
    def export
      @meetings = Meeting.order(date: :desc)
      package = Axlsx::Package.new
      wb = package.workbook
      wb.add_worksheet(name: 'Meetings Attendance') do |sheet|
        sheet.add_row ['Date', 'Meeting', 'Members']
        @meetings.each do |meeting|
          members_list = meeting.members.any? ? meeting.members.map(&:member_name).join(', ') : 'No attendees yet'
          sheet.add_row [meeting.date.strftime('%B %d, %Y'), meeting.name, members_list]
        end
      end
  
      send_data package.to_stream.read, filename: 'meetings_attendance.xlsx', type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
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

      # Check if the member is already in the meeting
      if MeetingsMember.exists?(meeting_id: @meeting_member.meeting_id, member_id: @meeting_member.member_id)
        redirect_to meetings_members_path, alert: 'Member is already in the meeting!'
        return
      end
  
      respond_to do |format|
        if @meeting_member.save

          @member = Member.find(@meeting_member.member_id)
          @member.increment!(:member_points)

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
  