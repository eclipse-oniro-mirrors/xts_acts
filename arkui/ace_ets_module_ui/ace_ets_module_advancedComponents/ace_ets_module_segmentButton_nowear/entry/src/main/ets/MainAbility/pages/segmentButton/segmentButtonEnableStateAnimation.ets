import {
  ItemRestriction,
  SegmentButton,
  SegmentButtonOptions,
  SegmentButtonTextItem
} from '@kit.ArkUI';

@Entry
@Component
struct Index11 {
  @State tabOptions: SegmentButtonOptions = SegmentButtonOptions.tab({
    buttons: [
      { text: '页签按钮1' }, { text: '页签按钮2' }, { text: '页签按钮3' }
    ] as ItemRestriction<SegmentButtonTextItem>
  });

  @State tabSelected: number[] = [];
  @State tabSelected2: number[] = [];

  enableStateAnimation: (boolean | undefined)[] = [false, true, undefined];
  @State enableStateAnimationIndex: number = 0;

  build() {
    Row() {
      Column() {
        Column({ space: 25 }) {
          SegmentButton({
            options: this.tabOptions,
            selectedIndexes: this.tabSelected
          })

          Row({ space: 10 }) {
            Button('false')
              .onClick(() => {
                this.enableStateAnimationIndex = 0;
              })

            Button('true').key('true')
              .onClick(() => {
                this.enableStateAnimationIndex = 1;
              })

            Button('undefined')
              .onClick(() => {
                this.enableStateAnimationIndex = 2;
              })
          }
          .width('100%')
          .justifyContent(FlexAlign.Center)
          .margin({ bottom: 10 })

          SegmentButton({
            options: this.tabOptions,
            selectedIndexes: this.tabSelected2,
            enableStateAnimation: this.enableStateAnimation[this.enableStateAnimationIndex]
          })
          Text('' + this.enableStateAnimation[this.enableStateAnimationIndex]).fontSize(18).fontWeight(FontWeight.Bold).key('text1')
          Row({ space: 10 }) {
            Button('push 1')
              .onClick(() => {
                this.tabSelected = [0];
                this.tabSelected2 = [0];
              })

            Button('push 2')
              .onClick(() => {
                this.tabSelected = [1];
                this.tabSelected2 = [1];
              })

            Button('push 3')
              .onClick(() => {
                this.tabSelected = [2];
                this.tabSelected2 = [2];
              })
          }
          .width('100%')
          .justifyContent(FlexAlign.Center)
          .margin({ bottom: 10 })
        }.width('90%')
      }.width('100%')
    }.height('100%')
  }
}