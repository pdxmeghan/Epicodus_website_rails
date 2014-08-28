class LessonsController < ApplicationController
  def index
    section = Section.find(params[:section_id])
    @lessons = section.lessons.new
    render('lessons/index.html.erb')
  end

  def show
    @lesson = Lesson.find(params[:id])
    render('lessons/show.html.erb')
  end

  def new
    @sections = Section.all
    @lesson = Lesson.new
    render('lessons/new.html.erb')
  end

  def create
    @lesson = Lesson.create(params[:lesson])
    @lesson.save ? redirect_to("/lessons/#{@lesson.id}") : render('lessons/new.html.erb')
  end

  def edit
    @lesson = Lesson.find(params[:id])
    render('lessons/edit.html.erb')
  end

  def update
    @lesson = Lesson.find(params[:id])
    @lesson.update(params[:lesson]) ? redirect_to("/lessons/#{@lesson.id}") : render('lessons/edit.html.erb')
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
    redirect_to("/sections")
  end
end
