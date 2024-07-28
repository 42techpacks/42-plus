declare module 'react' {
  import { ReactNode, FC, ReactElement } from 'react';

  export type ReactNode = ReactNode;
  export type FC<P = {}> = FC<P>;
  export type ReactElement = ReactElement;

  const content: {
    createElement: typeof React.createElement;
    Component: typeof React.Component;
    Fragment: typeof React.Fragment;
    useState: typeof React.useState;
    useEffect: typeof React.useEffect;
    useContext: typeof React.useContext;
    useReducer: typeof React.useReducer;
    useCallback: typeof React.useCallback;
    useMemo: typeof React.useMemo;
    useRef: typeof React.useRef;
    useLayoutEffect: typeof React.useLayoutEffect;
    useImperativeHandle: typeof React.useImperativeHandle;
    useDebugValue: typeof React.useDebugValue;
    useTransition: typeof React.useTransition;
    useDeferredValue: typeof React.useDeferredValue;
    Suspense: typeof React.Suspense;
    lazy: typeof React.lazy;
  };

  export default content;
}
