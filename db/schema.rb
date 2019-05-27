require_relative 'db'

# class Schema < Database
#   TABLE_SCHEMA_POST = <<- SQL
#    title varchar(30), content varchar(30)
#   SQL
# end

class Post < Database
end

sql = 'title varchar(30), content varchar(30)'
# Post.create_table(sql)
Post.insert(['title', 'content'])
# p Database.retrive('posts', '*')
p Post.all
