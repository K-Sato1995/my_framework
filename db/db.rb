require 'sqlite3'
require 'active_support/inflector'

class Database
  @@db = SQLite3::Database.new("app.db")

  def initialize(attributes)
    @attributes = attributes
  end

  def self.create_table(sql_schema)
    @@db.execute <<-SQL
      create table #{table_name} (
        #{sql_schema}
      );
    SQL
  end

  def self.insert(values, table)
    @@db.execute "insert into #{table} values ( ?, ? )", values
  end

  def self.retrive(table_name, name)
    @@db.execute("select #{name} from #{table_name}")
  end

  def self.me
    p self
  end

  private

  def self.table_name
    self.to_s.downcase.pluralize
  end
end



# sql = 'title varchar(30), content varchar(30)'
# Database.create_table(sql)
# Database.insert(['title', 'content'], 'posts')
# p Database.retrive('posts', '*')
