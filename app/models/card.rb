class Card < ActiveRecord::Base
  attr_accessible :description, :image
  has_attached_file :image

  validates :description, presence: true
  validates :user_id, presence: true
  validates_attachment :image, presence: true,
                               content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] },
                               size: { less_than: 5.megabytes }

  belongs_to :user
  has_attached_file :image, styles: { :thumb => "100x100#",
                                      :small  => "150x150>",
                                      :square => "200x200>",
                                      :medium => "300x300>"  }
end
