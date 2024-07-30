import { defineConfig, UserConfigExport } from 'vite';
import react from '@vitejs/plugin-react-swc';

// https://vitejs.dev/config/
const config: UserConfigExport = {
  plugins: [react()],
};

export default defineConfig(config);
