require_relative 'db'

class Schema < Database
  POST = <<- SQL
   title varchar(30), content varchar(30)
  SQL
end

sql = 'title varchar(30), content varchar(30)'
# Post.create_table(sql)
Post.insert(['title', 'content'])
# p Database.retrive('posts', '*')
p Post.all
