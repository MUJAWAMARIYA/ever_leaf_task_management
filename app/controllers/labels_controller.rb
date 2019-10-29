class LabelsController < ApplicationController
    # before_action :set_label, only: [:show, :edit, :update, :destroy]
    def index
        @labels= Label.all
    end
  
    def new
     @label = Label.new
     @label =current_user.labels.build
    end
    def show
        # @label = Label.new
     Label.find(params[:id])
    end
    # Add this
    def create
    #      Label.create(name: params[:label][:name], description: params[:label][:description]))
    #     Label.create(params.require(:label).permit(:name, :description))
    #     redirect_to "new_label_path"
    #   end
    @label = current_user.label.build(label_params)
    @label = Label.new(label_params)
   @label.user_id = current_user.id # Insert the currently logged in user's id into the blog's user_id column
   
    #@label = Label.new(label_params)
    if @label.save
      # Switch to the list screen and display a message saying "You have created new blog!"
      redirect_to labels_path, notice: "You have created new label!"
    else
      # Redraw the input form.
      render :new
    end

end
def edit
    @label= Label.find(params[:id])
  end
  def update
    @label= Label.find(params[:id])
    if @label.update_attributes(label_params)
      flash[:notice] = 'label updated!'
      redirect_to root_path
    else
      flash[:error] = 'Failed to edit label!'
      render :edit
    end
  end
  def destroy
    @label = Label.find(params[:id])
    #   if @user.labels.present?
    #   Label.where(user_id: params[:id]).destroy_all
    
    if @label.delete
      flash[:notice] = 'label deleted!'
      redirect_to labels_path
    else
      render :destroy
    end
  end

      private
      def label_params
        params.require(:label).permit(:name, :description, :user_id)
      end
    
  end