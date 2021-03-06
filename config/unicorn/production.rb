app_dir = '/var/www/velican'

# Set unicorn options
worker_processes 1
preload_app true
timeout 30
pid "#{app_dir}/shared/pids/unicorn.pid"
listen "#{app_dir}/shared/pids/unicorn.sock", :backlog => 64

# Log everything to one file
stderr_path "#{app_dir}/shared/log/unicorn.log"
stdout_path "#{app_dir}/shared/log/unicorn.log"

before_fork do |server, worker|
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.connection.disconnect!
  end

  old_pid = "#{app_dir}/shared/pids/unicorn.pid.oldbin"
  if old_pid != server.pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end

after_fork do |server, worker|
  ActiveRecord::Base.establish_connection
end
