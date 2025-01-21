// xxx.ets
import { UIContext } from '@ohos.arkui.UIContext';
import image from '@ohos.multimedia.image'
import hilog from '@ohos.hilog';
import componentSnapshot from '@ohos.arkui.componentSnapshot'

@Entry
@Component
struct UIContextComponentSnapshot {
  uiContext: UIContext = this.getUIContext();
  @State pixmap_2: image.PixelMap | undefined = undefined
  @State pixmap_text_1: string = ''
  @State pixmap_text_2: string = ''
  private scroller: Scroller = new Scroller()

  build() {
    Column({ space: 5 }) {
      Text('Component Snapshot').fontColor(0x000000).fontSize(16).width('90%')
      Scroll(this.scroller) {
        Column({ space: 5 }) {
          Gauge({ value: 30, min: 0, max: 100 })
            .id('snapshot_4')
            .startAngle(210)
            .endAngle(150)
            .colors([[0x317AF7, 0.1], [0x5BA854, 0.2], [0xE08C3A, 0.3], [0x9C554B, 0.4]])
            .strokeWidth(20)
            .width(200)
            .height(200)
        }
        .width('100%')
        .backgroundColor(0x13ff7e)
        .padding({ top: 5 })
      }
      .scrollable(ScrollDirection.Vertical) // 滚动方向纵向
      .scrollBar(BarState.On) // 滚动条常驻显示
      .scrollBarColor(Color.Gray) // 滚动条颜色
      .scrollBarWidth(10) // 滚动条宽度
      .friction(0.6)
      .height('35%')
      .edgeEffect(EdgeEffect.Fade)

      Text(`上面是要截取的图下面是所截的图`).fontColor(0x000000).fontSize(16).width('90%').margin(15)
      Row() {
        Column({ space: 5 }) {
          Button('新增Callback').onClick(() => { // 这里
            this.uiContext.getComponentSnapshot()
              .get('snapshot_4', (error: Error, pixmap: image.PixelMap) => {
                if (error) {
                  hilog.error(0x0000, 'testTag', 'getComponentSnapshot pixmap_text_1 error %{public}s', JSON.stringify(error) ?? '');
                  return;
                }
                this.pixmap_2 = pixmap
                console.info('UIContextComponentSnapshot pixmap_text_1 start')
                this.pixmap_text_1 = 'snapshot'
              })
          }).width('90%').margin(10).id('getComponentSnapshot_01')


          Button('新增Promise').onClick(() => { // 这里
            this.uiContext.getComponentSnapshot()
              .get('snapshot_4')
              .then((pixmap: image.PixelMap) => {
                this.pixmap_2 = pixmap
                console.info('UIContextComponentSnapshot pixmap_text_2 start')
                this.pixmap_text_2 = 'snapshot'
              })
              .catch((err: Error) => {
                console.log('error: ' + err)
                hilog.error(0x0000, 'testTag', '新增：更换图片getPromise pixmap_text_2 error %{public}s', JSON.stringify(err) ?? '');
              })
          }).width('90%').margin(10).id('getComponentSnapshot_02')
          Image(this.pixmap_2).width(200).height(200)
          Text('' + this.pixmap_text_1).fontColor(0x000000)
            .fontSize(16).width('90%').key('key_getComponentSnapshot_text_01')
          Text('' + this.pixmap_text_2).fontColor(0x000000)
            .fontSize(16).width('90%').key('key_getComponentSnapshot_text_02')
        }.width('100%')
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .padding({ top: 5 })
  }
}