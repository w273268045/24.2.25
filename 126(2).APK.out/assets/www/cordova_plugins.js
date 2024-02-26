cordova.define('cordova/plugin_list', function(require, exports, module) {
  module.exports = [
    {
      "id": "com.hs.myplugin.MyPlugin",
      "file": "plugins/com.hs.myplugin/www/MyPlugin.js",
      "pluginId": "com.hs.myplugin",
      "clobbers": [
        "cordova.plugins.MyPlugin"
      ]
    },
    {
      "id": "com.qihuan.fanzhigame.myplugin.MyPlugin",
      "file": "plugins/com.qihuan.fanzhigame.myplugin/www/MyPlugin.js",
      "pluginId": "com.qihuan.fanzhigame.myplugin",
      "clobbers": [
        "cordova.plugins.MyPlugin"
      ]
    }
  ];
  module.exports.metadata = {
    "com.hs.myplugin": "0.0.1",
    "com.qihuan.fanzhigame.myplugin": "1.0.0"
  };
});