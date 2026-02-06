import { SegmentButton, SegmentButtonOptions } from '@ohos.arkui.advanced.SegmentButton';
import { LengthMetrics, } from '@ohos.arkui.node';
@Entry
@Component
struct Index {
  @State tabOptions: SegmentButtonOptions = SegmentButtonOptions.tab({
    buttons: [{ text: '页签按钮1' }, { text: '页签按钮2' }, {
      text: '页签按钮3'
    }],
    direction: Direction.Auto,
    backgroundColor: Color.Green,
    selectedBackgroundColor: Color.Orange,
    localizedTextPadding: {
      end: LengthMetrics.vp(30),
      start: LengthMetrics.vp(20)
    },
  })
  @State tabSelectedIndexes: number[] = [1]
  @State mText: string = 'start_init'
  @State mText2: string = 'end_init'
  build() {
    Row() {
      Column() {
        Column({ space: 20 }) {
          Button(this.mText)
            .id('localizedTextPadding_start')
            .onClick(() => {
              this.mText = 'start:' + JSON.stringify(this.tabOptions.localizedTextPadding?.start)
            })
          Button(this.mText2)
            .id('localizedTextPadding_end')
            .onClick(() => {
              this.mText2 = 'end:' + JSON.stringify(this.tabOptions.localizedTextPadding?.end)
            }).margin(20)
          SegmentButton({ options: this.tabOptions, selectedIndexes: $tabSelectedIndexes })
        }.width('90%')
      }.width('100%')
    }.height('100%')
  }
}