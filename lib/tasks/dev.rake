namespace :dev do
  # 請先執行 rails dev:fake_user，可以產生 20 個資料完整的 User 紀錄
  # 其他測試用的假資料請依需要自行撰寫
  task user_id_my: :environment do

    Item.all.each do |item|
      item.user_id = 1
      item.save
    end

    puts "success"

  end

end
