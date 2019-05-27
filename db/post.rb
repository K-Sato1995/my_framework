require_relative 'db'

class Post < Database
  def initialize(attributes)
    @title = attributes[0]
    @content = attributes[1]
  end
end

sql = 'title varchar(30), content varchar(30)'
# Post.create_table(sql)
Post.insert(['title', 'content'])
p Post.all
