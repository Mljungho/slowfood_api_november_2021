#  1. we need a Product so we actually have something to order
#  2. We need a user so we know who ordered a Product
#  3. We need to be able to create an Order and connect/associate it with the User
#  4. We need to associate the Order with a Product using a join table that we will call OrderItem

RSpec.describe 'POST /api/orders', type: :request do
  let!(:user) { create(:user) }
  let(:product) { create(:product) }
  subject { response }

  before do
    post '/api/orders', params: {
      order: {
        product_id: product.id, user_id: user.id
      }
    }
    @order = Order.last
  end

  it { is_expected.to have_http_status :created }

  it 'is expected to create an instance of Order' do
    expect(Order.last).to_not eq nil
  end

  it 'is expected to associate order with user' do
    expect(@order.user).to eq user
  end

  it 'is expected to create an order_item' do
    expect(@order.items).to_not eq nil
  end

  it 'is expected to associatethe product with the order' do
    expect(@order.products.first).to eq product
  end

end
