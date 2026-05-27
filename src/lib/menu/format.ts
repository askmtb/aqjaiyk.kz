/**
 * Форматирование цены в строку для отображения.
 * 0 интерпретируется как «цена не указана» (например, соусы).
 */
export function formatPrice(price: number, symbol = "тг"): string {
  if (price === 0) return "—";
  return `${price.toLocaleString("ru-RU")} ${symbol}`;
}

/**
 * Считает итог с учётом обслуживания 10%.
 * Возвращает целое число тенге.
 */
export function calculateTotalWithService(
  subtotal: number,
  serviceChargePercent: number,
): number {
  return Math.round(subtotal * (1 + serviceChargePercent / 100));
}
