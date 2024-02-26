.class Lcom/qihuan/fanzhigame/PrivacyPolicyActivity$1;
.super Ljava/lang/Object;
.source "PrivacyPolicyActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/qihuan/fanzhigame/PrivacyPolicyActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/qihuan/fanzhigame/PrivacyPolicyActivity;

.field final synthetic val$sharedPreferences:Landroid/content/SharedPreferences;


# direct methods
.method constructor <init>(Lcom/qihuan/fanzhigame/PrivacyPolicyActivity;Landroid/content/SharedPreferences;)V
    .locals 0

    .line 35
    iput-object p1, p0, Lcom/qihuan/fanzhigame/PrivacyPolicyActivity$1;->this$0:Lcom/qihuan/fanzhigame/PrivacyPolicyActivity;

    iput-object p2, p0, Lcom/qihuan/fanzhigame/PrivacyPolicyActivity$1;->val$sharedPreferences:Landroid/content/SharedPreferences;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 38
    iget-object p1, p0, Lcom/qihuan/fanzhigame/PrivacyPolicyActivity$1;->val$sharedPreferences:Landroid/content/SharedPreferences;

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string v0, "isAgreePrivate"

    const/4 v1, 0x1

    .line 39
    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 40
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 43
    new-instance p1, Landroid/content/Intent;

    iget-object v0, p0, Lcom/qihuan/fanzhigame/PrivacyPolicyActivity$1;->this$0:Lcom/qihuan/fanzhigame/PrivacyPolicyActivity;

    const-class v1, Lcom/qihuan/fanzhigame/MainActivity;

    invoke-direct {p1, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 44
    iget-object v0, p0, Lcom/qihuan/fanzhigame/PrivacyPolicyActivity$1;->this$0:Lcom/qihuan/fanzhigame/PrivacyPolicyActivity;

    invoke-virtual {v0, p1}, Lcom/qihuan/fanzhigame/PrivacyPolicyActivity;->startActivity(Landroid/content/Intent;)V

    .line 47
    iget-object p1, p0, Lcom/qihuan/fanzhigame/PrivacyPolicyActivity$1;->this$0:Lcom/qihuan/fanzhigame/PrivacyPolicyActivity;

    invoke-virtual {p1}, Lcom/qihuan/fanzhigame/PrivacyPolicyActivity;->finish()V

    return-void
.end method
