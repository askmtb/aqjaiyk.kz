import { MenuItem } from "./MenuItem";
import type { MenuCategory, MenuItem as MenuItemType } from "@/types/menu";

interface Props {
  category: MenuCategory;
  currencySymbol: string;
  onAddItem?: (item: MenuItemType) => void;
}

/**
 * Секция одной категории. id используется для якорной навигации
 * из MenuCategoryNav (href="#category-{id}").
 */
export function MenuCategorySection({
  category,
  currencySymbol,
  onAddItem,
}: Props) {
  return (
    <section
      id={`category-${category.id}`}
      className="scroll-mt-24"
      aria-labelledby={`heading-${category.id}`}
    >
      <header className="mb-3">
        <h2
          id={`heading-${category.id}`}
          className="text-xl font-semibold tracking-tight text-zinc-900"
        >
          {category.name}
        </h2>
        {category.subtitle && (
          <p className="mt-0.5 text-sm text-zinc-500">{category.subtitle}</p>
        )}
      </header>
      <div>
        {category.items.map((item) => (
          <MenuItem
            key={item.id}
            item={item}
            currencySymbol={currencySymbol}
            onAdd={onAddItem}
          />
        ))}
      </div>
    </section>
  );
}
