class BibleLessonCategoriesController < ApplicationController
  before_action :set_bible_lesson_category, only: [:show, :edit, :update, :destroy]

  # GET /bible_lesson_categories
  # GET /bible_lesson_categories.json
  def index
    @bible_lesson_categories = BibleLessonCategory.all
  end

  # GET /bible_lesson_categories/1
  # GET /bible_lesson_categories/1.json
  def show
  end

  # GET /bible_lesson_categories/new
  def new
    @bible_lesson_category = BibleLessonCategory.new
  end

  # GET /bible_lesson_categories/1/edit
  def edit
  end

  # POST /bible_lesson_categories
  # POST /bible_lesson_categories.json
  def create
    @bible_lesson_category = BibleLessonCategory.new(bible_lesson_category_params)

    respond_to do |format|
      if @bible_lesson_category.save
        format.html { redirect_to @bible_lesson_category, notice: 'Bible lesson category was successfully created.' }
        format.json { render :show, status: :created, location: @bible_lesson_category }
      else
        format.html { render :new }
        format.json { render json: @bible_lesson_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bible_lesson_categories/1
  # PATCH/PUT /bible_lesson_categories/1.json
  def update
    respond_to do |format|
      if @bible_lesson_category.update(bible_lesson_category_params)
        format.html { redirect_to @bible_lesson_category, notice: 'Bible lesson category was successfully updated.' }
        format.json { render :show, status: :ok, location: @bible_lesson_category }
      else
        format.html { render :edit }
        format.json { render json: @bible_lesson_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bible_lesson_categories/1
  # DELETE /bible_lesson_categories/1.json
  def destroy
    @bible_lesson_category.destroy
    respond_to do |format|
      format.html { redirect_to bible_lesson_categories_url, notice: 'Bible lesson category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bible_lesson_category
      @bible_lesson_category = BibleLessonCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bible_lesson_category_params
      params.require(:bible_lesson_category).permit(:name, :description)
    end
end
