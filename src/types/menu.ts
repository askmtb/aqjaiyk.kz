/**
 * Типы данных меню Aq Jaiyk.
 *
 * Поддерживают два источника:
 * 1. Локальный JSON (`src/data/menu.json`) — текущий режим
 * 2. Supabase (`menu_categories` + `menu_items`) — после Phase 1
 *
 * Тип одинаковый — компоненты не нужно менять при переключении.
 */

export interface MenuItem {
  /** Slug, уникальный в пределах категории. Используется в URL/якорях. */
  id: string;
  /** Название блюда */
  name: string;
  /** Цена в тенге (целое число). 0 — цена не указана (например, соусы). */
  price: number;
  /** Размер порции: "6 шт", "0,5 кг". Опционально. */
  portion?: string;
  /** Состав / ингредиенты. Опционально. */
  description?: string;
  /** true — требуется предзаказ */
  preorder?: boolean;
}

export interface MenuCategory {
  id: string;
  name: string;
  /** Подзаголовок, например «10–12 человек» */
  subtitle?: string;
  items: MenuItem[];
}

export interface Menu {
  restaurant: string;
  currency: string;
  currencySymbol: string;
  serviceChargePercent: number;
  note: string;
  categories: MenuCategory[];
}

export interface Fines {
  currency: string;
  currencySymbol: string;
  note: string;
  categories: MenuCategory[];
}
