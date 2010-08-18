require 'test_helper'

class UploadedFilesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:uploaded_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create uploaded_file" do
    assert_difference('UploadedFile.count') do
      post :create, :uploaded_file => { }
    end

    assert_redirected_to uploaded_file_path(assigns(:uploaded_file))
  end

  test "should show uploaded_file" do
    get :show, :id => uploaded_files(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => uploaded_files(:one).to_param
    assert_response :success
  end

  test "should update uploaded_file" do
    put :update, :id => uploaded_files(:one).to_param, :uploaded_file => { }
    assert_redirected_to uploaded_file_path(assigns(:uploaded_file))
  end

  test "should destroy uploaded_file" do
    assert_difference('UploadedFile.count', -1) do
      delete :destroy, :id => uploaded_files(:one).to_param
    end

    assert_redirected_to uploaded_files_path
  end
end
