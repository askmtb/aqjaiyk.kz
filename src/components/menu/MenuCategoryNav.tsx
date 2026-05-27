import { useEffect, useRef, useState } from "react";
import { cn } from "@/lib/utils";
import type { MenuCategory } from "@/types/menu";

interface Props {
  categories: MenuCategory[];
}

/**
 * Горизонтальная sticky-навигация по категориям.
 * - Якорные ссылки (нативный smooth scroll через scroll-behavior)
 * - IntersectionObserver подсвечивает активную категорию при прокрутке
 * - Активная пилюля автоматически прокручивается в видимую часть
 */
export function MenuCategoryNav({ categories }: Props) {
  const [activeId, setActiveId] = useState<string | null>(
    categories[0]?.id ?? null,
  );
  const navRef = useRef<HTMLDivElement>(null);

  // Scroll-spy: подсветка категории по верхней видимой секции
  useEffect(() => {
    const observer = new IntersectionObserver(
      (entries) => {
        const visible = entries
          .filter((e) => e.isIntersecting)
          .sort(
            (a, b) => a.boundingClientRect.top - b.boundingClientRect.top,
          );
        if (visible[0]) {
          const id = visible[0].target.id.replace("category-", "");
          setActiveId(id);
        }
      },
      {
        // Верхняя граница на 30% сверху, нижняя на 60% снизу:
        // активной становится категория, попавшая в верхнюю треть экрана
        rootMargin: "-30% 0px -60% 0px",
        threshold: 0,
      },
    );

    categories.forEach((cat) => {
      const el = document.getElementById(`category-${cat.id}`);
      if (el) observer.observe(el);
    });

    return () => observer.disconnect();
  }, [categories]);

  // Авто-прокрутка активной пилюли в видимую область nav-полосы
  useEffect(() => {
    if (!activeId || !navRef.current) return;
    const btn = navRef.current.querySelector<HTMLElement>(
      `[data-cat="${activeId}"]`,
    );
    btn?.scrollIntoView({
      behavior: "smooth",
      inline: "center",
      block: "nearest",
    });
  }, [activeId]);

  return (
    <nav
      ref={navRef}
      className={cn(
        "sticky top-0 z-20 -mx-4 overflow-x-auto px-4",
        "border-b border-zinc-200 bg-white/95 backdrop-blur",
        // Скрыть скроллбар (Tailwind v4 — используем utility, иначе можно plugin)
        "[scrollbar-width:none] [&::-webkit-scrollbar]:hidden",
      )}
      aria-label="Категории меню"
    >
      <ul className="flex w-max gap-2 py-3">
        {categories.map((cat) => (
          <li key={cat.id}>
            <a
              href={`#category-${cat.id}`}
              data-cat={cat.id}
              className={cn(
                "inline-block whitespace-nowrap rounded-full px-3 py-1.5 text-sm transition",
                activeId === cat.id
                  ? "bg-zinc-900 text-white"
                  : "bg-zinc-100 text-zinc-700 hover:bg-zinc-200",
              )}
            >
              {cat.name}
            </a>
          </li>
        ))}
      </ul>
    </nav>
  );
}
