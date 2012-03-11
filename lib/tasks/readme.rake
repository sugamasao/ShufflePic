# encoding:utf-8

desc "アプリケーションをデプロイをする時に気をつけることリスト"
task :readme => :environment do
  puts "Twitterのconsumer keyなどを実際の値に変える必要があるファイル"
  puts "実際の値は https://dev.twitter.com/apps から探しな"
  Dir.glob(Rails.root.to_s + "/**/*.rb").each do |list|
    unless File.readlines(list).grep(/('consumer_secret')|('consumer_key')/).empty?
      puts list
    end
  end
end
