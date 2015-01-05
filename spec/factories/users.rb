FactoryGirl.define do
  factory :user, :class => IoMerchant::Buyer do |t|
    t.name 'xxx'
    t.email  'xxx@gmail.com'
    t.kind  'buyer'


  end

end
