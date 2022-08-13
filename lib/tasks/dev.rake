desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment}) do



  user = User.new
  user.email = "kirbygriffin@example.com"
  user.password = "test"
  user.username = "kirby griffin"
  user.save

  if user.errors.any?
    p user.errors.full_messages
  end

  p "#{User.count} users are in the database."
end
