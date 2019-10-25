class LabelsController < ApplicationController
    def index
        @labels= Label.all
    end
  
    def new
     @label = Label.new
    end
    def show
        @label = Label.new
     Label.find(params[:id])
    end
    # Add this
    def create
    #      Label.create(name: params[:label][:name], description: params[:label][:description]))
    #     Label.create(params.require(:label).permit(:name, :description))
    #     redirect_to "new_label_path"
    #   end
    @label = Label.new(label_params)
    if @label.save
      # Switch to the list screen and display a message saying "You have created new blog!"
      redirect_to labels_path, notice: "You have created new blog!"
    else
      # Redraw the input form.
      render :new
    end
  end
      private
      def label_params
        params.require(:label).permit(:name, :description, :user_id)
      end
    
  end