cron 'logrotate-fiveminutely' do
  minute "*/5"
  command "/etc/cron.daily/logrotate"
  user    'root'
end

logrotate_app 'elasticsearch' do
  cookbook  'logrotate'
  path      '/usr/local/var/log/elasticsearch/*.log'
  frequency 'daily'
  su        'root root'
  rotate    3
  maxsize   '250M'
  options   ['missingok', 'compress', 'delaycompress', 'notifempty', 'copytruncate']
end