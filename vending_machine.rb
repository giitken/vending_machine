@drinks = {cola: {price: 120, stock: 5},
          calpis: {price: 150, stock: 0}
         }

puts "お金を入れてください"
money = gets.to_i
puts "欲しいドリンクを選択してください"
get = gets.chomp.to_sym

return puts "その商品はありません" unless @drinks[get]

return puts "在庫がありません。" if @drinks[get][:stock] <= 0

if money < @drinks[get][:price]
  puts "お金が足りません"

  return puts "#{money}円の返却です"
end

def total_sale(money)
  File.open("money.txt", "w+") do |f|
    f.print money
  end
end

def order(get,money)
  if @drinks.has_key?(get)
    puts "#{get}がでました"
    @drinks[get][:stock] -= 1
    puts "#{(money - @drinks[get][:price])}円のおつりです"
    total_sale(@drinks[get][:price])
  else
    return order
  end
end
order(get,money)
# 在庫の確認
# 在庫がなかったらすぐリターン
