require 'test_helper'

class AlbumImagesControllerTest < ActionController::TestCase
  setup do
    @album_image = album_images(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:album_images)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create album_image" do
    assert_difference('AlbumImage.count') do
      post :create, :album_image => @album_image.attributes
    end

    assert_redirected_to album_image_path(assigns(:album_image))
  end

  test "should show album_image" do
    get :show, :id => @album_image.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @album_image.to_param
    assert_response :success
  end

  test "should update album_image" do
    put :update, :id => @album_image.to_param, :album_image => @album_image.attributes
    assert_redirected_to album_image_path(assigns(:album_image))
  end

  test "should destroy album_image" do
    assert_difference('AlbumImage.count', -1) do
      delete :destroy, :id => @album_image.to_param
    end

    assert_redirected_to album_images_path
  end
end
