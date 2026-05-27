import { Plus } from "lucide-react";
import { formatPrice } from "@/lib/menu/format";
import { cn } from "@/lib/utils";
import type { MenuItem as MenuItemType } from "@/types/menu";

interface Props {
  item: MenuItemType;
  currencySymbol: string;
  /** Хук для будущей корзины. Если не передан — кнопка "+" не показывается. */
  onAdd?: (item: MenuItemType) => void;
}

/**
 * Карточка одного блюда. Mobile-first: всё в одну строку,
 * описание мелким текстом ниже. Кнопка "+" — заготовка под Phase 2.
 */
export function MenuItem({ item, currencySymbol, onAdd }: Props) {
  const hasPrice = item.price > 0;

  return (
    <div className="group flex items-start gap-3 border-b border-zinc-200 py-4 last:border-0">
      <div className="min-w-0 flex-1">
        <div className="flex flex-wrap items-baseline gap-x-2 gap-y-1">
          <h3 className="font-medium leading-snug text-zinc-900">
            {item.name}
          </h3>
          {item.portion && (
            <span className="whitespace-nowrap text-xs text-zinc-500">
              · {item.portion}
            </span>
          )}
          {item.preorder && (
            <span className="rounded bg-amber-100 px-1.5 py-0.5 text-[10px] uppercase tracking-wide text-amber-800">
              предзаказ
            </span>
          )}
        </div>
        {item.description && (
          <p className="mt-1 text-sm leading-snug text-zinc-500">
            {item.description}
          </p>
        )}
      </div>

      <div className="flex shrink-0 flex-col items-end gap-2">
        <div className="whitespace-nowrap font-semibold text-zinc-900">
          {formatPrice(item.price, currencySymbol)}
        </div>
        {hasPrice && onAdd && (
          <button
            type="button"
            onClick={() => onAdd(item)}
            className={cn(
              "inline-flex h-8 w-8 items-center justify-center rounded-full",
              "bg-zinc-900 text-white",
              "transition hover:bg-zinc-800 active:scale-95",
            )}
            aria-label={`Добавить ${item.name}`}
          >
            <Plus className="h-4 w-4" />
          </button>
        )}
      </div>
    </div>
  );
}
