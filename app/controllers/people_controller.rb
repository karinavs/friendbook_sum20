class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]
  def index
    @people = Person.all
  end

  def show
  end

  def new
    @person = Person.new
    render partial: 'form'
  end

  def create
    @Person = Person.new(person_params)
    if @person.save
      redirect_to people_path
    else
      render :new
    end

  def edit
    render partial: 'form'
  end

  def update
    if @person.update(person_params)
      redirect_to people_path
    else
      render :edit 
    end
  end 
  
  def destroy
    @person.destroy
    redirect_to people_path
  end

  Private
    def person_params
      params.require(:person).permit(:first_name, :last_name, :avatar, :phone, :email)
    end 

    def set_person
      @person = Person.find(params[:id])
    end
  end
end   
