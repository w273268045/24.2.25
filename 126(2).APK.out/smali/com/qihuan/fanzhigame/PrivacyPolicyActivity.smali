.class public Lcom/qihuan/fanzhigame/PrivacyPolicyActivity;
.super Landroid/app/Activity;
.source "PrivacyPolicyActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3

    .line 17
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const-string p1, "MyPrefs"

    const/4 v0, 0x0

    .line 20
    invoke-virtual {p0, p1, v0}, Lcom/qihuan/fanzhigame/PrivacyPolicyActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    const-string v1, "isAgreePrivate"

    .line 21
    invoke-interface {p1, v1, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 23
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/qihuan/fanzhigame/MainActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 24
    invoke-virtual {p0, v0}, Lcom/qihuan/fanzhigame/PrivacyPolicyActivity;->startActivity(Landroid/content/Intent;)V

    .line 25
    invoke-virtual {p0}, Lcom/qihuan/fanzhigame/PrivacyPolicyActivity;->finish()V

    .line 28
    :cond_0
    invoke-virtual {p0}, Lcom/qihuan/fanzhigame/PrivacyPolicyActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/Window;->requestFeature(I)Z

    .line 29
    invoke-virtual {p0}, Lcom/qihuan/fanzhigame/PrivacyPolicyActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x400

    invoke-virtual {v0, v1, v1}, Landroid/view/Window;->setFlags(II)V

    const v0, 0x7f0b001c

    .line 30
    invoke-virtual {p0, v0}, Lcom/qihuan/fanzhigame/PrivacyPolicyActivity;->setContentView(I)V

    const v0, 0x7f08003b

    .line 32
    invoke-virtual {p0, v0}, Lcom/qihuan/fanzhigame/PrivacyPolicyActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    const v1, 0x7f080050

    .line 33
    invoke-virtual {p0, v1}, Lcom/qihuan/fanzhigame/PrivacyPolicyActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 35
    new-instance v2, Lcom/qihuan/fanzhigame/PrivacyPolicyActivity$1;

    invoke-direct {v2, p0, p1}, Lcom/qihuan/fanzhigame/PrivacyPolicyActivity$1;-><init>(Lcom/qihuan/fanzhigame/PrivacyPolicyActivity;Landroid/content/SharedPreferences;)V

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 52
    new-instance p1, Lcom/qihuan/fanzhigame/PrivacyPolicyActivity$2;

    invoke-direct {p1, p0}, Lcom/qihuan/fanzhigame/PrivacyPolicyActivity$2;-><init>(Lcom/qihuan/fanzhigame/PrivacyPolicyActivity;)V

    invoke-virtual {v1, p1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method
