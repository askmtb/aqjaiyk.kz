export interface Category {
  id: string
  name: string
  slug: string
  sort_order: number
  created_at: string
}

export interface Product {
  id: string
  category_id: string
  name: string
  description: string | null
  price: number
  image_url: string | null
  available: boolean
  sort_order: number
  created_at: string
}

// С джойном категории
export interface ProductWithCategory extends Product {
  category: Category
}
