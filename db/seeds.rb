# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
c = Car.new :title => 'audi', :wiki => 'немецкая автомобилестроительная компания в составе концерна Volkswagen Group, специализирующаяся на выпуске автомобилей под маркой Audi. Штаб-квартира — в Ингольштадте (Германия). Председатель совета директоров — Мартин Винтеркорн (Martin Winterkorn).' 

unless c.save
  puts c.errors.to_s
end
puts "audi added"

Car.create! :title => 'BMW2', :wiki => '(аббревиатура от Bayerische Motoren Werke AG, рус. Баварские моторные заводы) — немецкий производитель автомобилей, мотоциклов, двигателей, а также велосипедов. Председателем компании на сегодняшний день является Норберт Райтхофер, а главным дизайнером — Адриан ван Хойдонк. Девиз компании на английском языке — «The Ultimate Driving Machine» и «Sheer Driving Pleasure».'

puts "bmw added"
Car.create! :title => 'Porsche', :wiki => 'Акционерное общество почётного доктора инженерных наук Фердинанда Порше) — германский автомобилестроительный концерн, основанный известным конструктором Фердинандом Порше в 1931 году. Штаб-квартира и мануфактура находится в Штутгарте, Германия. Основным акционером компании является род Порше. Porsche является самой высокодоходной автомобильной компанией в мире (в пересчете на прибыль от каждой проданной машины). В 2010 году автомобили Porsche были признаны самыми надёжными в мире.[2] Традиционный цвет автомобилей Porsche — серебряный.'

puts "porsche added"
Car.create! :title => 'Ford', :wiki => 'североамериканская автомобилестроительная компания, производитель автомобилей под марками «Ford», «Lincoln» и Mercury.
Четвёртый в мире производитель автомобилей по объёму выпуска за весь период существования; в настоящее время — третий на рынке США после GM и Toyota, и второй в Европе после Volkswagen.
Занимает 7 место в списке крупнейших публичных компаний США Fortune 1000 по состоянию на 2009 год[1] и 19 место в списке крупнейших мировых корпораций Fortune Global 500 2009 года[2] (2009 год).
Штаб-квартира компании располагается в городе Дирборн (пригород Детройта, штат Мичиган), а её европейского филиала — в Кёльне, ФРГ.'

puts "ford added"
Car.create! :title => 'Ferrari', :wiki => 'итальянская компания, выпускающая спортивные автомобили, базирующаяся в Маранелло. Основана в 1928 году Энцо Феррари как Scuderia Ferrari, компания спонсировала гонщиков и производила гоночные машины до 1947 года. С 1947 года начала выпуск «уличных» (англ. street-legal) спортивных автомобилей под маркой «Ferrari S.p.A.». На протяжении всей своей истории, компания участвует в различных гонках, особенно в Формуле-1, где она имеет наибольший успех. Эмблема «Феррари» — гарцующий жеребец на жёлтом фоне. Традиционный цвет автомобилей — красный.'

puts "ferrair` added"

#   Mayor.create(:name => 'Daley', :city => cities.first)
