# config valid for current version and patch releases of Capistrano
lock "~> 3.10.0"

set :application, "instagram-scheduler"
set :repo_url, "git@bitbucket.org:jakubgarfield/instagram-scheduler.git"

set :deploy_to, '/home/deploy/instagram-scheduler'

append :linked_files, "config/database.yml", "config/secrets.yml"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system", "public/uploads"
