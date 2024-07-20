# Custom 42+ cause hang cucked us

## Setup

### Requirements

- [bun](https://bun.sh/): the javascript run time we use
- [supabase](https://supabase.com/): the backend-as-a-service we use (basically it provides us a database)
  - [orbstack](https://orbstack.dev/): a docker runtime so you can run supabase locally when developing

### Install bun

```bash
curl -fsSL https://bun.sh/install | bash
```

OR

```bash
brew tap oven-sh/bun
brew install bun
```

### Install orbstack

```bash
brew install --cask orbstack
```

### Install dependencies and run

```bash
# make sure you're in the 42-plus directory

# Install the dependencies
bun install
# Start supabase locally
bunx supabase start

# Start the vite server
bun run dev
```

### Supabase Workflow
Commands
```bash
# to start the local supabase instance
bunx supabase start

# to create a new migration with table info
bunx supabase migration new <insert-name-here>-ddl

# to update local db to have migrations
bunx supabase db reset

# to stop supabase running
bunx supabase stop
```

Url to access local supabase server
[http://localhost:54323](http://localhost:54323)

### Legacy README from vite

This template provides a minimal setup to get React working in Vite with HMR and some ESLint rules.

Currently, two official plugins are available:

- [@vitejs/plugin-react](https://github.com/vitejs/vite-plugin-react/blob/main/packages/plugin-react/README.md) uses [Babel](https://babeljs.io/) for Fast Refresh
- [@vitejs/plugin-react-swc](https://github.com/vitejs/vite-plugin-react-swc) uses [SWC](https://swc.rs/) for Fast Refresh
