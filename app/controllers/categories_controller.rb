class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]
  before_action :authenticate_user!
  # load_and_authorize_resource

  # GET /categories or /categories.json
  def index
    @categories = current_user.categories
  end

  # GET /categories/1 or /categories/1.json
  def show
    # @category = set_category
    @category = Category.find(params[:id])
    puts "\n\n\n\n #{@category.records.size} \n\n\n\n"
    @records = @category.records.order(created_at: :desc)
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit; end

  # POST /categories or /categories.json
  def create
    @category = current_user.categories.new(category_params)

    respond_to do |format|
      if @category.save
        # format.html { redirect_to category_url(@category), notice: 'Category was successfully created.' }
        format.html { redirect_to categories_path, notice: 'Category was successfully created.' }

      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to category_url(@category), notice: 'Category was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:name, :image)
  end
end