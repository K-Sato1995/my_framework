require_relative 'db'

class Post < Database
end

sql = 'title varchar(30), content varchar(30)'
Post.create_table(sql)
