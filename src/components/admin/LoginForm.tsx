import { useState } from "react";
import { cn } from "@/lib/utils";
import logo from "@/assets/logo.png";

interface Props {
  onLogin: (email: string, password: string) => Promise<{ error: Error | null }>;
}

export function LoginForm({ onLogin }: Props) {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");
  const [loading, setLoading] = useState(false);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setError("");
    setLoading(true);
    const { error } = await onLogin(email, password);
    if (error) {
      setError("Неверный email или пароль");
    }
    setLoading(false);
  };

  return (
    <div className="flex min-h-screen items-center justify-center bg-zinc-50 px-4">
      <div className="w-full max-w-sm">
        <div className="mb-8 flex flex-col items-center gap-3">
          <img src={logo} alt="Aq Jaiyk" className="h-16 w-16 rounded-full" />
          <h1 className="text-2xl font-bold text-zinc-900">Вход</h1>
          <p className="text-sm text-zinc-500">Панель управления Aqjaiyk</p>
        </div>

        <form onSubmit={handleSubmit} className="space-y-4">
          <div>
            <label className="mb-1.5 block text-sm font-medium text-zinc-700">
              Email
            </label>
            <input
              type="email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              required
              autoComplete="email"
              className={cn(
                "w-full rounded-xl border border-zinc-200 px-4 py-3 text-base",
                "outline-none focus:border-zinc-900 focus:ring-2 focus:ring-zinc-900/10",
              )}
              placeholder="admin@example.com"
            />
          </div>

          <div>
            <label className="mb-1.5 block text-sm font-medium text-zinc-700">
              Пароль
            </label>
            <input
              type="password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              required
              autoComplete="current-password"
              className={cn(
                "w-full rounded-xl border border-zinc-200 px-4 py-3 text-base",
                "outline-none focus:border-zinc-900 focus:ring-2 focus:ring-zinc-900/10",
              )}
              placeholder="••••••••"
            />
          </div>

          {error && (
            <p className="rounded-lg bg-red-50 px-4 py-2.5 text-sm text-red-600">
              {error}
            </p>
          )}

          <button
            type="submit"
            disabled={loading}
            className={cn(
              "w-full rounded-xl bg-zinc-900 py-3.5 font-semibold text-white",
              "transition hover:bg-zinc-800 active:scale-[0.98]",
              "disabled:opacity-50",
            )}
          >
            {loading ? "Вход…" : "Войти"}
          </button>
        </form>
      </div>
    </div>
  );
}
