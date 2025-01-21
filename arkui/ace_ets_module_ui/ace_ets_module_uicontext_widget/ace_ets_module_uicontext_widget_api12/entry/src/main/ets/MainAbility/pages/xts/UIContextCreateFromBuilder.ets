import image from '@ohos.multimedia.image'
import { UIContext } from '@ohos.arkui.UIContext';
import hilog from '@ohos.hilog';
import componentSnapshot from '@ohos.arkui.componentSnapshot'

@Entry
@Component
struct UIContextCreateFromBuilder {
  @State pixmap_2: image.PixelMap | undefined = undefined
  @State pixmap_text_3: string = ''
  @State pixmap_text_4: string = ''
  uiContext: UIContext = this.getUIContext();

  @Builder
  GaugeBuilder() {
    Gauge({ value: 30, min: 0, max: 100 })
      .startAngle(210)
      .endAngle(150)
      .colors([[0x317AF7, 0.1], [0x5BA854, 0.2], [0xE08C3A, 0.3], [0x9C554B, 0.4]])
      .strokeWidth(20)
      .width(200)
      .height(200)
  }

  build() {
    Column() {
      Row() {
        Column({ space: 5 }) {
          Button('新增Builder：Gauge图片')
            .onClick(() => {
              this.uiContext.getComponentSnapshot().createFromBuilder(() => {
                this.GaugeBuilder()
              },
                (error: Error, pixmap: image.PixelMap) => {
                  if (error) {
                    hilog.error(0x0000, 'testTag', 'getComponentSnapshot pixmap_text_3 error %{public}s', JSON.stringify(error) ?? '');
                    return;
                  }
                  this.pixmap_2 = pixmap
                  console.info('UIContextComponentSnapshot pixmap_text_3 start')
                  this.pixmap_text_3 = 'snapshot'
                })
            }).width('90%').margin(10).id('getComponentSnapshot_03')
          Button('新增：Gauge图片')
            .onClick(() => {
              this.uiContext.getComponentSnapshot()
                .createFromBuilder(() => {
                  this.GaugeBuilder()
                })
                .then((pixmap: image.PixelMap) => {
                  this.pixmap_2 = pixmap
                  console.info('UIContextComponentSnapshot pixmap_text_4 start')
                  this.pixmap_text_4 = 'snapshot'
                })
                .catch((err: Error) => {
                  hilog.error(0x0000, 'testTag', 'getComponentSnapshot pixmap_text_4 error %{public}s', JSON.stringify(err) ?? '');
                })
            }).width('90%').margin(10).id('getComponentSnapshot_04')
          Image(this.pixmap_2)
            .margin(10)
            .height(200)
            .width(200)
            .border({ color: Color.Black, width: 2 })
          Text('' + this.pixmap_text_3).fontColor(0x000000)
            .fontSize(16).width('90%').key('key_getComponentSnapshot_text_03')
          Text('' + this.pixmap_text_4).fontColor(0x000000)
            .fontSize(16).width('90%').key('key_getComponentSnapshot_text_04')
        }.width('100%')
      }

    }.width('100%').margin({ left: 10, top: 5, bottom: 5 }).height(300)
  }
}