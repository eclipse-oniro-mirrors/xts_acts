import { ImageModifier } from '@kit.ArkUI'

@Entry
@Component
struct ImageHdrBrightness {
  @State hdrBrightnessValue: number | null | undefined = 0.0

  build() {
    Column({space: 8}) {
      Text('hdrBrightness属性测试')
      Row() {
        Image($r('app.media.flower'))
          .width('32%')
          .aspectRatio(1)
          .hdrBrightness(this.hdrBrightnessValue)
          .key('hdrImageKey')
        Image($r('app.media.flower'))
          .width('32%')
          .aspectRatio(1)
          .key('noHdrBrightnessImageKey')
      }

      Flex({ wrap: FlexWrap.Wrap, alignContent: FlexAlign.Center }) {
        Button('0.0')
          .id('hdr00')
          .onClick(() => {
            this.hdrBrightnessValue = 0.0
          })
        Button('0.3')
          .id('hdr03')
          .onClick(() => {
            this.hdrBrightnessValue = 0.3
          })
        Button('0.8')
          .id('hdr08')
          .onClick(() => {
            this.hdrBrightnessValue = 0.8
          })
        Button('1.0')
          .id('hdr10')
          .onClick(() => {
            this.hdrBrightnessValue = 1.0
          })
        Button('-1')
          .id('hdr_1')
          .onClick(() => {
            this.hdrBrightnessValue = -1
          })
        Button('2')
          .id('hdr20')
          .onClick(() => {
            this.hdrBrightnessValue = 2
          })
        Button('null')
          .id('hdrNull')
          .onClick(() => {
            this.hdrBrightnessValue = null
          })
        Button('undefined')
          .id('hdrUndefined')
          .onClick(() => {
            this.hdrBrightnessValue = undefined
          })
      }
    }.width('100%').padding({right: 10, top: 10})
    .height('100%')
  }
}
