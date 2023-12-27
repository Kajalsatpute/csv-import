class CsvImportService
  require 'csv'

  def call(file)
    # opened_file = File.open(file)
    # options = { headers: true, col_sep: ';' }
    # CSV.foreach(opened_file, **options) do |row|
    #   # map the CSV columns to your database columns
    #   user_hash = {}
    #   user_hash[:name] = row['name']
    #   user_hash[:gender] = row['gender']
    #   # user_hash[:email] = row['Email Address']
    #   # user_hash[:username] = user_hash[:email].split('@').first
    #   # user_hash[:name] = row['First Name']
    #   # user_hash[:surname] = row['Last Name']
    #   # user_hash[:preferences] = row['Favorite Food']
    #   # user_hash[:phone] = row['Mobile phone number']

    #   User.find_or_create_by!(user_hash)
    #   # for performance, you could create a separate job to import each user
    #   # CsvImportJob.perform_later(user_hash)
    # end
    file = File.open(file)
    csv = CSV.parse(file, headers: true)
    user_hash = {}
    csv.each do |row|
      user_hash[:name] = row['Name']
      user_hash[:gender] = row['Gender']
      User.find_or_create_by(user_hash)
    end
  end
end
