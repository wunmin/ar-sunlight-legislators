require_relative "../app.rb"

class SunlightLegislatorsImporter
  def self.import
    count = 0
    CSV.foreach("db/data/legislators.csv", headers: true) do |r|
    # csv = CSV.new(File.open("../db/data/legislators.csv"), :headers => true)
    # csv.each do |row|
    #   row.each do |field, value|
        # TODO: begin
        if r[0] == "Rep"
          title = "HouseRep"
        elsif r[0] == "Sen"
          title = "Senator"
        end

        date = r[27]
        split_date = date.split("/")
        year = split_date[2]
        month = split_date[0]
        day = split_date[1]

        r[9] == "1" ? active = true : active = false

        month.length == 1 ? month = "0" + month : month
        p = PoliticianInfo.create(
          name: "#{r[1]} #{r[2]} #{r[3]}",
          birthdate: Date.parse(year+month+day),
          phone: r[11].gsub("-", ""),
          fax: r[12].gsub("-", ""),
          website: r[13],
          webform: r[14],
          gender: r[10],
          twitter_id: r[21],
          type: title,
          party: r[6],
          state: r[7],
          active: active)
        # raise NotImplementedError, "Validations not passed. File not imported."
        # TODO: end
        count += 1
        p count if count % 100 == 0
    end
  end
end

SunlightLegislatorsImporter.import

# IF YOU WANT TO HAVE THIS FILE RUN ON ITS OWN AND NOT BE IN THE RAKEFILE, UNCOMMENT THE BELOW
# AND RUN THIS FILE FROM THE COMMAND LINE WITH THE PROPER ARGUMENT.
# begin
#   raise ArgumentError, "you must supply a filename argument" unless ARGV.length == 1
#   SunlightLegislatorsImporter.import(ARGV[0])
# rescue ArgumentError => e
#   $stderr.puts "Usage: ruby sunlight_legislators_importer.rb <filename>"
# rescue NotImplementedError => e
#   $stderr.puts "You shouldn't be running this until you've modified it with your implementation!"
# end
