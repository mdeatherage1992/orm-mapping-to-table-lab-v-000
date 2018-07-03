class Student
    attr_accessor :name, :grade

    def initialize(name, grade, id=nil)
      @id = id
      @name = name
      @grade = grade
    end

    def save
      sql = <<- SQL
        INSERT INTO Student (name, grade)
        VALUES (?, ?)
      SQL

      DB[:conn].execute(sql, self.name, self.grade)

      @id = DB[:conn].execute("SELECT last_insert_rowid() FROM songs")[0][0]

    end


end











  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]
