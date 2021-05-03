class Condition < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '哺乳類' },
    { id: 3, name: '両生類' },
    { id: 4, name: '鳥類' },
    { id: 5, name: '魚類' },
    { id: 6, name: '爬虫類' },
    { id: 7, name: 'その他' }

  ]

  include ActiveHash::Associations
  has_many :photos
end
