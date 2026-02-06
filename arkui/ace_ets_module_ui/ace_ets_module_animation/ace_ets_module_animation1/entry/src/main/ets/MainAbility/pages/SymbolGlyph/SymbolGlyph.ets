@Entry
@Component
struct Index {
  @State isActive: boolean = true;
  @State isActive2: boolean = true;
  @State isActive3: boolean = true;
  @State triggerValueReplace: number = 0;
  replaceFlag: boolean = true;

  build() {
    Row() {
      Column() {
        Column() {
          Text("AppearSymbolEffect:" + this.isActive)
            .id("AppearSymbolEffect")
          SymbolGlyph($r("sys.symbol.ohos_wifi"))
            .fontSize(96)
            .symbolEffect(new AppearSymbolEffect(EffectScope.LAYER), this.isActive)
          Button(this.isActive ? "关闭" : "播放").onClick(() => {
            this.isActive = !this.isActive;
          })
        }
        Column() {
          Text("DisappearSymbolEffect:" + this.isActive2)
            .id("DisappearSymbolEffect")
          SymbolGlyph($r("sys.symbol.ohos_wifi"))
            .fontSize(96)
            .symbolEffect(new DisappearSymbolEffect(EffectScope.LAYER), this.isActive)
          Button(this.isActive2 ? "关闭" : "播放").onClick(() => {
            this.isActive2 = !this.isActive2;
          })
        }
        Column() {
          Text("ReplaceSymbolEffect:" + this.replaceFlag)
            .id("ReplaceSymbolEffect")
          SymbolGlyph(this.replaceFlag ? $r("sys.symbol.checkmark_circle") : $r("sys.symbol.repeat_1"))
            .fontSize(96)
            .symbolEffect(new ReplaceSymbolEffect(EffectScope.WHOLE), this.triggerValueReplace)
          Button("trigger").onClick(() => {
            this.replaceFlag = !this.replaceFlag;
            this.triggerValueReplace = this.triggerValueReplace + 1;
          })
        }
        Column() {
          Text("BounceSymbolEffect:" + this.isActive3)
            .id("BounceSymbolEffect")
          SymbolGlyph($r("sys.symbol.ohos_wifi"))
            .fontSize(96)
            .symbolEffect(new BounceSymbolEffect(EffectScope.LAYER, EffectDirection.DOWN), this.isActive)
          Button(this.isActive3 ? "关闭" : "播放").onClick(() => {
            this.isActive3 = !this.isActive3;
          })
        }
      }.width("100%")
    }.height("100%")
  }
}