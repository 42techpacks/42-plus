import { createContext, useContext } from "react";

export function useAuth() {
  return useContext(
    createContext({
      session: null,
      profile: null,
    }),
  );
}
