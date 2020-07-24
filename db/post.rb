require_relative 'db'

class Post < Database
  field :title
  field :content

  def self.new_from_db(row)
    self.new.tap do |post|
      post.title = row[0]
      post.content = row[1]
    end
  end
end


sql = 'title varchar(30), content varchar(30)'
# Post.create_table(sql)
# Post.insert(['title', 'content'])
# p Post.all
