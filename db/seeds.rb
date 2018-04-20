Product.destroy_all
Review.destroy_all

50.times do |i|
  @name = Faker::Coffee.blend_name
  @origin = Faker::Coffee.origin
  @variety = Faker::Coffee.variety
  @notes = Faker::Coffee.notes
  @price = Faker::Number.decimal(2)
  @created_at = Faker::Date.between(2.months.ago, Date.today)
  Product.create!(name: @name, origin: @origin, variety: @variety, notes: @notes, price: @price, created_at: @created_at)
  @product_id = Product.last.id
  @review_numbers = Faker::Number.between(0, 5)
  if @review_numbers == 5
    12.times do |i|
      @author = Faker::RuPaul.queen
      @description = Faker::Hipster.sentence(8)
      @review_created_at = Faker::Date.between(1.week.ago, Date.today)
      @rating = Faker::Number.between(1, 5)
      Review.create!(product_id: @product_id, rating: @rating, description: @description, created_at: @review_created_at, author: @author)
    end
  elsif @review_numbers == 4
    9.times do |i|
      @author = Faker::RuPaul.queen
      @description = Faker::Hipster.sentence(8)
      @review_created_at = Faker::Date.between(1.week.ago, Date.today)
      @rating = Faker::Number.between(1, 5)
      Review.create!(product_id: @product_id, rating: @rating, description: @description, created_at: @review_created_at, author: @author)
    end
  elsif @review_numbers == 3
    7.times do |i|
      @author = Faker::RuPaul.queen
      @description = Faker::Hipster.sentence(8)
      @review_created_at = Faker::Date.between(1.week.ago, Date.today)
      @rating = Faker::Number.between(1, 5)
      Review.create!(product_id: @product_id, rating: @rating, description: @description, created_at: @review_created_at, author: @author)
    end
  elsif @review_numbers == 2
    5.times do |i|
      @author = Faker::RuPaul.queen
      @description = Faker::Hipster.sentence(8)
      @review_created_at = Faker::Date.between(1.week.ago, Date.today)
      @rating = Faker::Number.between(1, 5)
      Review.create!(product_id: @product_id, rating: @rating, description: @description, created_at: @review_created_at, author: @author)
    end
  elsif @review_numbers == 1
    2.times do |i|
      @author = Faker::RuPaul.queen
      @description = Faker::Hipster.sentence(8)
      @review_created_at = Faker::Date.between(1.week.ago, Date.today)
      @rating = Faker::Number.between(1, 5)
      Review.create!(product_id: @product_id, rating: @rating, description: @description, created_at: @review_created_at, author: @author)
    end
  end
end

p "Created #{Product.count} products"
p "Created #{Review.count} reviews"
