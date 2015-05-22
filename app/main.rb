require_relative "../app.rb"
require "byebug"

def select_all_by_state(state)
  senators = PoliticianInfo.all.select(:name, :party).where(state: state, type: "Senator")
  p "Senators:"
  senators.each do |i|
    puts "#{i.name} (#{i.party})"
  end

	house_reps = PoliticianInfo.all.select(:name, :party).where(state: state, type: "HouseRep")
  p "Representatives:"
  house_reps.each do |i|
    puts "#{i.name} (#{i.party})"
  end
end


def num_and_percentage(var)

	senators_total = PoliticianInfo.where(type: "Senator", active: true).count
	senators_gender = PoliticianInfo.where(gender: var, type: "Senator", active: true).count
	senators_percentage = (senators_gender * 100.0 /senators_total).floor

	house_reps_total = PoliticianInfo.where(type: "HouseRep", active: true).count
	house_reps_gender = PoliticianInfo.where(gender: var, type: "HouseRep", active: true).count
	house_reps_percentage = (house_reps_gender * 100.0 /house_reps_total).floor

	puts "#{var} Senators: #{senators_gender} (#{senators_percentage}%)"
	puts "#{var} Representatives: #{house_reps_gender} (#{house_reps_percentage}%)"
end


def active_by_state

  active_senators = PoliticianInfo.where(type: "Senator", active: true).group(:state).count
  active_house_reps = PoliticianInfo.where(type: "HouseRep", active: true).group(:state).count

  h1 = active_house_reps.merge(active_senators){|key, first, second| [second, first]}
  h2 = Hash[h1.sort_by{|k, v| v[1]}.reverse]
  h2.each do |key, v|
    puts "#{key}: #{v[0]} Senators, #{v[1]} Representative(s)"
  end
end

def count
	senator_count = PoliticianInfo.where(type: "Senator").count
  house_rep_count = PoliticianInfo.where(type: "HouseRep").count
  p "Senators: #{senator_count}"
  p "Representatives: #{house_rep_count}"
end

def delete_inactive
	count

	inactive_politicians_objects = PoliticianInfo.select(:id).where(active: false)
	ids = []
	inactive_politicians_objects.each do |i|
    ids << i.id
  end
  PoliticianInfo.destroy(ids)
  count

end

# select_all_by_state("TX")
# num_and_percentage("M")
# active_by_state
# count

delete_inactive