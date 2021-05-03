class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :post_code, :area_id, :city, :home_num, :building_name, :tel, :photo_id, :user_id, :token

  validates :area_id, numericality: { other_than: 1 }

  with_options presence: true do
    validates :photo_id
    validates :user_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :city
    validates :home_num
    validates :tel, format: { with: /\A[0-9]{11}\z/ }
    validates :token
  end

  def save
    purchase = Purchase.create(photo_id: photo_id, user_id: user_id)

    Address.create(post_code: post_code, area_id: area_id, city: city, home_num: home_num,
                   building_name: building_name, tel: tel, purchase_id: purchase.id)
  end
end
