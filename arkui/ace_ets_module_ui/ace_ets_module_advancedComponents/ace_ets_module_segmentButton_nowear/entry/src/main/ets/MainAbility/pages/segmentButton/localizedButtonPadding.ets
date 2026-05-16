import { SegmentButton, SegmentButtonOptions } from '@ohos.arkui.advanced.SegmentButton';
import { LengthMetrics, } from '@ohos.arkui.node';
@Entry
@Component
struct Index {
  @State mBtn: string = 'start_init'
  @State mBtn2: string = 'end_init'
  @State singleSelectIconCapsuleSelectedIndexes: number[] = [3]
  @State iconCapsuleOptions: SegmentButtonOptions = SegmentButtonOptions.capsule({
    buttons: [
      { icon: $r('sys.media.ohos_ic_public_email'), selectedIcon: $r('sys.media.ohos_ic_public_clock') },
      { icon: $r('sys.media.ohos_ic_public_email'), selectedIcon: $r('sys.media.ohos_ic_public_clock') },
      { icon: $r('sys.media.ohos_ic_public_email'), selectedIcon: $r('sys.media.ohos_ic_public_clock') },
      { icon: $r('sys.media.ohos_ic_public_email'), selectedIcon: $r('sys.media.ohos_ic_public_clock') },
    ],
    multiply: false,
    direction: Direction.Auto,
    imageSize: { width: 40, height: 40 },
    localizedButtonPadding: {
      end: LengthMetrics.vp(10),
      start: LengthMetrics.vp(20)
    },
    backgroundBlurStyle: BlurStyle.BACKGROUND_THICK
  })

  build() {
    Row() {
      Column() {
        Column({ space: 20 }) {
          Button(this.mBtn)
            .id('localizedButtonPadding_start')
            .onClick(() => {
              this.mBtn = 'start:' + JSON.stringify(this.iconCapsuleOptions.localizedButtonPadding?.start)
            })
          Button(this.mBtn2)
            .id('localizedButtonPadding_end')
            .onClick(() => {
              this.mBtn2 = 'end:' + JSON.stringify(this.iconCapsuleOptions.localizedButtonPadding?.end)
            }).margin(20)
          SegmentButton({
            options: this.iconCapsuleOptions,
            selectedIndexes: $singleSelectIconCapsuleSelectedIndexes
          })
        }.width('90%')
      }.width('100%')
    }.height('100%')
  }
}