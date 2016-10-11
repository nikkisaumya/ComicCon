class ProfileController < ApplicationController
  before_action :find_profile, only: [:show, :edit, :update, :destroy, :new, :update]
  before_action :authenticate_user!

  def index 
  end 

  def show 
    @profile = Profile.find(params[:id])
  end 

  def new
    @profile = current_user.profile.build
  end 

  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    if @profile.save
      redirect_to @profile, notice: "profile created"
    else 
      render "new"
    end 
  end

  def edit 

  end 

  def update 
    #if @profile.update(profiles_params)
     # redirect_to @profile, notice: "profile updated"
    #else
     # render "edit"
    #end
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      redirect_to @profile
    else
    render 'edit'
  end 
  end 

  def destroy
  end

  private 

  def profiles_params
    params.require(:profile).permit(:name,:about, :image)
  end 

  def find_profile
    @profile = Profile.find(params[:id])
  end 


end
