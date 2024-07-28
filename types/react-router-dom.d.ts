declare module 'react-router-dom' {
  import { ComponentType } from 'react';

  export interface RouteProps {
    path?: string;
    exact?: boolean;
    component?: ComponentType<any>;
    render?: (props: any) => React.ReactNode;
  }

  export function useNavigate(): (to: string) => void;
  export function useParams<T extends Record<string, string | undefined>>(): T;
  export function useLocation(): { pathname: string; search: string; hash: string };
  export function Link(props: { to: string; children: React.ReactNode }): JSX.Element;
  export function Route(props: RouteProps): JSX.Element;
  export function Routes(props: { children: React.ReactNode }): JSX.Element;
  export function BrowserRouter(props: { children: React.ReactNode }): JSX.Element;
}
