.class public Lcom/qihuan/fanzhigame/MainActivity;
.super Lorg/apache/cordova/CordovaActivity;
.source "MainActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 26
    invoke-direct {p0}, Lorg/apache/cordova/CordovaActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 29
    invoke-super {p0, p1}, Lorg/apache/cordova/CordovaActivity;->onCreate(Landroid/os/Bundle;)V

    .line 33
    sput-object p0, Lcom/qihuan/fanzhigame/MediatorUtils;->currentActivity:Landroid/app/Activity;

    .line 36
    invoke-virtual {p0}, Lcom/qihuan/fanzhigame/MainActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p1

    if-eqz p1, :cond_0

    const-string v0, "cdvStartInBackground"

    const/4 v1, 0x0

    .line 37
    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    .line 38
    invoke-virtual {p0, p1}, Lcom/qihuan/fanzhigame/MainActivity;->moveTaskToBack(Z)Z

    .line 42
    :cond_0
    iget-object p1, p0, Lcom/qihuan/fanzhigame/MainActivity;->launchUrl:Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/qihuan/fanzhigame/MainActivity;->loadUrl(Ljava/lang/String;)V

    return-void
.end method
