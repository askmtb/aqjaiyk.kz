import { useQuery } from "@tanstack/react-query";
import menuData from "@/data/menu.json";
import type { Menu, MenuItem } from "@/types/menu";

/**
 * Загрузка меню.
 *
 * --- Сейчас (Phase 0–1) ---
 * Возвращает локальный JSON. Без сети.
 *
 * --- После Phase 1 (Supabase готов) ---
 * Заменить queryFn ниже на:
 *
 *   import { supabase } from "@/lib/supabase";
 *   queryFn: async (): Promise<Menu> => {
 *     const { data, error } = await supabase
 *       .from("menu_categories")
 *       .select("id, slug, name, subtitle, items:menu_items(id, slug, name, description, portion, price, preorder, sort_order)")
 *       .order("sort_order")
 *       .order("sort_order", { foreignTable: "menu_items" });
 *     if (error) throw error;
 *     return mapSupabaseToMenu(data);
 *   }
 *
 * Тип Menu не меняется → компоненты не трогаем.
 */
export function useMenu() {
  return useQuery({
    queryKey: ["menu"],
    queryFn: async (): Promise<Menu> => {
      // Имитация await — структура совместима с будущим Supabase-fetch
      return menuData as Menu;
    },
    staleTime: 1000 * 60 * 60, // 1 час: меню меняется редко
  });
}

/**
 * Найти позицию по slug в категории. Полезно для роутинга /menu/{cat}/{item}.
 */
export function findMenuItem(
  menu: Menu,
  categoryId: string,
  itemId: string,
): MenuItem | undefined {
  return menu.categories
    .find((c) => c.id === categoryId)
    ?.items.find((i) => i.id === itemId);
}
