FactoryGirl.define do
  factory :order, :class => IoMerchant::Order do |t|
    t.code 'xxx'
    t.total_amount 10
    t.status  'created'

    t.buyer {|u| u.association(:user) }
    # t.seller {|u| u.association(:user) }


  end

end
