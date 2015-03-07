require 'rake/clean'

build_dir = "build"
s3_bucket = "notozeki.works"

CLOBBER.include("build/")

namespace :middleman do
  desc "build middleman project"
  task :build do
    bundle_exec "middleman build"
  end
end

desc "deploy to server"
task :deploy => "middleman:build" do
  sh "aws s3 sync #{build_dir} s3://#{s3_bucket}"
end

def bundle_exec(cmd)
  sh "bundle exec #{cmd}"
end
