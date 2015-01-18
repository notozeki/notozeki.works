require 'rake/clean'

SRC = "build/" # trailing slash is important!
DST = "front.notozeki.org:/var/www/notozeki.works"

CLOBBER.include("build/")

namespace :middleman do
  desc "build middleman project"
  task :build do
    bundle_exec "middleman build"
  end
end

desc "deploy to server"
task :deploy => "middleman:build" do
  sh "rsync -rtv --delete #{SRC} #{DST}"
end

def bundle_exec(cmd)
  sh "bundle exec #{cmd}"
end
