import { defineConfig } from 'vitepress'

const enSidebar = [
  {
    text: 'Tools',
    items: [
      { text: 'backup', link: '/backup' },
      { text: 'dirmarks', link: '/dirmarks' },
      { text: 'shell-stash', link: '/shell-stash' },
    ],
  },
]

const jaSidebar = [
  {
    text: 'ツール',
    items: [
      { text: 'backup', link: '/ja/backup' },
      { text: 'dirmarks', link: '/ja/dirmarks' },
      { text: 'shell-stash', link: '/ja/shell-stash' },
    ],
  },
]

const zhSidebar = [
  {
    text: '工具',
    items: [
      { text: 'backup', link: '/zh/backup' },
      { text: 'dirmarks', link: '/zh/dirmarks' },
      { text: 'shell-stash', link: '/zh/shell-stash' },
    ],
  },
]

export default defineConfig({
  title: 'shell-core-tools',
  base: '/shell-core-tools/',

  locales: {
    root: {
      label: 'English',
      lang: 'en',
      description: 'A collection of lightweight shell utilities for everyday terminal workflows.',
      themeConfig: {
        nav: [
          { text: 'Home', link: '/' },
          { text: 'Tools', link: '/backup' },
        ],
        sidebar: enSidebar,
      },
    },
    ja: {
      label: '日本語',
      lang: 'ja',
      description: '日常のターミナル作業を効率化する軽量シェルユーティリティ集。',
      themeConfig: {
        nav: [
          { text: 'ホーム', link: '/ja/' },
          { text: 'ツール', link: '/ja/backup' },
        ],
        sidebar: jaSidebar,
      },
    },
    zh: {
      label: '中文',
      lang: 'zh',
      description: '一组用于日常终端工作的轻量级 Shell 工具集。',
      themeConfig: {
        nav: [
          { text: '首页', link: '/zh/' },
          { text: '工具', link: '/zh/backup' },
        ],
        sidebar: zhSidebar,
      },
    },
  },

  themeConfig: {
    socialLinks: [
      { icon: 'github', link: 'https://github.com/ontheroadjp/shell-core-tools' },
    ],
    footer: {
      message: 'Released under the MIT License.',
    },
  },
})
