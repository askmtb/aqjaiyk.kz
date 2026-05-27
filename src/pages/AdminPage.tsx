import { useEffect, useState, useCallback } from "react";
import { Plus, Pencil, Trash2, LogOut, Eye, EyeOff } from "lucide-react";
import { useAuth } from "@/lib/auth";
import { supabase } from "@/integrations/supabase/client";
import { LoginForm } from "@/components/admin/LoginForm";
import { ItemModal } from "@/components/admin/ItemModal";
import { cn } from "@/lib/utils";
import logo from "@/assets/logo.png";

interface Category { id: string; slug: string; name: string; sort_order: number; }
interface ItemRow {
  id: string; category_id: string; slug: string; name: string;
  description: string | null; portion: string | null; price: number;
  preorder: boolean; available: boolean; sort_order: number;
}

export default function AdminPage() {
  const { user, loading, signIn, signOut } = useAuth();
  const [categories, setCategories] = useState<Category[]>([]);
  const [items, setItems] = useState<ItemRow[]>([]);
  const [activeCat, setActiveCat] = useState<string>("all");
  const [editItem, setEditItem] = useState<ItemRow | null | undefined>(undefined);
  const [deleteId, setDeleteId] = useState<string | null>(null);
  const [dataLoading, setDataLoading] = useState(false);

  const loadData = useCallback(async () => {
    setDataLoading(true);
    const [catRes, itemsRes] = await Promise.all([
      supabase.from("menu_categories").select("*").order("sort_order"),
      supabase.from("menu_items").select("*").order("sort_order"),
    ]);
    if (catRes.data) setCategories(catRes.data);
    if (itemsRes.data) setItems(itemsRes.data);
    setDataLoading(false);
  }, []);

  useEffect(() => {
    if (user) loadData();
  }, [user, loadData]);

  const toggleAvailable = async (item: ItemRow) => {
    await supabase.from("menu_items").update({ available: !item.available }).eq("id", item.id);
    setItems((prev) => prev.map((i) => i.id === item.id ? { ...i, available: !i.available } : i));
  };

  const handleDelete = async () => {
    if (!deleteId) return;
    await supabase.from("menu_items").delete().eq("id", deleteId);
    setItems((prev) => prev.filter((i) => i.id !== deleteId));
    setDeleteId(null);
  };

  if (loading) return (
    <div className="flex min-h-screen items-center justify-center text-zinc-500">
      Загрузка…
    </div>
  );

  if (!user) return <LoginForm onLogin={signIn} />;

  const filtered = activeCat === "all" ? items : items.filter((i) => i.category_id === activeCat);
  const catName = (id: string) => categories.find((c) => c.id === id)?.name ?? "—";

  return (
    <div className="min-h-screen bg-zinc-50">
      {/* Шапка */}
      <header className="sticky top-0 z-10 flex items-center justify-between bg-white px-4 py-3 shadow-sm">
        <div className="flex items-center gap-3">
          <img src={logo} alt="Aq Jaiyk" className="h-9 w-9 rounded-full" />
          <span className="font-bold text-zinc-900">Управление меню</span>
        </div>
        <button
          onClick={signOut}
          className="flex items-center gap-1.5 rounded-lg px-3 py-1.5 text-sm text-zinc-500 hover:bg-zinc-100"
        >
          <LogOut className="h-4 w-4" />
          Выйти
        </button>
      </header>

      {/* Фильтр по категориям */}
      <div className="flex gap-2 overflow-x-auto px-4 py-3 [-ms-overflow-style:none] [scrollbar-width:none]">
        <button
          onClick={() => setActiveCat("all")}
          className={cn(
            "shrink-0 rounded-full px-3.5 py-1.5 text-sm font-medium transition",
            activeCat === "all" ? "bg-zinc-900 text-white" : "bg-white text-zinc-700 hover:bg-zinc-100",
          )}
        >
          Все ({items.length})
        </button>
        {categories.map((c) => {
          const count = items.filter((i) => i.category_id === c.id).length;
          return (
            <button
              key={c.id}
              onClick={() => setActiveCat(c.id)}
              className={cn(
                "shrink-0 rounded-full px-3.5 py-1.5 text-sm font-medium transition",
                activeCat === c.id ? "bg-zinc-900 text-white" : "bg-white text-zinc-700 hover:bg-zinc-100",
              )}
            >
              {c.name} ({count})
            </button>
          );
        })}
      </div>

      {/* Кнопка добавить */}
      <div className="px-4 pb-3">
        <button
          onClick={() => setEditItem(null)}
          className="flex items-center gap-2 rounded-xl bg-zinc-900 px-4 py-2.5 text-sm font-semibold text-white hover:bg-zinc-800"
        >
          <Plus className="h-4 w-4" />
          Добавить блюдо
        </button>
      </div>

      {/* Таблица */}
      {dataLoading ? (
        <div className="flex justify-center py-16 text-zinc-400">Загрузка…</div>
      ) : (
        <div className="px-4 pb-24">
          <div className="overflow-hidden rounded-xl border border-zinc-200 bg-white">
            {filtered.length === 0 ? (
              <p className="py-12 text-center text-zinc-400">Нет позиций</p>
            ) : (
              filtered.map((item, idx) => (
                <div
                  key={item.id}
                  className={cn(
                    "flex items-center gap-3 px-4 py-3",
                    idx !== filtered.length - 1 && "border-b border-zinc-100",
                    !item.available && "opacity-50",
                  )}
                >
                  {/* Инфо */}
                  <div className="min-w-0 flex-1">
                    <div className="flex flex-wrap items-center gap-x-2 gap-y-0.5">
                      <span className="font-medium text-zinc-900">{item.name}</span>
                      {item.portion && (
                        <span className="text-xs text-zinc-400">{item.portion}</span>
                      )}
                      {item.preorder && (
                        <span className="rounded bg-amber-100 px-1.5 py-0.5 text-[10px] text-amber-800">предзаказ</span>
                      )}
                    </div>
                    <div className="mt-0.5 flex gap-2 text-xs text-zinc-400">
                      <span>{catName(item.category_id)}</span>
                      <span>·</span>
                      <span>{item.price > 0 ? `${item.price.toLocaleString("ru-RU")} тг` : "—"}</span>
                    </div>
                  </div>

                  {/* Кнопки */}
                  <div className="flex shrink-0 items-center gap-1">
                    <button
                      onClick={() => toggleAvailable(item)}
                      title={item.available ? "Скрыть" : "Показать"}
                      className="rounded-lg p-2 hover:bg-zinc-100"
                    >
                      {item.available
                        ? <Eye className="h-4 w-4 text-zinc-500" />
                        : <EyeOff className="h-4 w-4 text-zinc-400" />
                      }
                    </button>
                    <button
                      onClick={() => setEditItem(item)}
                      className="rounded-lg p-2 hover:bg-zinc-100"
                    >
                      <Pencil className="h-4 w-4 text-zinc-500" />
                    </button>
                    <button
                      onClick={() => setDeleteId(item.id)}
                      className="rounded-lg p-2 hover:bg-red-50"
                    >
                      <Trash2 className="h-4 w-4 text-red-400" />
                    </button>
                  </div>
                </div>
              ))
            )}
          </div>
        </div>
      )}

      {/* Модал добавления/редактирования */}
      {editItem !== undefined && (
        <ItemModal
          item={editItem}
          categories={categories}
          onClose={() => setEditItem(undefined)}
          onSaved={loadData}
        />
      )}

      {/* Подтверждение удаления */}
      {deleteId && (
        <div className="fixed inset-0 z-50 flex items-center justify-center px-4">
          <div className="absolute inset-0 bg-black/40" onClick={() => setDeleteId(null)} />
          <div className="relative z-10 w-full max-w-sm rounded-2xl bg-white p-6">
            <h3 className="mb-2 text-lg font-bold">Удалить блюдо?</h3>
            <p className="mb-5 text-sm text-zinc-500">Это действие необратимо.</p>
            <div className="flex gap-2">
              <button
                onClick={() => setDeleteId(null)}
                className="flex-1 rounded-xl border border-zinc-200 py-3 text-sm font-medium hover:bg-zinc-50"
              >
                Отмена
              </button>
              <button
                onClick={handleDelete}
                className="flex-1 rounded-xl bg-red-500 py-3 text-sm font-semibold text-white hover:bg-red-600"
              >
                Удалить
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
