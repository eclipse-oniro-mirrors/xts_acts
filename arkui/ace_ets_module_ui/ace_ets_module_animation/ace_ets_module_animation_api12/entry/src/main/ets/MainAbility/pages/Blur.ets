@Entry
@Component
struct Blur {
  build() {
    Column(){
      Row(){
        Text('foregroundBlurStyle').fontColor(Color.Black).fontWeight(FontWeight.Bold).width('100%').textAlign(TextAlign.Center)
          .fontSize(20)
      }.height('20%').width('100%').margin({bottom:20}).backgroundColor(Color.Red).foregroundBlurStyle(BlurStyle.Thin,
        { colorMode: ThemeColorMode.LIGHT, adaptiveColor: AdaptiveColor.DEFAULT, scale: 1.0 })
      .id('foregroundBlurStyleId')

      Row(){
        Text('blur').fontColor(Color.Black).fontWeight(FontWeight.Bold).width('100%').textAlign(TextAlign.Center)
          .fontSize(20)
      }.height('20%').width('100%').margin({bottom:20}).backgroundColor(Color.Red).blur(5, { grayscale: [10, 15]})
      .id('blurId')

      Row(){
        Text('backdropBlur').fontColor(Color.Black).fontWeight(FontWeight.Bold).width('100%').textAlign(TextAlign.Center)
          .fontSize(20)
      }.height('20%').width('100%').margin({bottom:20}).backgroundColor(Color.Red).backdropBlur(15, { grayscale: [5, 10]})
      .id('backdropBlurId')

    }.alignItems(HorizontalAlign.Center).width('100%')
  }
}
