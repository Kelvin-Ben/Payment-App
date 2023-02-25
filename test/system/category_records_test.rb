require "application_system_test_case"

class CategoryRecordsTest < ApplicationSystemTestCase
  setup do
    @category_record = category_records(:one)
  end

  test "visiting the index" do
    visit category_records_url
    assert_selector "h1", text: "Category records"
  end

  test "should create category record" do
    visit category_records_url
    click_on "New category record"

    click_on "Create Category record"

    assert_text "Category record was successfully created"
    click_on "Back"
  end

  test "should update Category record" do
    visit category_record_url(@category_record)
    click_on "Edit this category record", match: :first

    click_on "Update Category record"

    assert_text "Category record was successfully updated"
    click_on "Back"
  end

  test "should destroy Category record" do
    visit category_record_url(@category_record)
    click_on "Destroy this category record", match: :first

    assert_text "Category record was successfully destroyed"
  end
end
