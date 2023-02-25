require 'test_helper'

class CategoryRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category_record = category_records(:one)
  end

  test 'should get index' do
    get category_records_url
    assert_response :success
  end

  test 'should get new' do
    get new_category_record_url
    assert_response :success
  end

  test 'should create category_record' do
    assert_difference('CategoryRecord.count') do
      post category_records_url, params: { category_record: {} }
    end

    assert_redirected_to category_record_url(CategoryRecord.last)
  end

  test 'should show category_record' do
    get category_record_url(@category_record)
    assert_response :success
  end

  test 'should get edit' do
    get edit_category_record_url(@category_record)
    assert_response :success
  end

  test 'should update category_record' do
    patch category_record_url(@category_record), params: { category_record: {} }
    assert_redirected_to category_record_url(@category_record)
  end

  test 'should destroy category_record' do
    assert_difference('CategoryRecord.count', -1) do
      delete category_record_url(@category_record)
    end

    assert_redirected_to category_records_url
  end
end
