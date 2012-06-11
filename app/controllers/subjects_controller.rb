class SubjectsController < ApplicationController

  layout 'admin'

  before_filter :confirm_logged_in

  def index
    list
    render('list')
  end

  def list
    @subjects = Subject.order("subjects.position ASC")
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new(:name => "default_name")
    @subject_count = Subject.count + 1
  end

  def create
    new_position = params[:subject].delete(:position)
    @subject = Subject.new(params[:subject])

    if @subject.save
      flash[:notice] = "Subjected created."
      redirect_to(:action => 'list')
    else
      @subject_count = Subject.count + 1
      render('new')
    end
  end

  def edit
    @subject = Subject.find(params[:id])
    @subject_count = Subject.count
  end

  def update
    new_position = params[:subject].delete(:position)
    @subject = Subject.find(params[:id])
    if @subject.update_attributes(params[:subject])
      flash[:notice] = "Subject updated"
      redirect_to(:action => 'show', :id => @subject.id)
    else
      @subject_count = Subject.count
      render('edit')

    end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy

    subject = Subject.find(params[:id])
    subject.destroy
    flash[:notice] = "Subject deleted"
    redirect_to(:action => 'list')
  end
end
