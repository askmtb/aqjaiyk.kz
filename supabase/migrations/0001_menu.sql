-- 0001_menu.sql
-- Схема меню для Aq Jaiyk.
-- Применять через Supabase CLI: supabase migration up
-- Или вручную: скопировать в SQL Editor проекта в Supabase.

-- ============================================================
-- Таблицы
-- ============================================================

create table if not exists public.menu_categories (
  id          uuid primary key default gen_random_uuid(),
  slug        text not null unique,
  name        text not null,
  subtitle    text,
  sort_order  int  not null default 0,
  created_at  timestamptz not null default now(),
  updated_at  timestamptz not null default now()
);

create table if not exists public.menu_items (
  id           uuid primary key default gen_random_uuid(),
  category_id  uuid not null references public.menu_categories(id) on delete cascade,
  slug         text not null,
  name         text not null,
  description  text,
  portion      text,
  price        int  not null default 0,
  preorder     boolean not null default false,
  available    boolean not null default true,
  image_url    text,
  sort_order   int  not null default 0,
  created_at   timestamptz not null default now(),
  updated_at   timestamptz not null default now(),
  unique (category_id, slug)
);

create index if not exists menu_items_category_id_idx
  on public.menu_items (category_id);
create index if not exists menu_items_sort_order_idx
  on public.menu_items (sort_order);
create index if not exists menu_categories_sort_order_idx
  on public.menu_categories (sort_order);

-- ============================================================
-- Триггер updated_at
-- ============================================================

create or replace function public.set_updated_at()
returns trigger language plpgsql as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

drop trigger if exists menu_categories_updated_at on public.menu_categories;
create trigger menu_categories_updated_at
  before update on public.menu_categories
  for each row execute function public.set_updated_at();

drop trigger if exists menu_items_updated_at on public.menu_items;
create trigger menu_items_updated_at
  before update on public.menu_items
  for each row execute function public.set_updated_at();

-- ============================================================
-- Row Level Security
-- ============================================================

alter table public.menu_categories enable row level security;
alter table public.menu_items      enable row level security;

-- Гости (anon) и авторизованные могут читать меню
drop policy if exists "menu_categories_read" on public.menu_categories;
create policy "menu_categories_read"
  on public.menu_categories
  for select
  using (true);

drop policy if exists "menu_items_read" on public.menu_items;
create policy "menu_items_read"
  on public.menu_items
  for select
  using (available = true);

-- Запись — только авторизованным (админам).
-- TODO: после введения админ-роли заменить на (auth.jwt() ->> 'role' = 'admin')
drop policy if exists "menu_categories_write" on public.menu_categories;
create policy "menu_categories_write"
  on public.menu_categories
  for all
  to authenticated
  using (true)
  with check (true);

drop policy if exists "menu_items_write" on public.menu_items;
create policy "menu_items_write"
  on public.menu_items
  for all
  to authenticated
  using (true)
  with check (true);

-- ============================================================
-- Штрафы (порча мебели, бой посуды) — внутренние, не для гостей
-- ============================================================

create table if not exists public.fine_categories (
  id          uuid primary key default gen_random_uuid(),
  slug        text not null unique,
  name        text not null,
  sort_order  int  not null default 0
);

create table if not exists public.fines (
  id           uuid primary key default gen_random_uuid(),
  category_id  uuid not null references public.fine_categories(id) on delete cascade,
  slug         text not null,
  name         text not null,
  price        int  not null,
  unique (category_id, slug)
);

alter table public.fine_categories enable row level security;
alter table public.fines           enable row level security;

-- Видны и редактируемы только авторизованным
drop policy if exists "fine_categories_admin" on public.fine_categories;
create policy "fine_categories_admin"
  on public.fine_categories
  for all
  to authenticated
  using (true)
  with check (true);

drop policy if exists "fines_admin" on public.fines;
create policy "fines_admin"
  on public.fines
  for all
  to authenticated
  using (true)
  with check (true);
