#  1. we need a Product so we actually have something to order
#  2. We need a user so we know who ordered a Product
#  3. We need to be able to create an Order and connect/associate it with the User
#  4. We need to associate the Order with a Product using a join table that we will call OrderItem

RSpec.describe 'POST /api/orders' do
  subject { response }
  before do
    post '/api/orders', params: { order: { productI_id: 1, user_id: 1 } }
  end

  it { is_expected.to have_http_status :created }
end
