require 'sqlite3'
require 'active_support/inflector'

class Database
  @@db = SQLite3::Database.new("app.db")
  @@all_fields = []

  def self.field(name)
    @@all_fields << name
    attr_accessor(name)
  end

  def initialize
    @fields = @@all_fields
  end

  def self.create_table(sql_schema)
    @@db.execute <<-SQL
      create table #{table_name} (
        #{sql_schema}
      );
    SQL
  end

  def self.insert(values)
    @@db.execute "insert into #{table_name} values ( ?, ? )", values
  end

  def self.retrive(values)
    @@db.execute("select #{values} from #{table_name}")
  end

  def self.all
    db_values = self.retrive("*")
    db_values.map do |row|
      self.new_from_db(row)
    end
  end

  private

  def self.table_name
    self.to_s.downcase.pluralize
  end
end



# sql = 'title varchar(30), content varchar(30)'
# Database.create_table(sql)
# Database.insert(['title', 'content'])
# p Database.retrive('*')
