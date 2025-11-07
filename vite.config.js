import { defineConfig } from 'vite'
import path from 'path'

export default defineConfig({
  resolve: {
    alias: {
      '@': path.resolve(__dirname, './src')
    }
  },
  esbuild: {
    loader: 'jsx',
    include: /src\/.*\.jsx?$/,
    exclude: []
  },
  optimizeDeps: {
    esbuildOptions: {
      loader: {
        '.js': 'jsx'
      }
    }
  },
  build: {
    rollupOptions: {
      input: {
        main: 'index.html',
        services: 'services.html',
        portfolio: 'portfolio.html',
        guarantees: 'guarantees.html',
        contact: 'contact.html',
        'privacy-policy': 'privacy-policy.html',
        'terms-of-service': 'terms-of-service.html',
        'cookie-policy': 'cookie-policy.html',
        disclaimer: 'disclaimer.html'
      }
    }
  }
})