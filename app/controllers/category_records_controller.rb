class CategoryRecordsController < ApplicationController
  before_action :set_category_record, only: %i[show edit update destroy]

  # GET /category_records or /category_records.json
  def index
    @category_records = CategoryRecord.all
  end

  # GET /category_records/1 or /category_records/1.json
  def show; end

  # GET /category_records/new
  def new
    @category_record = CategoryRecord.new
  end

  # GET /category_records/1/edit
  def edit; end

  # POST /category_records or /category_records.json
  def create
    @category_record = CategoryRecord.new(category_record_params)

    respond_to do |format|
      if @category_record.save
        format.html do
          redirect_to category_record_url(@category_record), notice: 'Category record was successfully created.'
        end
        format.json { render :show, status: :created, location: @category_record }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /category_records/1 or /category_records/1.json
  def update
    respond_to do |format|
      if @category_record.update(category_record_params)
        format.html do
          redirect_to category_record_url(@category_record), notice: 'Category record was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @category_record }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /category_records/1 or /category_records/1.json
  def destroy
    @category_record.destroy

    respond_to do |format|
      format.html { redirect_to category_records_url, notice: 'Category record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category_record
    @category_record = CategoryRecord.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def category_record_params
    params.require(:category_record).permit(:category_id, :record_id)
  end
end
