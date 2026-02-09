@Entry
@Component
struct Index {
  build() {
    Column() {
      Text('Test Running...')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}
