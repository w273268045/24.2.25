.class public Lorg/apache/cordova/engine/SystemWebViewClient;
.super Landroid/webkit/WebViewClient;
.source "SystemWebViewClient.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "SystemWebViewClient"


# instance fields
.field private final assetLoader:Landroidx/webkit/WebViewAssetLoader;

.field private authenticationTokens:Ljava/util/Hashtable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Hashtable<",
            "Ljava/lang/String;",
            "Lorg/apache/cordova/AuthenticationToken;",
            ">;"
        }
    .end annotation
.end field

.field private doClearHistory:Z

.field isCurrentlyLoading:Z

.field protected final parentEngine:Lorg/apache/cordova/engine/SystemWebViewEngine;


# direct methods
.method public constructor <init>(Lorg/apache/cordova/engine/SystemWebViewEngine;)V
    .locals 4

    .line 71
    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    const/4 v0, 0x0

    .line 65
    iput-boolean v0, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->doClearHistory:Z

    .line 69
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->authenticationTokens:Ljava/util/Hashtable;

    .line 72
    iput-object p1, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->parentEngine:Lorg/apache/cordova/engine/SystemWebViewEngine;

    .line 74
    new-instance v0, Landroidx/webkit/WebViewAssetLoader$Builder;

    invoke-direct {v0}, Landroidx/webkit/WebViewAssetLoader$Builder;-><init>()V

    iget-object v1, p1, Lorg/apache/cordova/engine/SystemWebViewEngine;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v2, "hostname"

    const-string v3, "localhost"

    .line 75
    invoke-virtual {v1, v2, v3}, Lorg/apache/cordova/CordovaPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/webkit/WebViewAssetLoader$Builder;->setDomain(Ljava/lang/String;)Landroidx/webkit/WebViewAssetLoader$Builder;

    move-result-object v0

    const/4 v1, 0x1

    .line 76
    invoke-virtual {v0, v1}, Landroidx/webkit/WebViewAssetLoader$Builder;->setHttpAllowed(Z)Landroidx/webkit/WebViewAssetLoader$Builder;

    move-result-object v0

    .line 78
    new-instance v1, Lorg/apache/cordova/engine/SystemWebViewClient$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1}, Lorg/apache/cordova/engine/SystemWebViewClient$$ExternalSyntheticLambda0;-><init>(Lorg/apache/cordova/engine/SystemWebViewClient;Lorg/apache/cordova/engine/SystemWebViewEngine;)V

    const-string p1, "/"

    invoke-virtual {v0, p1, v1}, Landroidx/webkit/WebViewAssetLoader$Builder;->addPathHandler(Ljava/lang/String;Landroidx/webkit/WebViewAssetLoader$PathHandler;)Landroidx/webkit/WebViewAssetLoader$Builder;

    .line 118
    invoke-virtual {v0}, Landroidx/webkit/WebViewAssetLoader$Builder;->build()Landroidx/webkit/WebViewAssetLoader;

    move-result-object p1

    iput-object p1, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->assetLoader:Landroidx/webkit/WebViewAssetLoader;

    return-void
.end method

.method private static needsContentUrlFix(Landroid/net/Uri;)Z
    .locals 1

    const-string v0, "content"

    .line 404
    invoke-virtual {p0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method private static needsSpecialsInAssetUrlFix(Landroid/net/Uri;)Z
    .locals 3

    .line 408
    invoke-static {p0}, Lorg/apache/cordova/CordovaResourceApi;->getUriType(Landroid/net/Uri;)I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eq v0, v2, :cond_0

    return v1

    .line 411
    :cond_0
    invoke-virtual {p0}, Landroid/net/Uri;->getQuery()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_2

    invoke-virtual {p0}, Landroid/net/Uri;->getFragment()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    goto :goto_0

    .line 415
    :cond_1
    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "%"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    return v1

    :cond_2
    :goto_0
    return v2
.end method


# virtual methods
.method public clearAuthenticationTokens()V
    .locals 1

    .line 368
    iget-object v0, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->authenticationTokens:Ljava/util/Hashtable;

    invoke-virtual {v0}, Ljava/util/Hashtable;->clear()V

    return-void
.end method

.method public getAuthenticationToken(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/cordova/AuthenticationToken;
    .locals 2

    .line 344
    iget-object v0, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->authenticationTokens:Ljava/util/Hashtable;

    invoke-virtual {p1, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/AuthenticationToken;

    if-nez v0, :cond_1

    .line 348
    iget-object v0, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->authenticationTokens:Ljava/util/Hashtable;

    invoke-virtual {v0, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/apache/cordova/AuthenticationToken;

    if-nez p1, :cond_0

    .line 352
    iget-object p1, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->authenticationTokens:Ljava/util/Hashtable;

    invoke-virtual {p1, p2}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/apache/cordova/AuthenticationToken;

    :cond_0
    move-object v0, p1

    if-nez v0, :cond_1

    .line 357
    iget-object p1, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->authenticationTokens:Ljava/util/Hashtable;

    const-string p2, ""

    invoke-virtual {p1, p2}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    move-object v0, p1

    check-cast v0, Lorg/apache/cordova/AuthenticationToken;

    :cond_1
    return-object v0
.end method

.method synthetic lambda$new$0$org-apache-cordova-engine-SystemWebViewClient(Lorg/apache/cordova/engine/SystemWebViewEngine;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;
    .locals 4

    const/4 v0, 0x0

    .line 81
    :try_start_0
    iget-object v1, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->parentEngine:Lorg/apache/cordova/engine/SystemWebViewEngine;

    iget-object v1, v1, Lorg/apache/cordova/engine/SystemWebViewEngine;->pluginManager:Lorg/apache/cordova/PluginManager;

    if-eqz v1, :cond_1

    .line 83
    invoke-virtual {v1}, Lorg/apache/cordova/PluginManager;->getPluginPathHandlers()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/cordova/CordovaPluginPathHandler;

    .line 84
    invoke-virtual {v2}, Lorg/apache/cordova/CordovaPluginPathHandler;->getPathHandler()Landroidx/webkit/WebViewAssetLoader$PathHandler;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 85
    invoke-virtual {v2}, Lorg/apache/cordova/CordovaPluginPathHandler;->getPathHandler()Landroidx/webkit/WebViewAssetLoader$PathHandler;

    move-result-object v2

    invoke-interface {v2, p2}, Landroidx/webkit/WebViewAssetLoader$PathHandler;->handle(Ljava/lang/String;)Landroid/webkit/WebResourceResponse;

    move-result-object v2

    if-eqz v2, :cond_0

    return-object v2

    .line 93
    :cond_1
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_2

    const-string p2, "index.html"

    .line 96
    :cond_2
    iget-object p1, p1, Lorg/apache/cordova/engine/SystemWebViewEngine;->webView:Lorg/apache/cordova/engine/SystemWebView;

    invoke-virtual {p1}, Lorg/apache/cordova/engine/SystemWebView;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object p1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "www/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x2

    invoke-virtual {p1, v1, v2}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;I)Ljava/io/InputStream;

    move-result-object p1

    const-string v1, "text/html"

    .line 98
    invoke-static {p2}, Landroid/webkit/MimeTypeMap;->getFileExtensionFromUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_6

    const-string v1, ".js"

    .line 100
    invoke-virtual {p2, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_5

    const-string v1, ".mjs"

    invoke-virtual {p2, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    goto :goto_0

    :cond_3
    const-string v1, ".wasm"

    .line 103
    invoke-virtual {p2, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_4

    const-string v1, "application/wasm"

    goto :goto_1

    .line 106
    :cond_4
    invoke-static {}, Landroid/webkit/MimeTypeMap;->getSingleton()Landroid/webkit/MimeTypeMap;

    move-result-object p2

    invoke-virtual {p2, v2}, Landroid/webkit/MimeTypeMap;->getMimeTypeFromExtension(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    :cond_5
    :goto_0
    const-string v1, "application/javascript"

    .line 110
    :cond_6
    :goto_1
    new-instance p2, Landroid/webkit/WebResourceResponse;

    invoke-direct {p2, v1, v0, p1}, Landroid/webkit/WebResourceResponse;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p2

    :catch_0
    move-exception p1

    .line 112
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    const-string p2, "SystemWebViewClient"

    .line 113
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lorg/apache/cordova/LOG;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 2

    .line 210
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 212
    iget-boolean v0, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->isCurrentlyLoading:Z

    if-nez v0, :cond_0

    const-string v0, "about:"

    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    .line 215
    iput-boolean v0, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->isCurrentlyLoading:Z

    .line 223
    iget-boolean v1, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->doClearHistory:Z

    if-eqz v1, :cond_1

    .line 224
    invoke-virtual {p1}, Landroid/webkit/WebView;->clearHistory()V

    .line 225
    iput-boolean v0, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->doClearHistory:Z

    .line 227
    :cond_1
    iget-object p1, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->parentEngine:Lorg/apache/cordova/engine/SystemWebViewEngine;

    iget-object p1, p1, Lorg/apache/cordova/engine/SystemWebViewEngine;->client:Lorg/apache/cordova/CordovaWebViewEngine$Client;

    invoke-interface {p1, p2}, Lorg/apache/cordova/CordovaWebViewEngine$Client;->onPageFinishedLoading(Ljava/lang/String;)V

    return-void
.end method

.method public onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 0

    .line 193
    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    const/4 p1, 0x1

    .line 194
    iput-boolean p1, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->isCurrentlyLoading:Z

    .line 196
    iget-object p1, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->parentEngine:Lorg/apache/cordova/engine/SystemWebViewEngine;

    iget-object p1, p1, Lorg/apache/cordova/engine/SystemWebViewEngine;->bridge:Lorg/apache/cordova/CordovaBridge;

    invoke-virtual {p1}, Lorg/apache/cordova/CordovaBridge;->reset()V

    .line 197
    iget-object p1, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->parentEngine:Lorg/apache/cordova/engine/SystemWebViewEngine;

    iget-object p1, p1, Lorg/apache/cordova/engine/SystemWebViewEngine;->client:Lorg/apache/cordova/CordovaWebViewEngine$Client;

    invoke-interface {p1, p2}, Lorg/apache/cordova/CordovaWebViewEngine$Client;->onPageStarted(Ljava/lang/String;)V

    return-void
.end method

.method public onReceivedClientCertRequest(Landroid/webkit/WebView;Landroid/webkit/ClientCertRequest;)V
    .locals 3

    .line 172
    iget-object v0, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->parentEngine:Lorg/apache/cordova/engine/SystemWebViewEngine;

    iget-object v0, v0, Lorg/apache/cordova/engine/SystemWebViewEngine;->pluginManager:Lorg/apache/cordova/PluginManager;

    if-eqz v0, :cond_0

    .line 173
    new-instance v1, Lorg/apache/cordova/CordovaClientCertRequest;

    invoke-direct {v1, p2}, Lorg/apache/cordova/CordovaClientCertRequest;-><init>(Landroid/webkit/ClientCertRequest;)V

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Lorg/apache/cordova/PluginManager;->onReceivedClientCertRequest(Lorg/apache/cordova/CordovaWebView;Lorg/apache/cordova/ICordovaClientCertRequest;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 174
    iget-object p1, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->parentEngine:Lorg/apache/cordova/engine/SystemWebViewEngine;

    iget-object p1, p1, Lorg/apache/cordova/engine/SystemWebViewEngine;->client:Lorg/apache/cordova/CordovaWebViewEngine$Client;

    invoke-interface {p1}, Lorg/apache/cordova/CordovaWebViewEngine$Client;->clearLoadTimeoutTimer()V

    return-void

    .line 179
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->onReceivedClientCertRequest(Landroid/webkit/WebView;Landroid/webkit/ClientCertRequest;)V

    return-void
.end method

.method public onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 244
    iget-boolean v0, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->isCurrentlyLoading:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    .line 247
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x1

    aput-object p3, v0, v1

    const/4 v1, 0x2

    aput-object p4, v0, v1

    const-string v1, "SystemWebViewClient"

    const-string v2, "CordovaWebViewClient.onReceivedError: Error code=%s Description=%s URL=%s"

    invoke-static {v1, v2, v0}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    const/16 v0, -0xa

    if-ne p2, v0, :cond_2

    .line 253
    iget-object v0, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->parentEngine:Lorg/apache/cordova/engine/SystemWebViewEngine;

    iget-object v0, v0, Lorg/apache/cordova/engine/SystemWebViewEngine;->client:Lorg/apache/cordova/CordovaWebViewEngine$Client;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaWebViewEngine$Client;->clearLoadTimeoutTimer()V

    .line 255
    invoke-virtual {p1}, Landroid/webkit/WebView;->canGoBack()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 256
    invoke-virtual {p1}, Landroid/webkit/WebView;->goBack()V

    return-void

    .line 259
    :cond_1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/webkit/WebViewClient;->onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V

    .line 262
    :cond_2
    iget-object p1, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->parentEngine:Lorg/apache/cordova/engine/SystemWebViewEngine;

    iget-object p1, p1, Lorg/apache/cordova/engine/SystemWebViewEngine;->client:Lorg/apache/cordova/CordovaWebViewEngine$Client;

    invoke-interface {p1, p2, p3, p4}, Lorg/apache/cordova/CordovaWebViewEngine$Client;->onReceivedError(ILjava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onReceivedHttpAuthRequest(Landroid/webkit/WebView;Landroid/webkit/HttpAuthHandler;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 143
    invoke-virtual {p0, p3, p4}, Lorg/apache/cordova/engine/SystemWebViewClient;->getAuthenticationToken(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/cordova/AuthenticationToken;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 145
    invoke-virtual {v0}, Lorg/apache/cordova/AuthenticationToken;->getUserName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0}, Lorg/apache/cordova/AuthenticationToken;->getPassword()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p1, p3}, Landroid/webkit/HttpAuthHandler;->proceed(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 150
    :cond_0
    iget-object v0, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->parentEngine:Lorg/apache/cordova/engine/SystemWebViewEngine;

    iget-object v0, v0, Lorg/apache/cordova/engine/SystemWebViewEngine;->pluginManager:Lorg/apache/cordova/PluginManager;

    if-eqz v0, :cond_1

    .line 151
    new-instance v1, Lorg/apache/cordova/CordovaHttpAuthHandler;

    invoke-direct {v1, p2}, Lorg/apache/cordova/CordovaHttpAuthHandler;-><init>(Landroid/webkit/HttpAuthHandler;)V

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1, p3, p4}, Lorg/apache/cordova/PluginManager;->onReceivedHttpAuthRequest(Lorg/apache/cordova/CordovaWebView;Lorg/apache/cordova/ICordovaHttpAuthHandler;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 152
    iget-object p1, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->parentEngine:Lorg/apache/cordova/engine/SystemWebViewEngine;

    iget-object p1, p1, Lorg/apache/cordova/engine/SystemWebViewEngine;->client:Lorg/apache/cordova/CordovaWebViewEngine$Client;

    invoke-interface {p1}, Lorg/apache/cordova/CordovaWebViewEngine$Client;->clearLoadTimeoutTimer()V

    return-void

    .line 157
    :cond_1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/webkit/WebViewClient;->onReceivedHttpAuthRequest(Landroid/webkit/WebView;Landroid/webkit/HttpAuthHandler;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onReceivedSslError(Landroid/webkit/WebView;Landroid/webkit/SslErrorHandler;Landroid/net/http/SslError;)V
    .locals 3

    .line 278
    iget-object v0, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->parentEngine:Lorg/apache/cordova/engine/SystemWebViewEngine;

    iget-object v0, v0, Lorg/apache/cordova/engine/SystemWebViewEngine;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroidx/appcompat/app/AppCompatActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getPackageName()Ljava/lang/String;

    move-result-object v0

    .line 279
    iget-object v1, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->parentEngine:Lorg/apache/cordova/engine/SystemWebViewEngine;

    iget-object v1, v1, Lorg/apache/cordova/engine/SystemWebViewEngine;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroidx/appcompat/app/AppCompatActivity;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    const/16 v2, 0x80

    .line 283
    :try_start_0
    invoke-virtual {v1, v0, v2}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 284
    iget v0, v0, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_0

    .line 286
    invoke-virtual {p2}, Landroid/webkit/SslErrorHandler;->proceed()V

    return-void

    .line 290
    :cond_0
    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->onReceivedSslError(Landroid/webkit/WebView;Landroid/webkit/SslErrorHandler;Landroid/net/http/SslError;)V
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 294
    :catch_0
    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->onReceivedSslError(Landroid/webkit/WebView;Landroid/webkit/SslErrorHandler;Landroid/net/http/SslError;)V

    :goto_0
    return-void
.end method

.method public onRenderProcessGone(Landroid/webkit/WebView;Landroid/webkit/RenderProcessGoneDetail;)Z
    .locals 1

    .line 430
    iget-object v0, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->parentEngine:Lorg/apache/cordova/engine/SystemWebViewEngine;

    iget-object v0, v0, Lorg/apache/cordova/engine/SystemWebViewEngine;->pluginManager:Lorg/apache/cordova/PluginManager;

    if-eqz v0, :cond_0

    .line 431
    invoke-virtual {v0, p1, p2}, Lorg/apache/cordova/PluginManager;->onRenderProcessGone(Landroid/webkit/WebView;Landroid/webkit/RenderProcessGoneDetail;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x1

    return p1

    .line 435
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->onRenderProcessGone(Landroid/webkit/WebView;Landroid/webkit/RenderProcessGoneDetail;)Z

    move-result p1

    return p1
.end method

.method public removeAuthenticationToken(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/cordova/AuthenticationToken;
    .locals 1

    .line 325
    iget-object v0, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->authenticationTokens:Ljava/util/Hashtable;

    invoke-virtual {p1, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/apache/cordova/AuthenticationToken;

    return-object p1
.end method

.method public setAuthenticationToken(Lorg/apache/cordova/AuthenticationToken;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    const-string v0, ""

    if-nez p2, :cond_0

    move-object p2, v0

    :cond_0
    if-nez p3, :cond_1

    move-object p3, v0

    .line 313
    :cond_1
    iget-object v0, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->authenticationTokens:Ljava/util/Hashtable;

    invoke-virtual {p2, p3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2, p1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public shouldInterceptRequest(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;
    .locals 0

    .line 424
    iget-object p1, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->assetLoader:Landroidx/webkit/WebViewAssetLoader;

    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroidx/webkit/WebViewAssetLoader;->shouldInterceptRequest(Landroid/net/Uri;)Landroid/webkit/WebResourceResponse;

    move-result-object p1

    return-object p1
.end method

.method public shouldInterceptRequest(Landroid/webkit/WebView;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;
    .locals 6

    const-string p1, "SystemWebViewClient"

    const-string v0, "text/plain"

    const-string v1, "UTF-8"

    const-string v2, "URL blocked by allow list: "

    const/4 v3, 0x0

    .line 377
    :try_start_0
    iget-object v4, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->parentEngine:Lorg/apache/cordova/engine/SystemWebViewEngine;

    iget-object v4, v4, Lorg/apache/cordova/engine/SystemWebViewEngine;->pluginManager:Lorg/apache/cordova/PluginManager;

    invoke-virtual {v4, p2}, Lorg/apache/cordova/PluginManager;->shouldAllowRequest(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 378
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lorg/apache/cordova/LOG;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 380
    new-instance p2, Landroid/webkit/WebResourceResponse;

    invoke-direct {p2, v0, v1, v3}, Landroid/webkit/WebResourceResponse;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)V

    return-object p2

    .line 383
    :cond_0
    iget-object v2, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->parentEngine:Lorg/apache/cordova/engine/SystemWebViewEngine;

    iget-object v2, v2, Lorg/apache/cordova/engine/SystemWebViewEngine;->resourceApi:Lorg/apache/cordova/CordovaResourceApi;

    .line 384
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p2

    .line 386
    invoke-virtual {v2, p2}, Lorg/apache/cordova/CordovaResourceApi;->remapUri(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object v4

    .line 388
    invoke-virtual {p2, v4}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-static {p2}, Lorg/apache/cordova/engine/SystemWebViewClient;->needsSpecialsInAssetUrlFix(Landroid/net/Uri;)Z

    move-result v5

    if-nez v5, :cond_2

    invoke-static {p2}, Lorg/apache/cordova/engine/SystemWebViewClient;->needsContentUrlFix(Landroid/net/Uri;)Z

    move-result p2

    if-eqz p2, :cond_1

    goto :goto_0

    :cond_1
    return-object v3

    :cond_2
    :goto_0
    const/4 p2, 0x1

    .line 389
    invoke-virtual {v2, v4, p2}, Lorg/apache/cordova/CordovaResourceApi;->openForRead(Landroid/net/Uri;Z)Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;

    move-result-object p2

    .line 390
    new-instance v2, Landroid/webkit/WebResourceResponse;

    iget-object v4, p2, Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;->mimeType:Ljava/lang/String;

    iget-object p2, p2, Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;->inputStream:Ljava/io/InputStream;

    invoke-direct {v2, v4, v1, p2}, Landroid/webkit/WebResourceResponse;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v2

    :catch_0
    move-exception p2

    .line 395
    instance-of v2, p2, Ljava/io/FileNotFoundException;

    if-nez v2, :cond_3

    const-string v2, "Error occurred while loading a file (returning a 404)."

    .line 396
    invoke-static {p1, v2, p2}, Lorg/apache/cordova/LOG;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 399
    :cond_3
    new-instance p1, Landroid/webkit/WebResourceResponse;

    invoke-direct {p1, v0, v1, v3}, Landroid/webkit/WebResourceResponse;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)V

    return-object p1
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 0

    .line 132
    iget-object p1, p0, Lorg/apache/cordova/engine/SystemWebViewClient;->parentEngine:Lorg/apache/cordova/engine/SystemWebViewEngine;

    iget-object p1, p1, Lorg/apache/cordova/engine/SystemWebViewEngine;->client:Lorg/apache/cordova/CordovaWebViewEngine$Client;

    invoke-interface {p1, p2}, Lorg/apache/cordova/CordovaWebViewEngine$Client;->onNavigationAttempt(Ljava/lang/String;)Z

    move-result p1

    return p1
.end method
