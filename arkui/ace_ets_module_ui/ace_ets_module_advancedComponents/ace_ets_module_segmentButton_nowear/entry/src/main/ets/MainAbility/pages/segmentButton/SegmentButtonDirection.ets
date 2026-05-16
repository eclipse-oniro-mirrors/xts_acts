import { SegmentButton, SegmentButtonOptions } from '@ohos.arkui.advanced.SegmentButton';
import { LengthMetrics } from '@ohos.arkui.node';

@Entry
@Component
struct SegmentButtonDirection {
  @State currentDirection?: Direction = Direction.Auto
  @State tabOptions: SegmentButtonOptions = SegmentButtonOptions.tab({
    direction: this.currentDirection,
    buttons: [{ text: '页签按钮1' }, { text: '页签按钮2' }, {
      text: '页签按钮3'
    }],
    localizedTextPadding: { start: LengthMetrics.vp(10), end: LengthMetrics.vp(5) },
    backgroundBlurStyle: BlurStyle.BACKGROUND_THICK
  })
  @State singleSelectCapsuleOptions: SegmentButtonOptions = SegmentButtonOptions.capsule({
    direction: this.currentDirection,
    selectedBackgroundColor: Color.Red,
    buttons: [{ text: '单选按钮a' }, { text: '单选按钮b' }, { text: '单选按钮c' }],
    localizedTextPadding: { start: LengthMetrics.vp(10), end: LengthMetrics.vp(5) },
    multiply: false,
    backgroundBlurStyle: BlurStyle.BACKGROUND_THICK
  })
  @State multiSelectCapsuleOptions: SegmentButtonOptions = SegmentButtonOptions.capsule({
    direction: this.currentDirection,
    selectedBackgroundColor: Color.Red,
    buttons: [{ text: '多选按钮1' }, { text: '多选按钮1' }, { text: '多选按钮3' }],
    localizedTextPadding: { start: LengthMetrics.vp(5), end: LengthMetrics.vp(5) },
    multiply: true,
    backgroundBlurStyle: BlurStyle.BACKGROUND_THICK
  })
  @State singleSelectIconCapsuleOptions: SegmentButtonOptions = SegmentButtonOptions.capsule({
    direction: this.currentDirection,
    buttons: [
      { icon: $r('sys.media.ohos_ic_public_email'), selectedIcon: $r('sys.media.ohos_ic_public_clock') },
      { icon: $r('sys.media.ohos_ic_public_email'), selectedIcon: $r('sys.media.ohos_ic_public_clock') },
      { icon: $r('sys.media.ohos_ic_public_email'), selectedIcon: $r('sys.media.ohos_ic_public_clock') },
      { icon: $r('sys.media.ohos_ic_public_email'), selectedIcon: $r('sys.media.ohos_ic_public_clock') },
      { icon: $r('sys.media.ohos_ic_public_email'), selectedIcon: $r('sys.media.ohos_ic_public_clock') }
    ],
    localizedButtonPadding: { start: LengthMetrics.vp(5), end: LengthMetrics.vp(15) },
    multiply: false,
    backgroundBlurStyle: BlurStyle.BACKGROUND_THICK
  })
  @State multiSelectIconTextCapsuleOptions: SegmentButtonOptions = SegmentButtonOptions.capsule({
    direction: this.currentDirection,
    buttons: [
      { text: '图标1', icon: $r('sys.media.ohos_ic_public_email'), selectedIcon: $r('sys.media.ohos_ic_public_clock') },
      { text: '图标2', icon: $r('sys.media.ohos_ic_public_email'), selectedIcon: $r('sys.media.ohos_ic_public_clock') },
      { text: '图标3', icon: $r('sys.media.ohos_ic_public_email'), selectedIcon: $r('sys.media.ohos_ic_public_clock') },
      { text: '图标4', icon: $r('sys.media.ohos_ic_public_email'), selectedIcon: $r('sys.media.ohos_ic_public_clock') },
      { text: '图标5', icon: $r('sys.media.ohos_ic_public_email'), selectedIcon: $r('sys.media.ohos_ic_public_clock') }
    ],
    localizedButtonPadding: { start: LengthMetrics.vp(5), end: LengthMetrics.vp(15) },
    multiply: true
  })
  @State tabSelectedIndexes: number[] = [1]
  @State singleSelectCapsuleSelectedIndexes: number[] = [0]
  @State multiplySelectCapsuleSelectedIndexes: number[] = [0, 1]
  @State singleSelectIconCapsuleSelectedIndexes: number[] = [0]
  @State multiplySelectIconTextCapsuleSelectedIndexes: number[] = [1]

  build() {
    Row() {
      Column() {
        Column({ space: 25 }) {

          Row() {

            Button('Auto').id('Auto').onClick(() => {
              this.currentDirection = Direction.Auto
              this.tabOptions.direction = Direction.Auto
              this.singleSelectCapsuleOptions.direction = Direction.Auto
              this.multiSelectCapsuleOptions.direction = Direction.Auto
              this.singleSelectIconCapsuleOptions.direction = Direction.Auto
              this.multiSelectIconTextCapsuleOptions.direction = Direction.Auto
            }).backgroundColor(this.currentDirection == Direction.Auto ? Color.Red : Color.Blue)
            Button('Rtl').id('Rtl').onClick(() => {
              this.currentDirection = Direction.Rtl
              this.tabOptions.direction = Direction.Rtl
              this.singleSelectCapsuleOptions.direction = Direction.Rtl
              this.multiSelectCapsuleOptions.direction = Direction.Rtl
              this.singleSelectIconCapsuleOptions.direction = Direction.Rtl
              this.multiSelectIconTextCapsuleOptions.direction = Direction.Rtl
            }).backgroundColor(this.currentDirection == Direction.Rtl ? Color.Red : Color.Blue)
            Button('Ltr').id('Ltr').onClick(() => {
              this.currentDirection = Direction.Ltr
              this.tabOptions.direction = Direction.Ltr
              this.singleSelectCapsuleOptions.direction = Direction.Ltr
              this.multiSelectCapsuleOptions.direction = Direction.Ltr
              this.singleSelectIconCapsuleOptions.direction = Direction.Ltr
              this.multiSelectIconTextCapsuleOptions.direction = Direction.Ltr
            }).backgroundColor(this.currentDirection == Direction.Ltr ? Color.Red : Color.Blue)

          }
          .height('3%')

          Row() {
            Button('LocalizedTextPadding').id('textPadding').onClick(() => {
              this.tabOptions.localizedTextPadding = {
                start: LengthMetrics.vp(5), end: LengthMetrics.vp(15)
              }
              this.singleSelectCapsuleOptions.localizedTextPadding = {
                start: LengthMetrics.vp(5), end: LengthMetrics.vp(15)
              }
            })

            Button('LocalizedButtonPadding').id('buttonPadding').onClick(() => {
              this.singleSelectIconCapsuleOptions.localizedButtonPadding =
                { start: LengthMetrics.vp(15), end: LengthMetrics.vp(5) }
              this.multiSelectIconTextCapsuleOptions.localizedButtonPadding =
                { start: LengthMetrics.vp(15), end: LengthMetrics.vp(5) }
            })
          }
          .height('3%')



          SegmentButton({
            options: this.tabOptions,
            selectedIndexes: $tabSelectedIndexes
          })

          SegmentButton({
            options: this.singleSelectCapsuleOptions,
            selectedIndexes: $singleSelectCapsuleSelectedIndexes
          })

          SegmentButton({
            options: this.multiSelectCapsuleOptions,
            selectedIndexes: $singleSelectCapsuleSelectedIndexes
          })

          SegmentButton({
            options: this.singleSelectIconCapsuleOptions,
            selectedIndexes: $singleSelectIconCapsuleSelectedIndexes
          })

          SegmentButton({
            options: this.multiSelectIconTextCapsuleOptions,
            selectedIndexes: $multiplySelectIconTextCapsuleSelectedIndexes
          })

        }.width('90%')
      }.width('100%')
    }
    .height('80%')
    .padding({top: '2%', bottom: '2%'})
  }
}