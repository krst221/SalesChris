require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test 'render a list of products' do
    get products_path 

    assert_response :success
    assert_select '.product', 2
  end

  test 'render a detailed product page' do
    get product_path(products(:switch))

    assert_response :success
    assert_select '.title', 'Nintendo Switch'
    assert_select '.description', 'Versión OLED, en buen estado'
    assert_select '.price', '200€'
  end

  test 'render a new product form' do
    get new_product_path

    assert_response :success
    assert_select 'form'
  end

  test 'allow to create a new product' do
    post products_path, params: {
      product: {
        title: 'PlayStation 2',
        description: 'Modelo slim, algunos golpes',
        price: 100
      }
    }

    assert_redirected_to products_path
  end
end