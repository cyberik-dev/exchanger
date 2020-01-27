RSpec.describe CurrencyPair, type: :model do
  context 'enums' do
    it do
      should define_enum_for(:target).with_values %i[aud bgn brl cad chf cny czk dkk eur gbp hkd hrk huf idr ils inr
                                                     jpy krw mxn myr nok nzd php pln ron rub sek sgd thb try usd zar]
    end
  end

  context 'associations' do
    it { should belong_to(:user) }
  end

  context 'validations' do
    %i[amount duration].each do |field|
      it { should validate_numericality_of(field).is_greater_than(0) }
    end
  end
end
