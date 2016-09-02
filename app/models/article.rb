class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 4 }
 
  mount_uploader :picture, PictureUploader
  validates_processing_of :picture
validate :picture_size_validation
 
private
  def picture_size_validation
    errors[:picture] << "should be less than 700KB" if picture.size > 0.7.megabytes
  end
end
