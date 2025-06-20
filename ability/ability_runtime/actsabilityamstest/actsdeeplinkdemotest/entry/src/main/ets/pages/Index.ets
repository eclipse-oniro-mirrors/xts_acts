@Entry
@Component
struct Index {
  @State message: string = '我就是action';

  build() {
    RelativeContainer() {
      Text(this.message)
        .id('action')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
    }
    .height('100%')
    .width('100%')
  }
}