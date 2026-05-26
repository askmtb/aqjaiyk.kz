# Aqjaiyk — Claude Context

## Проект
Сайт-витрина для магазина и кафе **Aqjaiyk**.
- Клиенты выбирают товары/блюда и оплачивают через Kaspi Pay
- Администратор управляет меню и товарами через защищённую панель

## Стек
- React 18 + TypeScript + Vite
- Tailwind CSS v4 (`@tailwindcss/vite`)
- shadcn/ui + Radix UI
- TanStack React Query
- React Router v7
- Supabase (PostgreSQL + Auth + Storage)
- vite-plugin-pwa (PWA, Workbox) — mobile-first

## Деплой
- **Хостинг:** Plesk (статика)
- `npm run build` → загрузить `dist/` на хостинг через FTP
- Нужен `.htaccess` для SPA-роутинга
- HTTPS обязателен (нужен для PWA)

## Роутинг
- `/` — публичная витрина
- `/admin` — панель администратора (Supabase Auth)

## Оплата
- Kaspi Pay: `https://pay.kaspi.kz/pay/{VITE_KASPI_SHOP_ID}?amount={сумма}`
- shopId берётся из `import.meta.env.VITE_KASPI_SHOP_ID`

## Git
- Коммиты на английском: `feat:`, `fix:`, `chore:` и т.д.
- Не добавлять `Co-Authored-By: Claude` в коммиты

## Переменные окружения
Копировать `.env.example` → `.env.local`:
- `VITE_SUPABASE_URL`
- `VITE_SUPABASE_ANON_KEY`
- `VITE_KASPI_SHOP_ID`

## Статус
- [ ] Фаза 0 — фундамент (в процессе)
- [ ] Фаза 1 — база данных (ждём Supabase ref)
- [ ] Фаза 2 — витрина
- [ ] Фаза 3 — админка
- [ ] Фаза 4 — PWA
- [ ] Фаза 5 — брендинг (ждём логотип)
- [ ] Фаза 6 — деплой на Plesk
