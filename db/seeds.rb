# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# To generate a full set of fake data for development and testing, use "rake db:populate" defined
# in lib/tasks/populate.rake

# Seed models from yml files in the seeds folder
Dir[Rails.root.join('db', 'seeds', '*.yml')].each do |file|
  model_name = File.basename(file, ".yml").classify
  mclass = model_name.constantize
  table_name = model_name.tableize
  file = Rails.root.join('db','seeds',"#{table_name}.yml")
  puts "Seeding #{table_name} from #{file}..."
  records = YAML.load( File.read( file ) )
  records.each_value do |record|
    # don't overwrite existing records; test by id
    existing_record = mclass.find_by(id: record['id'])
    unless existing_record
      object = mclass.new
      object.assign_attributes record
      object.id = record['id'] # force it to certain id
      object.save!
      puts "#{mclass.name} #{record['id']}: created"
    end
  end
end
