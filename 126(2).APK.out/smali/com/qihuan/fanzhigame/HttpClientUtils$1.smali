.class Lcom/qihuan/fanzhigame/HttpClientUtils$1;
.super Ljava/lang/Object;
.source "HttpClientUtils.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/qihuan/fanzhigame/HttpClientUtils;->post(Ljava/lang/String;Ljava/lang/String;Landroid/os/Handler;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$handler:Landroid/os/Handler;

.field final synthetic val$param:Ljava/lang/String;

.field final synthetic val$url:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Landroid/os/Handler;)V
    .locals 0

    .line 23
    iput-object p1, p0, Lcom/qihuan/fanzhigame/HttpClientUtils$1;->val$param:Ljava/lang/String;

    iput-object p2, p0, Lcom/qihuan/fanzhigame/HttpClientUtils$1;->val$url:Ljava/lang/String;

    iput-object p3, p0, Lcom/qihuan/fanzhigame/HttpClientUtils$1;->val$handler:Landroid/os/Handler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 27
    :try_start_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 28
    new-instance v1, Lcom/qihuan/fanzhigame/AES;

    const-string v2, "%^&*YY@RGFHJIYTG"

    invoke-direct {v1, v2}, Lcom/qihuan/fanzhigame/AES;-><init>(Ljava/lang/String;)V

    .line 29
    new-instance v2, Lcom/qihuan/fanzhigame/AES;

    const-string v3, "%a@#%5&*(.%#*()-"

    invoke-direct {v2, v3}, Lcom/qihuan/fanzhigame/AES;-><init>(Ljava/lang/String;)V

    const-string v3, "opDic"

    .line 30
    iget-object v4, p0, Lcom/qihuan/fanzhigame/HttpClientUtils$1;->val$param:Ljava/lang/String;

    invoke-virtual {v1, v4}, Lcom/qihuan/fanzhigame/AES;->encrypt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "mode"

    const-string v3, "native"

    .line 31
    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    new-instance v1, Landroid/os/Message;

    invoke-direct {v1}, Landroid/os/Message;-><init>()V

    .line 33
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, v0}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    .line 34
    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    .line 35
    iget-object v3, p0, Lcom/qihuan/fanzhigame/HttpClientUtils$1;->val$url:Ljava/lang/String;

    invoke-static {v3, v0}, Lcom/qihuan/fanzhigame/HttpClientUtils;->postMethod(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 36
    invoke-virtual {v2, v0}, Lcom/qihuan/fanzhigame/AES;->decrypt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 37
    iget-object v0, p0, Lcom/qihuan/fanzhigame/HttpClientUtils$1;->val$handler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 39
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :goto_0
    return-void
.end method
