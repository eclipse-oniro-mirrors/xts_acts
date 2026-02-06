@Entry
@Component
struct EntryEmbeddedUIExtAbility3Page {
  @State message: string = 'EmbeddedUIExtAbility';
aboutToAppear(): void {
  console.log('EmbeddedAbility3 create')
}
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