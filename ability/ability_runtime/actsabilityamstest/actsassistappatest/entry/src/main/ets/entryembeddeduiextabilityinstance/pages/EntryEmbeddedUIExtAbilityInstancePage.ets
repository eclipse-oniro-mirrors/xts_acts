@Entry
@Component
struct EntryEmbeddedUIExtAbilityInstancePage {
  @State message: string = 'EmbeddedUIExtAbility';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}