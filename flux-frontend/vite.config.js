import { defineConfig, loadEnv } from 'vite'
import path from 'path'
import createVitePlugins from './vite/plugins'
import monacoEditorPlugin from 'vite-plugin-monaco-editor'
// 如果上述无效，尝试：
const monacoPlugin = monacoEditorPlugin.default || monacoEditorPlugin

// https://vitejs.dev/config/
export default defineConfig(({ mode, command }) => {
  const env = loadEnv(mode, process.cwd())
  const { VITE_APP_ENV } = env
  return {
    // 部署生产环境和开发环境下的URL。
    base: VITE_APP_ENV === 'production' ? '/' : '/',
    plugins: [
      createVitePlugins(env, command === 'build'),
      monacoPlugin({
        // 关键配置：设置 publicPath 和 filename
        publicPath: 'monaco-editor-workers',
        filename: ({ workerId }) => `${workerId}.worker.js`,
        languageWorkers: ['editorWorkerService', 'css', 'html', 'json', 'typescript']
      })
    ],
    resolve: {
      // https://cn.vitejs.dev/config/#resolve-alias
      alias: {
        '~': path.resolve(__dirname, './'),
        '@': path.resolve(__dirname, './src')
      },
      extensions: ['.mjs', '.js', '.ts', '.jsx', '.tsx', '.json', '.vue']
    },
    server: {
      port: 80,
      host: true,
      open: true,
      proxy: {
        '/dev-api': {
          target: 'http://127.0.0.1:9099',
          changeOrigin: true,
          rewrite: (p) => p.replace(/^\/dev-api/, '')
        }
      }
    },
    // 修复警告：@charset 必须是文件的第一条规则
    css: {
      postcss: {
        plugins: [
          {
            postcssPlugin: 'internal:charset-removal',
            AtRule: {
              charset: (atRule) => {
                if (atRule.name === 'charset') {
                  atRule.remove()
                }
              }
            }
          }
        ]
      }
    }
  }
})