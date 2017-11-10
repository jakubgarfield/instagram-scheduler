class PublishPendingToInstagram
  def self.call
    Post.where(published_at: nil, message: nil).where("scheduled_at < ?", Time.now).group_by(&:instagram_account_id).each do |instagram_account_id, posts|
      instagram_account = InstagramAccount.find(instagram_account_id)
      client = InstagramUpload::Client.new(instagram_account.username, instagram_account.password)

      posts.each do |post|
        result = client.upload_photo(post.picture.path, post.title)

        if result["status"] == "fail"
          post.update_attributes!(published_at: Time.now, message: result["message"])
        else
          post.update_attributes!(published_at: Time.now)
        end
      end
    end
  end
end
