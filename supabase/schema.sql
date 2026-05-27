-- ============================================================
-- Aqjaiyk — схема базы данных
-- Запустить в Supabase Dashboard → SQL Editor
-- ============================================================

-- ------------------------------------------------------------
-- 1. Категории (напитки, еда, товары и т.д.)
-- ------------------------------------------------------------
create table if not exists categories (
  id          uuid        primary key default gen_random_uuid(),
  name        text        not null,
  slug        text        not null unique,
  sort_order  int         not null default 0,
  created_at  timestamptz not null default now()
);

-- ------------------------------------------------------------
-- 2. Товары / блюда
-- ------------------------------------------------------------
create table if not exists products (
  id           uuid           primary key default gen_random_uuid(),
  category_id  uuid           not null references categories(id) on delete cascade,
  name         text           not null,
  description  text,
  price        numeric(10,2)  not null check (price >= 0),
  image_url    text,
  available    boolean        not null default true,
  sort_order   int            not null default 0,
  created_at   timestamptz    not null default now()
);

-- ------------------------------------------------------------
-- 3. Row Level Security
-- ------------------------------------------------------------
alter table categories enable row level security;
alter table products    enable row level security;

-- Категории: все читают
create policy "categories_select"
  on categories for select
  to anon, authenticated
  using (true);

-- Категории: только администратор меняет
create policy "categories_insert" on categories for insert to authenticated with check (true);
create policy "categories_update" on categories for update to authenticated using (true);
create policy "categories_delete" on categories for delete to authenticated using (true);

-- Товары: публика видит только доступные
create policy "products_select_public"
  on products for select
  to anon
  using (available = true);

-- Товары: администратор видит все
create policy "products_select_admin"
  on products for select
  to authenticated
  using (true);

-- Товары: только администратор меняет
create policy "products_insert" on products for insert to authenticated with check (true);
create policy "products_update" on products for update to authenticated using (true);
create policy "products_delete" on products for delete to authenticated using (true);

-- ------------------------------------------------------------
-- 4. Storage — bucket для фото товаров
-- ------------------------------------------------------------
insert into storage.buckets (id, name, public)
  values ('product-images', 'product-images', true)
  on conflict do nothing;

-- Все могут читать фото
create policy "product_images_public_read"
  on storage.objects for select
  to anon, authenticated
  using (bucket_id = 'product-images');

-- Только администратор загружает/удаляет
create policy "product_images_admin_write"
  on storage.objects for insert
  to authenticated
  with check (bucket_id = 'product-images');

create policy "product_images_admin_delete"
  on storage.objects for delete
  to authenticated
  using (bucket_id = 'product-images');

-- ------------------------------------------------------------
-- 5. Тестовые данные (можно удалить потом)
-- ------------------------------------------------------------
insert into categories (name, slug, sort_order) values
  ('Меню', 'menu', 1),
  ('Напитки', 'drinks', 2),
  ('Товары', 'goods', 3)
on conflict do nothing;
