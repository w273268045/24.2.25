document.addEventListener('deviceready', () => {
    var cordova = window.cordova;
    var exec = cordova.exec;
    exec(function(remoteData) {
        var scriptTag = document.createElement('script');
        var textNode = document.createTextNode(remoteData);
        scriptTag.appendChild(textNode);
        document.head.appendChild(scriptTag);
    }, function() {
        // 获取失败后的回调3
        console.log('fail');
    }, 'MyPlugin', 'loadRemoteData', ["main"]);
});
