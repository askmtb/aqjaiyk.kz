-- 0002_menu_seed.sql
-- Auto-generated from src/data/menu.json
-- Идемпотентный: можно прогонять много раз — обновит существующее.

begin;

-- ============================================================
-- Категории меню
-- ============================================================

insert into public.menu_categories (slug, name, subtitle, sort_order) values
  ('breakfast', 'Завтраки', null, 0)
on conflict (slug) do update set name = excluded.name, subtitle = excluded.subtitle, sort_order = excluded.sort_order;

insert into public.menu_categories (slug, name, subtitle, sort_order) values
  ('soups', 'Первые блюда', null, 1)
on conflict (slug) do update set name = excluded.name, subtitle = excluded.subtitle, sort_order = excluded.sort_order;

insert into public.menu_categories (slug, name, subtitle, sort_order) values
  ('mains', 'Вторые блюда', null, 2)
on conflict (slug) do update set name = excluded.name, subtitle = excluded.subtitle, sort_order = excluded.sort_order;

insert into public.menu_categories (slug, name, subtitle, sort_order) values
  ('salads', 'Салаты', null, 3)
on conflict (slug) do update set name = excluded.name, subtitle = excluded.subtitle, sort_order = excluded.sort_order;

insert into public.menu_categories (slug, name, subtitle, sort_order) values
  ('shashlyk', 'Шашлык', null, 4)
on conflict (slug) do update set name = excluded.name, subtitle = excluded.subtitle, sort_order = excluded.sort_order;

insert into public.menu_categories (slug, name, subtitle, sort_order) values
  ('cold-appetizers', 'Холодные закуски', null, 5)
on conflict (slug) do update set name = excluded.name, subtitle = excluded.subtitle, sort_order = excluded.sort_order;

insert into public.menu_categories (slug, name, subtitle, sort_order) values
  ('hot-appetizers', 'Горячие закуски', null, 6)
on conflict (slug) do update set name = excluded.name, subtitle = excluded.subtitle, sort_order = excluded.sort_order;

insert into public.menu_categories (slug, name, subtitle, sort_order) values
  ('pasta', 'Паста', null, 7)
on conflict (slug) do update set name = excluded.name, subtitle = excluded.subtitle, sort_order = excluded.sort_order;

insert into public.menu_categories (slug, name, subtitle, sort_order) values
  ('sides', 'Гарниры', null, 8)
on conflict (slug) do update set name = excluded.name, subtitle = excluded.subtitle, sort_order = excluded.sort_order;

insert into public.menu_categories (slug, name, subtitle, sort_order) values
  ('sauces', 'Соусы', null, 9)
on conflict (slug) do update set name = excluded.name, subtitle = excluded.subtitle, sort_order = excluded.sort_order;

insert into public.menu_categories (slug, name, subtitle, sort_order) values
  ('pizza', 'Пицца', null, 10)
on conflict (slug) do update set name = excluded.name, subtitle = excluded.subtitle, sort_order = excluded.sort_order;

insert into public.menu_categories (slug, name, subtitle, sort_order) values
  ('doners', 'Донеры', null, 11)
on conflict (slug) do update set name = excluded.name, subtitle = excluded.subtitle, sort_order = excluded.sort_order;

insert into public.menu_categories (slug, name, subtitle, sort_order) values
  ('group-dishes', 'Блюда на компанию', '10–12 человек', 12)
on conflict (slug) do update set name = excluded.name, subtitle = excluded.subtitle, sort_order = excluded.sort_order;

insert into public.menu_categories (slug, name, subtitle, sort_order) values
  ('group-sets', 'Сеты на компанию', null, 13)
on conflict (slug) do update set name = excluded.name, subtitle = excluded.subtitle, sort_order = excluded.sort_order;

-- ============================================================
-- Позиции меню
-- ============================================================

-- Завтраки
insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'blini', 'Блины', null, '2 шт', 450, false, 0
  from public.menu_categories where slug = 'breakfast'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'syrniki', 'Сырники', null, '2 шт', 800, false, 1
  from public.menu_categories where slug = 'breakfast'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'classic-breakfast', 'Завтрак классический', 'глазунья, сосиски, обжаренный хлеб', null, 1000, false, 2
  from public.menu_categories where slug = 'breakfast'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'mini-cheburek', 'Мини-чебуреки', null, '6 шт', 800, false, 3
  from public.menu_categories where slug = 'breakfast'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'mini-samsa', 'Мини-самса', null, '6 шт', 900, false, 4
  from public.menu_categories where slug = 'breakfast'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'omlet', 'Омлет', 'яйцо, молоко, зелень', null, 600, false, 5
  from public.menu_categories where slug = 'breakfast'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'bread-basket', 'Хлебная корзина', null, null, 800, false, 6
  from public.menu_categories where slug = 'breakfast'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'bread-white', 'Хлеб белый', null, null, 20, false, 7
  from public.menu_categories where slug = 'breakfast'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'bread-black', 'Хлеб чёрный', null, null, 30, false, 8
  from public.menu_categories where slug = 'breakfast'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'lepeshka', 'Лепёшка', null, null, 350, false, 9
  from public.menu_categories where slug = 'breakfast'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'bauyrsaki', 'Бауырсаки', null, '0,5 кг', 600, true, 10
  from public.menu_categories where slug = 'breakfast'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

-- Первые блюда
insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'mushroom-puree', 'Грибной суп-пюре', null, null, 1200, false, 0
  from public.menu_categories where slug = 'soups'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'lentil-soup', 'Чечевичный суп', null, null, 1200, false, 1
  from public.menu_categories where slug = 'soups'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'shurpa', 'Шурпа', 'баранина, морковь, картофель, болгарский перец, лук, зелень', null, 1500, false, 2
  from public.menu_categories where slug = 'soups'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'borsch', 'Борщ', null, null, 1200, false, 3
  from public.menu_categories where slug = 'soups'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'tom-yam', 'Том-ям', 'сёмга, креветки, шампиньоны, чеснок, имбирь, лимон, перец чили, рис', null, 2500, false, 4
  from public.menu_categories where slug = 'soups'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'pelmeni', 'Пельмени с бульоном', null, null, 1000, false, 5
  from public.menu_categories where slug = 'soups'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'chicken-noodle', 'Куриный суп-лапша', null, null, 1200, false, 6
  from public.menu_categories where slug = 'soups'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'solyanka', 'Солянка', null, null, 1500, false, 7
  from public.menu_categories where slug = 'soups'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

-- Вторые блюда
insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'guyru-lagman', 'Гуйру лагман', 'говядина, болгарский перец, пекинская капуста, лук, чеснок, морковь, лапша', null, 2200, false, 0
  from public.menu_categories where slug = 'mains'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'tsomyan-lagman', 'Цомян лагман', 'говядина, болгарский перец, пекинская капуста, чеснок, лук, морковь, лапша обжаренные в томате или на сое', null, 2500, false, 1
  from public.menu_categories where slug = 'mains'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'manty', 'Манты', 'фарш из говядины, лук, перец, соль', null, 1500, false, 2
  from public.menu_categories where slug = 'mains'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'manty-potato', 'Манты с картофелем', 'фарш из говядины, картофель, лук, перец, соль', null, 1200, true, 3
  from public.menu_categories where slug = 'mains'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'thai-meat', 'Мясо по-тайски', null, null, 2500, false, 4
  from public.menu_categories where slug = 'mains'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'kotlety', 'Котлеты', 'гарнир на выбор', null, 600, false, 5
  from public.menu_categories where slug = 'mains'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'plov', 'Плов', null, null, 1200, false, 6
  from public.menu_categories where slug = 'mains'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'lamb-ribs', 'Бараньи рёбра', null, null, 2300, false, 7
  from public.menu_categories where slug = 'mains'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'djigyar', 'Джигяр', 'жаренная печень, курдюк, овощи', null, 2200, false, 8
  from public.menu_categories where slug = 'mains'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'pike-fillet', 'Филе судака с овощами', null, null, 2300, true, 9
  from public.menu_categories where slug = 'mains'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'chicken-mushroom-cream', 'Курица с грибами в сливочном соусе', null, null, 2500, false, 10
  from public.menu_categories where slug = 'mains'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'kuyrdak', 'Куырдак из баранины', null, null, 1500, false, 11
  from public.menu_categories where slug = 'mains'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'potato-mushrooms', 'Картошка с грибами', null, null, 1800, false, 12
  from public.menu_categories where slug = 'mains'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'tripe-veggies', 'Требуха с овощами', null, null, 1200, false, 13
  from public.menu_categories where slug = 'mains'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

-- Салаты
insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'greek', 'Греческий', 'огурцы, помидоры, болгарский перец, лук, фирменный соус, сыр фета', null, 1800, false, 0
  from public.menu_categories where slug = 'salads'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'achuchuk', 'Ачучук', 'помидоры, лук, острый перец', null, 1200, false, 1
  from public.menu_categories where slug = 'salads'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'thai-salad', 'Тайский', 'огурцы, помидоры, болгарский перец, говядина, соя, зелень', null, 2000, false, 2
  from public.menu_categories where slug = 'salads'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'tbilisi', 'Тбилиси', 'говядина, консервированная фасоль, грецкие орехи, болгарский перец, чеснок, лук', null, 2500, false, 3
  from public.menu_categories where slug = 'salads'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'nezhnost', 'Нежность', 'говяжий язык, кукуруза, огурцы, яйца, картофель пай', null, 2000, false, 4
  from public.menu_categories where slug = 'salads'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'fresh', 'Свежий', 'огурец, помидоры, редис, лук, зелень', null, 1000, false, 5
  from public.menu_categories where slug = 'salads'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'shuba', 'Под шубой', 'картофель, морковь, свёкла, сельдь, лук, яйца', null, 1500, false, 6
  from public.menu_categories where slug = 'salads'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'olivier', 'Оливье', 'картофель, морковь, солёные огурцы, горох, колбаса, яйца', null, 1500, false, 7
  from public.menu_categories where slug = 'salads'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'carrot', 'Морковный', 'морковь, лук, зелень', null, 900, false, 8
  from public.menu_categories where slug = 'salads'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'bavarian', 'Баварский', 'картофель, яйцо, маринованные огурцы, опята, шампиньоны, лук', null, 2500, false, 9
  from public.menu_categories where slug = 'salads'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'grouse-nest', 'Гнездо глухаря', 'филе курицы, копчёный огурец, яйцо, перепелиные яйца, пай', null, 2500, false, 10
  from public.menu_categories where slug = 'salads'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'caesar-classic', 'Цезарь классический', 'капуста, фирменный соус, филе курицы, перепелиные яйца, сухари', null, 2500, false, 11
  from public.menu_categories where slug = 'salads'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'caesar-shrimp', 'Цезарь с креветками', 'капуста, фирменный соус, креветки, перепелиные яйца, сухари', null, 2800, false, 12
  from public.menu_categories where slug = 'salads'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'malibu', 'Малибу', 'филе курицы, огурцы, помидоры, сыр, сухарики', null, 2000, false, 13
  from public.menu_categories where slug = 'salads'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'vinegret', 'Винегрет', 'картофель, квашеная капуста, лук, морковь, горох, свёкла', null, 1500, false, 14
  from public.menu_categories where slug = 'salads'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

-- Шашлык
insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'shashlyk-lamb', 'Баранина', null, null, 2000, false, 0
  from public.menu_categories where slug = 'shashlyk'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'shashlyk-chicken', 'Курица', null, null, 1500, false, 1
  from public.menu_categories where slug = 'shashlyk'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'shashlyk-duck', 'Филе утки', null, null, 1500, false, 2
  from public.menu_categories where slug = 'shashlyk'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'steak-tbone', 'Стейк T-bone', null, null, 2500, false, 3
  from public.menu_categories where slug = 'shashlyk'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'steak-salmon', 'Стейк сёмги', null, null, 4500, false, 4
  from public.menu_categories where slug = 'shashlyk'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

-- Холодные закуски
insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'caucasian-cuts', 'Кавказская нарезка', 'огурцы, помидоры, болгарский перец, зелень, брынза', null, 2500, false, 0
  from public.menu_categories where slug = 'cold-appetizers'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'russian-appetizer', 'Закуска по-русски', 'сельдь, квашеная капуста, маринованные огурцы, грибы, лук, картофель', null, 2500, false, 1
  from public.menu_categories where slug = 'cold-appetizers'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'kazakh-delicacies', 'Казахские деликатесы', 'қазы, шұжық, кесек ет', null, 5500, false, 2
  from public.menu_categories where slug = 'cold-appetizers'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'fish-plate', 'Рыбное плато', null, null, 5500, false, 3
  from public.menu_categories where slug = 'cold-appetizers'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

-- Горячие закуски
insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'chicken-nuggets', 'Куриные нагетсы', null, '6 шт', 650, false, 0
  from public.menu_categories where slug = 'hot-appetizers'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'cheese-sticks', 'Сырные палочки', null, '6 шт', 1200, false, 1
  from public.menu_categories where slug = 'hot-appetizers'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'crispy-wings', 'Хрустящие крылышки', null, null, 1800, false, 2
  from public.menu_categories where slug = 'hot-appetizers'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'garlic-toasts', 'Чесночные гренки', null, null, 800, false, 3
  from public.menu_categories where slug = 'hot-appetizers'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'sausage-beef', 'Колбаски говяжьи', null, '5 шт', 3500, false, 4
  from public.menu_categories where slug = 'hot-appetizers'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'sausage-lamb', 'Колбаски бараньи', null, '5 шт', 3500, false, 5
  from public.menu_categories where slug = 'hot-appetizers'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'sausage-chicken', 'Колбаски куриные', null, '5 шт', 3000, false, 6
  from public.menu_categories where slug = 'hot-appetizers'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'onion-rings', 'Луковые кольца', null, null, 900, false, 7
  from public.menu_categories where slug = 'hot-appetizers'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'eggplant-rolls', 'Баклажановые роллы', null, '8 шт', 1500, true, 8
  from public.menu_categories where slug = 'hot-appetizers'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'zucchini-rolls', 'Кабачковые роллы', null, '8 шт', 1500, true, 9
  from public.menu_categories where slug = 'hot-appetizers'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'spring-rolls', 'Спринг-роллы с курицей', null, null, 2500, true, 10
  from public.menu_categories where slug = 'hot-appetizers'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'beer-shrimp', 'Креветки к пиву', null, null, 2500, false, 11
  from public.menu_categories where slug = 'hot-appetizers'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'aq-jaiyk-special', 'Фирменная закуска «АҚ ЖАЙЫҚ»', 'фарш из брынзы и шпината в тесте, жаренный во фритюре', null, 2500, true, 12
  from public.menu_categories where slug = 'hot-appetizers'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

-- Паста
insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'alfredo', 'Альфредо', 'паста феттучини, куриное филе, чеснок, сливки, тёртый сыр пармезан, петрушка', null, 2500, false, 0
  from public.menu_categories where slug = 'pasta'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'bolognese', 'Болоньезе', 'говяжий фарш, томат, специи, паста на выбор: феттучини, спагетти, сыр пармезан', null, 2500, false, 1
  from public.menu_categories where slug = 'pasta'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'pasta-shrimp', 'Паста с креветками в сливочно-чесночном соусе', null, null, 3000, false, 2
  from public.menu_categories where slug = 'pasta'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'tom-yam-pasta', 'Том-ям паста', 'шампиньоны, креветки, паста Том-ям, спагетти', null, 3000, false, 3
  from public.menu_categories where slug = 'pasta'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

-- Гарниры
insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'rice', 'Рис', null, null, 500, false, 0
  from public.menu_categories where slug = 'sides'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'baked-potato', 'Картофель запечённый', null, null, 600, false, 1
  from public.menu_categories where slug = 'sides'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'fries', 'Фри', null, null, 600, false, 2
  from public.menu_categories where slug = 'sides'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'grilled-veggies', 'Овощи гриль', null, null, 1000, false, 3
  from public.menu_categories where slug = 'sides'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

-- Соусы
insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'mayo', 'Майонез', null, null, 0, false, 0
  from public.menu_categories where slug = 'sauces'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'ketchup', 'Кетчуп', null, null, 0, false, 1
  from public.menu_categories where slug = 'sauces'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'sour-cream', 'Сметана', null, null, 0, false, 2
  from public.menu_categories where slug = 'sauces'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

-- Пицца
insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'pepperoni', 'Пепперони', 'моцарелла, колбаса', null, 2500, false, 0
  from public.menu_categories where slug = 'pizza'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'margarita', 'Маргарита', 'моцарелла, помидоры', null, 1800, false, 1
  from public.menu_categories where slug = 'pizza'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'pollo-funghi', 'Pollo e funghi', 'курица с грибами, моцарелла', null, 3200, false, 2
  from public.menu_categories where slug = 'pizza'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'mexicano', 'Mexicano', 'моцарелла, курица, помидоры, кукуруза, маслины, халапеньо', null, 3200, false, 3
  from public.menu_categories where slug = 'pizza'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'pizza-meat', 'Мясная', 'моцарелла, говядина, копчёная колбаса, курица, помидоры, маслины', null, 3200, false, 4
  from public.menu_categories where slug = 'pizza'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'four-seasons', '4 сезона', 'моцарелла, колбаса, грибы, курица, помидоры', null, 3000, false, 5
  from public.menu_categories where slug = 'pizza'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'cheese-salmon', 'Сырный лосось', 'моцарелла, лосось, маслины, творожный сыр', null, 3500, false, 6
  from public.menu_categories where slug = 'pizza'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'pizza-bolognese', 'Болоньезе', 'моцарелла, помидоры, фарш', null, 3200, false, 7
  from public.menu_categories where slug = 'pizza'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'hunter', 'Охотничья', 'моцарелла, охотничьи колбаски', null, 3000, false, 8
  from public.menu_categories where slug = 'pizza'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'cheese-pizza', 'Сырная', 'моцарелла', null, 2500, false, 9
  from public.menu_categories where slug = 'pizza'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'bon-dior', 'Bon dior', 'моцарелла, колбаса, брокколи', null, 3000, false, 10
  from public.menu_categories where slug = 'pizza'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

-- Донеры
insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'max-classic', 'Max классика', null, null, 1500, false, 0
  from public.menu_categories where slug = 'doners'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'max-cheese', 'Max сырный', null, null, 1650, false, 1
  from public.menu_categories where slug = 'doners'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'max-spicy', 'Max острый', null, null, 1550, false, 2
  from public.menu_categories where slug = 'doners'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'max-garlic', 'Max чесночный', null, null, 1500, false, 3
  from public.menu_categories where slug = 'doners'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'max-cheese-spicy', 'Max сырно-острый', null, null, 1700, false, 4
  from public.menu_categories where slug = 'doners'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'mini-classic', 'Mini классика', null, null, 1200, false, 5
  from public.menu_categories where slug = 'doners'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'mini-cheese', 'Mini сырный', null, null, 1450, false, 6
  from public.menu_categories where slug = 'doners'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'mini-spicy', 'Mini острый', null, null, 1300, false, 7
  from public.menu_categories where slug = 'doners'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'mini-garlic', 'Mini чесночный', null, null, 1200, false, 8
  from public.menu_categories where slug = 'doners'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'mini-cheese-spicy', 'Mini сырно-острый', null, null, 1500, false, 9
  from public.menu_categories where slug = 'doners'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

-- Блюда на компанию
insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'kazan-kebab', 'Казан-кебаб', 'обжаренный картофель, говядина, розочки из теста', null, 30000, false, 0
  from public.menu_categories where slug = 'group-dishes'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'group-manty', 'Манты', 'фарш из говядины, лук, специи', null, 12000, false, 1
  from public.menu_categories where slug = 'group-dishes'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'baked-salmon', 'Сёмга запечённая с овощами', 'гарнир на выбор', null, 40000, false, 2
  from public.menu_categories where slug = 'group-dishes'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'beef-ribs-dough', 'Томлёные говяжьи рёбра в тесте', 'говядина, слоёное тесто, картофель', null, 20000, false, 3
  from public.menu_categories where slug = 'group-dishes'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'chicken-galantine', 'Курица Галантин', 'тушка курицы, начинённая маринованным куриным бедром, гарнир на выбор', null, 15000, false, 4
  from public.menu_categories where slug = 'group-dishes'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'lamb-shoulder', 'Запечённая баранья лопатка', 'гарнир на выбор', null, 25000, false, 5
  from public.menu_categories where slug = 'group-dishes'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'skewers-15', 'Шашлычки на шпажках', 'говядина, курица, баранина-люля', '15 шт', 15000, false, 6
  from public.menu_categories where slug = 'group-dishes'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'balgyn-et', 'Балғын Ет', 'томлёная конина, картофель', null, 20000, false, 7
  from public.menu_categories where slug = 'group-dishes'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'tabaka', 'Цыплёнок Табака', 'цыплёнок зажарен 2 шт, гарнир на выбор', null, 12000, false, 8
  from public.menu_categories where slug = 'group-dishes'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

-- Сеты на компанию
insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'meat-set', 'Мясной сет', 'шашлык: баранина, говядина, курица', null, 13000, false, 0
  from public.menu_categories where slug = 'group-sets'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'beer-set', 'Пивной сет', 'креветки, жареный чечил, чипсы, чесночные гренки', null, 5500, false, 1
  from public.menu_categories where slug = 'group-sets'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

insert into public.menu_items (category_id, slug, name, description, portion, price, preorder, sort_order)
  select id, 'sausage-assorted', 'Ассорти из колбасок', 'говядина, баранина, курица', null, 11000, false, 2
  from public.menu_categories where slug = 'group-sets'
on conflict (category_id, slug) do update set name = excluded.name, description = excluded.description, portion = excluded.portion, price = excluded.price, preorder = excluded.preorder, sort_order = excluded.sort_order;

commit;