class BibleLessonsController < ApplicationController
  before_action :set_bible_lesson, only: [:show, :edit, :update, :destroy]

  # GET /bible_lessons
  # GET /bible_lessons.json
  def index
    @bible_lessons = BibleLesson.all
  end

  # GET /bible_lessons/1
  # GET /bible_lessons/1.json
  def show
  end

  # GET /bible_lessons/new
  def new
    @bible_lesson = BibleLesson.new
  end

  # GET /bible_lessons/1/edit
  def edit
  end

  # POST /bible_lessons
  # POST /bible_lessons.json
  def create
    @bible_lesson = BibleLesson.new(bible_lesson_params)

    respond_to do |format|
      if @bible_lesson.save
        format.html { redirect_to @bible_lesson, notice: 'Bible lesson was successfully created.' }
        format.json { render :show, status: :created, location: @bible_lesson }
      else
        format.html { render :new }
        format.json { render json: @bible_lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bible_lessons/1
  # PATCH/PUT /bible_lessons/1.json
  def update
    respond_to do |format|
      if @bible_lesson.update(bible_lesson_params)
        format.html { redirect_to @bible_lesson, notice: 'Bible lesson was successfully updated.' }
        format.json { render :show, status: :ok, location: @bible_lesson }
      else
        format.html { render :edit }
        format.json { render json: @bible_lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bible_lessons/1
  # DELETE /bible_lessons/1.json
  def destroy
    @bible_lesson.destroy
    respond_to do |format|
      format.html { redirect_to bible_lessons_url, notice: 'Bible lesson was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bible_lesson
      @bible_lesson = BibleLesson.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bible_lesson_params
      params.require(:bible_lesson).permit(:title, :subject, :category_id, :author_id, :tags, :lesson)
    end
end
