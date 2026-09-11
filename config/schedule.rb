# Use this file to easily define all of your cron jobs.

every 1.hour do
  rake "db:seed"
  runner "ActiveStorage::Blob.unattached.find_each(&:purge)"
end
