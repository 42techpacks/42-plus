declare module '@supabase/supabase-js' {
  export interface User {
    id: string;
    // Add other user properties as needed
  }

  export interface Session {
    user: User;
    // Add other session properties as needed
  }

  export interface SupabaseClient {
    from: <T = any>(table: string) => {
      select: (columns?: string) => Promise<{ data: T[] | null; error: Error | null }>;
      insert: (data: Partial<T>) => Promise<{ data: T[] | null; error: Error | null }>;
      update: (data: Partial<T>) => Promise<{ data: T[] | null; error: Error | null }>;
      delete: () => Promise<{ data: T[] | null; error: Error | null }>;
    };
    auth: {
      getSession: () => Promise<{ data: { session: Session | null }, error: Error | null }>;
      signUp: (credentials: { email: string; password: string }) => Promise<{ user: User | null; session: Session | null; error: Error | null }>;
      signIn: (credentials: { email: string; password: string }) => Promise<{ user: User | null; session: Session | null; error: Error | null }>;
      signOut: () => Promise<{ error: Error | null }>;
      onAuthStateChange: (callback: (event: string, session: Session | null) => void) => { data: { subscription: { unsubscribe: () => void } } | null; error: Error | null };
    };
    channel: (name: string) => {
      on: (event: string, callback: (payload: any) => void) => any;
      subscribe: (callback?: (status: string) => void) => Promise<{ error: Error | null }>;
    };
  }

  export function createClient(supabaseUrl: string, supabaseKey: string): SupabaseClient;
}
