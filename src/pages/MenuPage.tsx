import logo from "@/assets/logo.png";
import { useMenu } from "@/lib/menu/queries";
import { useCart } from "@/lib/cart";
import { MenuCategoryNav } from "@/components/menu/MenuCategoryNav";
import { MenuCategorySection } from "@/components/menu/MenuCategorySection";
import { CartDrawer } from "@/components/menu/CartDrawer";

export function MenuPage() {
  const { data: menu, isLoading, error } = useMenu();
  const cart = useCart();

  if (isLoading) {
    return (
      <div className="flex min-h-screen items-center justify-center text-zinc-500">
        Загрузка меню…
      </div>
    );
  }

  if (error || !menu) {
    return (
      <div className="flex min-h-screen items-center justify-center text-red-600">
        Не удалось загрузить меню
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-white">
      <header className="flex items-center gap-3 px-4 pt-5 pb-2">
        <img src={logo} alt="Aq Jaiyk" className="h-12 w-12 rounded-full object-cover" />
        <div>
          <h1 className="text-xl font-bold tracking-tight text-zinc-900">
            {menu.restaurant}
          </h1>
          <p className="text-sm text-zinc-500">Меню кафе</p>
        </div>
      </header>

      <div className="px-4">
        <MenuCategoryNav categories={menu.categories} />
      </div>

      <main className="space-y-10 px-4 py-6 pb-32">
        {menu.categories.map((cat) => (
          <MenuCategorySection
            key={cat.id}
            category={cat}
            currencySymbol={menu.currencySymbol}
            onAddItem={(item) => cart.add(item)}
          />
        ))}

        <footer className="border-t border-zinc-200 pt-4 text-xs text-zinc-500">
          {menu.note}
        </footer>
      </main>

      <CartDrawer
        cart={cart}
        serviceChargePercent={menu.serviceChargePercent}
        currencySymbol={menu.currencySymbol}
      />
    </div>
  );
}

export default MenuPage;
