import { useState, useCallback } from "react";
import type { MenuItem } from "@/types/menu";

export interface CartItem {
  item: MenuItem;
  qty: number;
}

export function useCart() {
  const [items, setItems] = useState<CartItem[]>([]);

  const add = useCallback((item: MenuItem) => {
    setItems((prev) => {
      const existing = prev.find((c) => c.item.id === item.id);
      if (existing) {
        return prev.map((c) =>
          c.item.id === item.id ? { ...c, qty: c.qty + 1 } : c,
        );
      }
      return [...prev, { item, qty: 1 }];
    });
  }, []);

  const remove = useCallback((id: string) => {
    setItems((prev) => prev.filter((c) => c.item.id !== id));
  }, []);

  const decrement = useCallback((id: string) => {
    setItems((prev) =>
      prev
        .map((c) => (c.item.id === id ? { ...c, qty: c.qty - 1 } : c))
        .filter((c) => c.qty > 0),
    );
  }, []);

  const clear = useCallback(() => setItems([]), []);

  const subtotal = items.reduce((sum, c) => sum + c.item.price * c.qty, 0);
  const totalCount = items.reduce((sum, c) => sum + c.qty, 0);

  return { items, add, remove, decrement, clear, subtotal, totalCount };
}

export type Cart = ReturnType<typeof useCart>;
