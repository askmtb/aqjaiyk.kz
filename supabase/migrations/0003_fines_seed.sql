-- 0003_fines_seed.sql
-- Auto-generated from src/data/fines.json

begin;

insert into public.fine_categories (slug, name, sort_order) values ('furniture-damage', 'Порча мебели и оборудования', 0) on conflict (slug) do update set name = excluded.name, sort_order = excluded.sort_order;

insert into public.fine_categories (slug, name, sort_order) values ('dishware-damage', 'Бой посуды', 1) on conflict (slug) do update set name = excluded.name, sort_order = excluded.sort_order;

-- Порча мебели и оборудования
insert into public.fines (category_id, slug, name, price)
  select id, 'chair', 'Стул', 30000
  from public.fine_categories where slug = 'furniture-damage'
on conflict (category_id, slug) do update set name = excluded.name, price = excluded.price;

insert into public.fines (category_id, slug, name, price)
  select id, 'mirror', 'Зеркало', 50000
  from public.fine_categories where slug = 'furniture-damage'
on conflict (category_id, slug) do update set name = excluded.name, price = excluded.price;

insert into public.fines (category_id, slug, name, price)
  select id, 'sofa', 'Диван', 250000
  from public.fine_categories where slug = 'furniture-damage'
on conflict (category_id, slug) do update set name = excluded.name, price = excluded.price;

insert into public.fines (category_id, slug, name, price)
  select id, 'table', 'Стол', 60000
  from public.fine_categories where slug = 'furniture-damage'
on conflict (category_id, slug) do update set name = excluded.name, price = excluded.price;

insert into public.fines (category_id, slug, name, price)
  select id, 'door', 'Дверь', 100000
  from public.fine_categories where slug = 'furniture-damage'
on conflict (category_id, slug) do update set name = excluded.name, price = excluded.price;

insert into public.fines (category_id, slug, name, price)
  select id, 'karaoke', 'Караоке-система', 650000
  from public.fine_categories where slug = 'furniture-damage'
on conflict (category_id, slug) do update set name = excluded.name, price = excluded.price;

insert into public.fines (category_id, slug, name, price)
  select id, 'tv', 'Телевизор', 450000
  from public.fine_categories where slug = 'furniture-damage'
on conflict (category_id, slug) do update set name = excluded.name, price = excluded.price;

insert into public.fines (category_id, slug, name, price)
  select id, 'microphone', 'Микрофон', 80000
  from public.fine_categories where slug = 'furniture-damage'
on conflict (category_id, slug) do update set name = excluded.name, price = excluded.price;

insert into public.fines (category_id, slug, name, price)
  select id, 'speakers', 'Колонки', 150000
  from public.fine_categories where slug = 'furniture-damage'
on conflict (category_id, slug) do update set name = excluded.name, price = excluded.price;

-- Бой посуды
insert into public.fines (category_id, slug, name, price)
  select id, 'plate', 'Тарелка', 1000
  from public.fine_categories where slug = 'dishware-damage'
on conflict (category_id, slug) do update set name = excluded.name, price = excluded.price;

insert into public.fines (category_id, slug, name, price)
  select id, 'banquet-plate', 'Банкетные тарелки', 2000
  from public.fine_categories where slug = 'dishware-damage'
on conflict (category_id, slug) do update set name = excluded.name, price = excluded.price;

insert into public.fines (category_id, slug, name, price)
  select id, 'glass', 'Стаканы', 1000
  from public.fine_categories where slug = 'dishware-damage'
on conflict (category_id, slug) do update set name = excluded.name, price = excluded.price;

insert into public.fines (category_id, slug, name, price)
  select id, 'wine-glass', 'Фужеры', 1500
  from public.fine_categories where slug = 'dishware-damage'
on conflict (category_id, slug) do update set name = excluded.name, price = excluded.price;

insert into public.fines (category_id, slug, name, price)
  select id, 'shot-glass', 'Рюмка', 1000
  from public.fine_categories where slug = 'dishware-damage'
on conflict (category_id, slug) do update set name = excluded.name, price = excluded.price;

insert into public.fines (category_id, slug, name, price)
  select id, 'teapot', 'Чайник', 5000
  from public.fine_categories where slug = 'dishware-damage'
on conflict (category_id, slug) do update set name = excluded.name, price = excluded.price;

insert into public.fines (category_id, slug, name, price)
  select id, 'kese', 'Кесе', 1000
  from public.fine_categories where slug = 'dishware-damage'
on conflict (category_id, slug) do update set name = excluded.name, price = excluded.price;

insert into public.fines (category_id, slug, name, price)
  select id, 'sauce-bowl', 'Соусницы', 1500
  from public.fine_categories where slug = 'dishware-damage'
on conflict (category_id, slug) do update set name = excluded.name, price = excluded.price;

insert into public.fines (category_id, slug, name, price)
  select id, 'ashtray', 'Пепельницы', 2000
  from public.fine_categories where slug = 'dishware-damage'
on conflict (category_id, slug) do update set name = excluded.name, price = excluded.price;

insert into public.fines (category_id, slug, name, price)
  select id, 'fruit-bowl', 'Фруктницы', 8000
  from public.fine_categories where slug = 'dishware-damage'
on conflict (category_id, slug) do update set name = excluded.name, price = excluded.price;

insert into public.fines (category_id, slug, name, price)
  select id, 'tabak', 'Табаки', 5000
  from public.fine_categories where slug = 'dishware-damage'
on conflict (category_id, slug) do update set name = excluded.name, price = excluded.price;

insert into public.fines (category_id, slug, name, price)
  select id, 'deep-bowl', 'Глубокие блюдца', 4500
  from public.fine_categories where slug = 'dishware-damage'
on conflict (category_id, slug) do update set name = excluded.name, price = excluded.price;

commit;