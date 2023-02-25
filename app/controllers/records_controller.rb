class RecordsController < ApplicationController
  before_action :set_record, only: %i[show edit update destroy]

  def index
    @records = Record.all
    # @category = Category.find(params[:category_id])
    # @records = @category.records
  end

  def show; end

  # GET /records/new
  def new
    @record = Record.new
    @category = Category.find(params[:category_id])
  end

  # GET /records/1/edit
  def edit; end

  def create
    @category = Category.find(params[:category_id])
    @record = Record.new(record_params)
    @record.user_id = current_user.id
    @record.save!
    category_record = @category.category_records.new(record: @record)
    # OR category_record = CategoryRecord.create!(category: @category, record: @record)

    respond_to do |format|
      if category_record.save
        # format.html { redirect_to record_url(@record), notice: "Record was successfully created." }
        # format.html { redirect_to category_url(@category), notice: "Record was successfully created." }
        format.html { redirect_to new_category_record_path(@category), notice: 'Record was successfully created.' }

      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # def create
  #   @record = Record.new(record_params)
  #   @record.user_id = current_user.id
  #   @record.save!
  #   @full_tran = @record.categories_records.create!(category_id: params[:category_id])
  #   @adding_to_cat = Category.find(@full_tran.category_id)
  #   @adding_to_cat.total += @record.amount
  #   respond_to do |format|
  #     if @full_tran.save
  #       format.html do
  #         @adding_to_cat.save
  #         redirect_to category_url(@full_tran.category_id),
  #                     notice: 'record was successfully created.'
  #       end
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /records/1 or /records/1.json
  def update
    respond_to do |format|
      if @record.update(record_params)
        format.html { redirect_to record_url(@record), notice: 'Record was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /records/1 or /records/1.json
  def destroy
    @record.destroy

    respond_to do |format|
      format.html { redirect_to records_url, notice: 'Record was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_record
    # @record = Record.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def record_params
    # params.require(:record).permit(:name, :amount, :user_id)
    params.require(:record).permit(:name, :amount)
  end
end