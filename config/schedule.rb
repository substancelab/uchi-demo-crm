# Use this file to easily define all of your cron jobs.

every 1.hour do
  rake "db:seed"
  runner "ActiveStorage::Blob.unattached.where(created_at: ..1.hour.ago).find_each(&:purge)"
end
