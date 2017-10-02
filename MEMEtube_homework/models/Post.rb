require 'pg'

class Post 

	attr_accessor :id, :title, :body, :url

	def self.open_connection
		PGconn.connect( dbname: 'youtube_videos')
	end

# This is the index page 
	def self.all 
		conn = self.open_connection
		sql = 'SELECT * FROM youtube_vids;'

		results = conn.exec(sql)

		posts = results.map do |record|
			self.hydrate(record)
		end

		posts

	end



def self.hydrate post_data 

	post = Post.new

	post.id = post_data['id']
	post.title = post_data['title']
	post.body = post_data['description']
	post.url = post_data['url']
	post

end

#INDEX 

#SHOW

 def self.find id 

 	conn = self.open_connection
 	sql = "SELECT * FROM youtube_vids WHERE id = #{id}"
 	posts = conn.exec(sql)

 	post = self.hydrate posts[0]

 	post
 end 

#CREATE && #UPDATE if it has ID will update, if not will create a new post 

 	def save
 		conn = Post.open_connection
 		if (!self.id)
 			sql = "INSERT INTO youtube_vids (title, description, url) VALUES ('#{self.title}', '#{self.body}', '#{self.url}')"
 		else
 			sql = "UPDATE youtube_vids SET title = '#{self.title}', description = '#{self.body}', url = '#{self.url}' WHERE id = #{self.id}"
	end 

	conn.exec(sql)


	end 
	def self.destroy id
			conn = self.open_connection
			sql = "DELETE FROM youtube_vids WHERE id = #{id}"
	 		conn.exec(sql)
	 	end
end