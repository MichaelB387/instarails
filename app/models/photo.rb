class Photo < ApplicationRecord
  include ImageUploader::Attachment.new(:image)
  
  belongs_to :user
  has_and_belongs_to_many :likers, class_name: 'User', join_table: :likes
  
  # Group_photo.liked_by?(jo)
  def liked_by?(user)
    likers.exists?(user.id)
  end

  def toggle_liked_by(user)
    # If photo has been liked by 'user'?
    if likers.exists?(user.id)
      likers.destroy(user.id)
      # If photo has not been liked by user
    else
      likers << user
    end
  end

end



# photo = Photo.first
# all_people_who_liked_that_photo = photo.likers

# other_person = User.second
# # To make other_person like photo:
# phot.likers << other_person # Whne they click the like button
# photo.likers.destroy(other_person) # When they click the unlike button
