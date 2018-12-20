@drinks = {cola:   {price: 120, stock: 5},
           calpis: {price: 150, stock: 1}
          }

def total_sale(money)
  File.open("money.txt", "a") do |f|
    f.puts "#{money}"
  end
end

def order(ordered,money)
  if @drinks.has_key?(ordered)
    puts "#{ordered}がでました"
    @drinks[ordered][:stock] -= 1
    puts "#{(money - @drinks[ordered][:price])}円のおつりです"
    total_sale(@drinks[ordered][:price])
  end
end

loop do
  puts "お金を入れてください"
  money = gets.to_i
  puts "欲しいドリンクを選択してください"
  ordered = gets.chomp.to_sym

  next puts "その商品はありません" unless @drinks[ordered]
  next puts "在庫がありません。" if @drinks[ordered][:stock] <= 0

  if money < @drinks[ordered][:price]
    puts "お金が足りません"
    next puts "#{money}円の返却です"
  end

  order(ordered,money)
end
