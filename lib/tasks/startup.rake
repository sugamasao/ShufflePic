# encoding:utf-8

desc "アプリケーションをデプロイをする時に気をつけることリスト"
task :startup => :environment do
  puts "Twitterのconsumer keyなどを実際の値に変える必要がある"
  puts "ローカルの場合はexportで。herokuの場合は %heroku config:add KEY=value で登録してね。"
  puts "export SHUFFLE_PIC_CONSUMER_KEY=key"
  puts "export SHUFFLE_PIC_CONSUMER_SECRET=secret"
  puts "実際の値は https://dev.twitter.com/apps から探しな"
end

