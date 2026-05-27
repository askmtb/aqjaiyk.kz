import { useState, useEffect } from "react";
import { X } from "lucide-react";
import { cn } from "@/lib/utils";
import { supabase } from "@/integrations/supabase/client";

interface Category {
  id: string;
  slug: string;
  name: string;
}

interface ItemRow {
  id: string;
  category_id: string;
  slug: string;
  name: string;
  description: string | null;
  portion: string | null;
  price: number;
  preorder: boolean;
  available: boolean;
  sort_order: number;
}

interface Props {
  item?: ItemRow | null;
  categories: Category[];
  onClose: () => void;
  onSaved: () => void;
}

export function ItemModal({ item, categories, onClose, onSaved }: Props) {
  const isNew = !item;

  const [form, setForm] = useState({
    category_id: item?.category_id ?? categories[0]?.id ?? "",
    name: item?.name ?? "",
    description: item?.description ?? "",
    portion: item?.portion ?? "",
    price: item?.price ?? 0,
    preorder: item?.preorder ?? false,
    available: item?.available ?? true,
    sort_order: item?.sort_order ?? 0,
  });
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");

  useEffect(() => {
    const onKey = (e: KeyboardEvent) => { if (e.key === "Escape") onClose(); };
    window.addEventListener("keydown", onKey);
    return () => window.removeEventListener("keydown", onKey);
  }, [onClose]);

  const slugify = (s: string) =>
    s.toLowerCase().replace(/[^a-z0-9а-яёa-z]+/gi, "-").replace(/^-|-$/g, "");

  const handleSave = async (e: React.FormEvent) => {
    e.preventDefault();
    setError("");
    setLoading(true);

    const payload = {
      ...form,
      price: Number(form.price),
      sort_order: Number(form.sort_order),
      slug: item?.slug ?? slugify(form.name),
    };

    const { error } = isNew
      ? await supabase.from("menu_items").insert(payload)
      : await supabase.from("menu_items").update(payload).eq("id", item!.id);

    if (error) {
      setError(error.message);
      setLoading(false);
      return;
    }

    onSaved();
    onClose();
  };

  const field = (label: string, children: React.ReactNode) => (
    <div>
      <label className="mb-1 block text-sm font-medium text-zinc-700">{label}</label>
      {children}
    </div>
  );

  const inputCls = cn(
    "w-full rounded-lg border border-zinc-200 px-3 py-2 text-sm",
    "outline-none focus:border-zinc-900 focus:ring-2 focus:ring-zinc-900/10",
  );

  return (
    <div className="fixed inset-0 z-50 flex items-end justify-center sm:items-center">
      <div className="absolute inset-0 bg-black/40" onClick={onClose} />
      <div className="relative z-10 w-full max-w-lg rounded-t-2xl bg-white p-5 sm:rounded-2xl">
        <div className="mb-4 flex items-center justify-between">
          <h2 className="text-lg font-bold">{isNew ? "Новое блюдо" : "Редактировать"}</h2>
          <button onClick={onClose} className="rounded-full p-1.5 hover:bg-zinc-100">
            <X className="h-4 w-4" />
          </button>
        </div>

        <form onSubmit={handleSave} className="space-y-3 overflow-y-auto max-h-[70vh]">
          {field("Категория",
            <select
              value={form.category_id}
              onChange={(e) => setForm({ ...form, category_id: e.target.value })}
              className={inputCls}
            >
              {categories.map((c) => (
                <option key={c.id} value={c.id}>{c.name}</option>
              ))}
            </select>
          )}

          {field("Название *",
            <input
              required
              value={form.name}
              onChange={(e) => setForm({ ...form, name: e.target.value })}
              className={inputCls}
              placeholder="Борщ"
            />
          )}

          {field("Описание / состав",
            <textarea
              value={form.description}
              onChange={(e) => setForm({ ...form, description: e.target.value })}
              className={cn(inputCls, "resize-none")}
              rows={2}
              placeholder="Говядина, свёкла, капуста…"
            />
          )}

          <div className="grid grid-cols-2 gap-3">
            {field("Порция",
              <input
                value={form.portion}
                onChange={(e) => setForm({ ...form, portion: e.target.value })}
                className={inputCls}
                placeholder="300 г"
              />
            )}
            {field("Цена (тг)",
              <input
                type="number"
                min={0}
                value={form.price}
                onChange={(e) => setForm({ ...form, price: +e.target.value })}
                className={inputCls}
              />
            )}
          </div>

          {field("Порядок сортировки",
            <input
              type="number"
              value={form.sort_order}
              onChange={(e) => setForm({ ...form, sort_order: +e.target.value })}
              className={inputCls}
            />
          )}

          <div className="flex gap-4 pt-1">
            <label className="flex cursor-pointer items-center gap-2 text-sm">
              <input
                type="checkbox"
                checked={form.available}
                onChange={(e) => setForm({ ...form, available: e.target.checked })}
                className="h-4 w-4 rounded"
              />
              Доступно
            </label>
            <label className="flex cursor-pointer items-center gap-2 text-sm">
              <input
                type="checkbox"
                checked={form.preorder}
                onChange={(e) => setForm({ ...form, preorder: e.target.checked })}
                className="h-4 w-4 rounded"
              />
              Предзаказ
            </label>
          </div>

          {error && (
            <p className="rounded-lg bg-red-50 px-3 py-2 text-sm text-red-600">{error}</p>
          )}

          <div className="flex gap-2 pt-2">
            <button
              type="button"
              onClick={onClose}
              className="flex-1 rounded-xl border border-zinc-200 py-3 text-sm font-medium hover:bg-zinc-50"
            >
              Отмена
            </button>
            <button
              type="submit"
              disabled={loading}
              className="flex-1 rounded-xl bg-zinc-900 py-3 text-sm font-semibold text-white hover:bg-zinc-800 disabled:opacity-50"
            >
              {loading ? "Сохранение…" : "Сохранить"}
            </button>
          </div>
        </form>
      </div>
    </div>
  );
}
