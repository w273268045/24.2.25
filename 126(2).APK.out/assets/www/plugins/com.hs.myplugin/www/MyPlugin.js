cordova.define("com.hs.myplugin.MyPlugin", function(require, exports, module) {
var exec = require('cordova/exec');

exports.coolMethod = function(arg0, success, error) {
    exec(success, error, "MyPlugin", "coolMethod", [arg0]);
};

});
