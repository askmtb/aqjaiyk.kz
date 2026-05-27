import { ShoppingCart, X, Plus, Minus, Trash2 } from "lucide-react";
import { useState } from "react";
import { cn } from "@/lib/utils";
import { calculateTotalWithService, formatPrice } from "@/lib/menu/format";
import type { Cart } from "@/lib/cart";

interface Props {
  cart: Cart;
  serviceChargePercent: number;
  currencySymbol: string;
}

const KASPI_SHOP_ID = import.meta.env.VITE_KASPI_SHOP_ID as string;

export function CartDrawer({ cart, serviceChargePercent, currencySymbol }: Props) {
  const [open, setOpen] = useState(false);

  const total = calculateTotalWithService(cart.subtotal, serviceChargePercent);
  const serviceAmount = total - cart.subtotal;

  const kaspiUrl = `https://pay.kaspi.kz/pay/${KASPI_SHOP_ID}?amount=${total}`;

  if (cart.totalCount === 0) return null;

  return (
    <>
      {/* Плавающая кнопка корзины */}
      <button
        onClick={() => setOpen(true)}
        className={cn(
          "fixed bottom-6 left-1/2 z-40 -translate-x-1/2",
          "flex items-center gap-3 rounded-full px-5 py-3.5",
          "bg-zinc-900 text-white shadow-lg",
          "transition active:scale-95",
        )}
      >
        <ShoppingCart className="h-5 w-5" />
        <span className="font-semibold">
          {cart.totalCount} поз. · {formatPrice(cart.subtotal, currencySymbol)}
        </span>
      </button>

      {/* Оверлей */}
      {open && (
        <div
          className="fixed inset-0 z-40 bg-black/40"
          onClick={() => setOpen(false)}
        />
      )}

      {/* Drawer снизу */}
      <div
        className={cn(
          "fixed inset-x-0 bottom-0 z-50 flex flex-col",
          "rounded-t-2xl bg-white shadow-2xl",
          "max-h-[85dvh] transition-transform duration-300",
          open ? "translate-y-0" : "translate-y-full",
        )}
      >
        {/* Шапка */}
        <div className="flex items-center justify-between border-b border-zinc-200 px-4 py-4">
          <h2 className="text-lg font-bold text-zinc-900">Ваш заказ</h2>
          <button
            onClick={() => setOpen(false)}
            className="flex h-8 w-8 items-center justify-center rounded-full bg-zinc-100"
            aria-label="Закрыть"
          >
            <X className="h-4 w-4" />
          </button>
        </div>

        {/* Список позиций */}
        <div className="flex-1 overflow-y-auto px-4 py-2">
          {cart.items.map(({ item, qty }) => (
            <div
              key={item.id}
              className="flex items-center gap-3 border-b border-zinc-100 py-3 last:border-0"
            >
              <div className="min-w-0 flex-1">
                <p className="font-medium leading-snug text-zinc-900">{item.name}</p>
                <p className="text-sm text-zinc-500">
                  {formatPrice(item.price, currencySymbol)}
                </p>
              </div>
              <div className="flex items-center gap-2">
                <button
                  onClick={() => cart.decrement(item.id)}
                  className="flex h-7 w-7 items-center justify-center rounded-full bg-zinc-100 transition active:scale-95"
                  aria-label="Уменьшить"
                >
                  <Minus className="h-3.5 w-3.5" />
                </button>
                <span className="w-5 text-center font-semibold">{qty}</span>
                <button
                  onClick={() => cart.add(item)}
                  className="flex h-7 w-7 items-center justify-center rounded-full bg-zinc-900 text-white transition active:scale-95"
                  aria-label="Увеличить"
                >
                  <Plus className="h-3.5 w-3.5" />
                </button>
                <button
                  onClick={() => cart.remove(item.id)}
                  className="ml-1 flex h-7 w-7 items-center justify-center rounded-full bg-red-50 text-red-500 transition active:scale-95"
                  aria-label="Удалить"
                >
                  <Trash2 className="h-3.5 w-3.5" />
                </button>
              </div>
            </div>
          ))}
        </div>

        {/* Итог и кнопка оплаты */}
        <div className="border-t border-zinc-200 px-4 py-4 pb-[calc(1rem+env(safe-area-inset-bottom))]">
          <div className="mb-1 flex justify-between text-sm text-zinc-500">
            <span>Подытог</span>
            <span>{formatPrice(cart.subtotal, currencySymbol)}</span>
          </div>
          <div className="mb-3 flex justify-between text-sm text-zinc-500">
            <span>Обслуживание {serviceChargePercent}%</span>
            <span>{formatPrice(serviceAmount, currencySymbol)}</span>
          </div>
          <div className="mb-4 flex justify-between font-bold text-zinc-900">
            <span>Итого</span>
            <span>{formatPrice(total, currencySymbol)}</span>
          </div>

          <a
            href={kaspiUrl}
            target="_blank"
            rel="noopener noreferrer"
            className={cn(
              "flex w-full items-center justify-center gap-2 rounded-xl py-4",
              "bg-[#E31E24] text-white font-bold text-base",
              "transition active:scale-[0.98] hover:bg-[#c41a20]",
            )}
          >
            Оплатить {formatPrice(total, currencySymbol)} через Kaspi
          </a>
        </div>
      </div>
    </>
  );
}
