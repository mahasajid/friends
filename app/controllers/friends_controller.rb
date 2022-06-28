require "prawn"
class FriendsController < ApplicationController
  before_action :set_friend, only: %i[ show edit update destroy ]
  before_action :authenticate_account!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  #before_action :output_function, only: %i[ edit update]
  # GET /friends or /friends.json
  after_action :same_name, only: %i[create new update]
  def index
    @friends = Friend.all
  end

  # GET /friends/1 or /friends/1.json
  def show

    # @friend = Friend.find(params[:id])
    # respond_to do |format|
    #   # some other formats like: format.html { render :show }
    #   format.html
    #   format.pdf do
    #     pdf = Prawn::Document.new
    #     pdf.text "#{@friend.first_name} #{@friend.last_name} \n City: #{@friend.city}"
    #     send_data pdf.render,
    #       filename: "export.pdf",
    #       type: 'application/pdf'
    #   end
  end

  # GET /friends/new
  def new
    #@friend = Friend.new(first_name: cookies[:first_name])
    @friend = current_account.friends.build
  end

  # GET /friends/1/edit
  def edit
  end

  def downloadpdf
    @friend = Friend.find(params[:id])
    respond_to do |format|
      # some other formats like: format.html { render :show }
      #format.html
      format.pdf do
        pdf = Prawn::Document.new
        pdf.text "#{@friend.first_name} #{@friend.last_name} \n City: #{@friend.city}"
        send_data pdf.render,
          filename: "#{@friend.first_name}.pdf",
          type: 'application/pdf',
          disposition: 'inline'
          #redirect_to "friends/:id/export.pdf" , allow_other_host: true
      end
      
    end




  #   @friend = Friend.find(params[:id])
  #   format.pdf{ render  send_data generate_pdf(@friend), 
  #   file_name: "#{@friend.first_name}.pdf",
  #   type: 'application/pdf',
  # disposition: 'inline'}
    # send_data generate_pdf(@friend), 
    # file_name: "#{@friend.first_name}.pdf",
    # type: "application/pdf"
    #redirect_to friend_url("#{@friend.first_name}.pdf")
  end
  # POST /friends or /friends.json
  def create
   # @friend = Friend.new(friend_params)
   @friend = current_account.friends.build(friend_params)
    respond_to do |format|
      if @friend.save
       
        format.html { redirect_to friend_url(@friend), notice: "Friend was successfully created." }
        format.json { render :show, status: :created, location: @friend }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /friends/1 or /friends/1.json
  def update
    respond_to do |format|
      flash.now[:notice] = " #{cookies[:first_name]} was last created"
      if @friend.update(friend_params)
        format.html { redirect_to friend_url(@friend), notice: "Friend was successfully updated." }
        format.json { render :show, status: :ok, location: @friend }
      else
        format.html { render :edit, status: :unprocessable_entity }
        flash[:notice] = "Your last action failed"
        flash.now[:notice] = "Your current action failed"
        flash.now[:error] = "Fill the missing fields"
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friends/1 or /friends/1.json
  def destroy
    @friend.destroy

    respond_to do |format|
      format.html { redirect_to friends_url, notice: "Friend was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  def correct_user
    @friend = current_account.friends.find_by(id: params[:id])
    redirect_to friends_path, notice: "You are not authorized for this action" if @friend.nil?

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend
      @friend = Friend.find(params[:id])
    end

    def output_function
      @friend.first_name = "I was tested by callback"
    end

    def same_name
      if Friend.any? { |f| f.first_name == @friend.first_name}
      #if Friend.find(params[:first_name]).first_name == @friend.first_name
        flash.now[:notice] ="We have another #{@friend.first_name} in the database"
      end
    end

    def generate_pdf(friend)
      pdf = Prawn:: Document.new do
        text @friend.first_name
        text @friend.last_name
        text "City: #{friend.city}"

      return pdf
      end
    end
    # Only allow a list of trusted parameters through.
    def friend_params
      params.require(:friend).permit(:first_name, :string, :last_name, :email, :phone, :facebook, :city,  :account_id)
    end
end
