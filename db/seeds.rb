require 'csv'
10.times do |v|
  csv_string = CSV.generate do |csv|
    csv << ["email", "name"]
    50000.times do |i|
      csv << ["example_#{i}@mail.ru", "Name_#{i}"]
    end
  end

  File.open("public/users_#{v}.csv", "w+") do |f|
    f.write(csv_string)
  end

  query = <<-SQL
    COPY users(email, name)
    FROM '#{Rails.root.join("public/users_#{v}.csv")}'
    WITH DELIMITER ','
    CSV HEADER
  SQL
  User.connection.execute(query)

  File.delete("public/users_#{v}.csv") if File.exist?("public/users_#{v}.csv")
end
