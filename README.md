# Custom 42+ cause hang cucked us


## Setup

### Install bun

```bash
curl -fsSL https://bun.sh/install | bash
```

### OR

```bash
brew tap oven-sh/bun
brew install bun
```

### Install dependencies and run:

cd into the directory and run:

```bash
bun install
bun run dev
```

To run supabase locally:

```bash
bun add -d supabase
bunx supabase init
bunx supabase start
```

This template provides a minimal setup to get React working in Vite with HMR and some ESLint rules.

Currently, two official plugins are available:

- [@vitejs/plugin-react](https://github.com/vitejs/vite-plugin-react/blob/main/packages/plugin-react/README.md) uses [Babel](https://babeljs.io/) for Fast Refresh
- [@vitejs/plugin-react-swc](https://github.com/vitejs/vite-plugin-react-swc) uses [SWC](https://swc.rs/) for Fast Refresh
