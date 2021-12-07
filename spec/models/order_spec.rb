RSpec.describe Order, type: :model do
  describe 'Database Table' do
    it {
      is_expected.to have_db_column(:id)
        .of_type(:integer)
    }

    it {
      is_expected.to have_db_column(:user_id)
        .of_type(:integer)
    }
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:user).required(true) }
    it { is_expected.to have_many(:items).class_name('OrderItem') }
  end

  describe 'Factory' do
    it 'is expected to be valid' do
      expect(create(:order)).to be_valid
    end
  end
end
