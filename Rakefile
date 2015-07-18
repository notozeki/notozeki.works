require 'rake/clean'

BUILD_DIR = 'build'
S3_BUCKET = 'notozeki.works'

CLOBBER.include('build/')

def bundle_exec(cmd)
  sh "bundle exec #{cmd}"
end

namespace :middleman do
  desc 'Build the Middleman project'
  task :build do
    bundle_exec 'middleman build'
  end
end

namespace :git do
  desc 'Create a tag for release'
  task :tag do
    t = Time.now
    readable = t.strftime('%Y-%m-%d %H:%M:%S')
    tag_name = t.strftime('v%Y%m%d%H%M%S')
    sh 'git', 'tag', '-m', "Released at #{readable}", tag_name
  end
end

namespace :s3 do
  desc 'Deploy to Amazon S3 server'
  task :sync do
    sh "aws s3 sync --delete #{BUILD_DIR} s3://#{S3_BUCKET}"
  end
end

desc 'Release new version'
task :release => [
  'middleman:build',
  'git:tag',
  's3:sync'
]
