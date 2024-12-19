module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  theme: {
    extend: {
      colors: {
        cream: '#FFFDD0', // クリーム色を追加
        'light-cream' : '#FFFEF0',// クリーム色　薄め
        'dark-brown': '#6B4226', // 焦茶色
        'black-brown': '#2C1A12', // 黒に近い茶色
        'light-brown': '#D3B29E', // 白に近い茶色
        'cream-brown': '#E1C8A7', // クリーム色に近い茶色
        'deep-brown': '#1C0D05', // 深い茶色
        'forest-green': '#013220', // フォレストグリーン
        'apricot-pink': '#FADADD', // アプリコットピンク
        'rose-white': '#FFEBEB', // ローズホワイト
        'light-pink': '#FFD1DC', // 薄いピンク
        'deep-green': '#001f1a', // 深緑色
        'soft-green': '#f6fff8', // 白に近い緑色
        'calm-green': '#d8f3dc', // 明るい緑色
        'forest-green': '#a0d3b0', // 落ち着いた明るい緑色
        'light-khaki': '#d3d0b4', // 薄いカーキ色
      },
    },
  },
  plugins: [require("daisyui")],// DaisyUIプラグインを保持
};
