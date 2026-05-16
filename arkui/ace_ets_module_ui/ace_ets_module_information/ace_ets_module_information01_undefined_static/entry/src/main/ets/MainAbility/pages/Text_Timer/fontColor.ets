import {
  Builder,
  Stack,
  Entry,
  Component,
  Column,
  Row,
  TextTimer,
  TextTimerController,
  Color,
  Button,
  Margin,
  $rawfile,
  Text,
  ColumnOptions,
  HorizontalAlign,
  FlexAlign
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextTimerExample {
  textTimerController: TextTimerController = new TextTimerController();
  @State fontColor: Color | undefined = Color.Red;

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Row() {
        Button('start').onClick(() => {
          this.textTimerController.start();
        }).margin({ top: 5 } as Margin)
        Button('pause').onClick(() => {
          this.textTimerController.pause();
        }).margin({ top: 5 } as Margin)
        Button('reset').onClick(() => {
          this.textTimerController.reset();
        }).margin({ top: 5 } as Margin)
      }

      Button('切换 fontColor → undefined')
        .height('5%')
        .onClick(() => {
          this.fontColor = undefined
        }).margin({ top: 5 } as Margin)
        .id('changeButton')

      TextTimer()
        .fontColor(undefined)
        .id('TestText_timerOrigin')

      TextTimer({ controller: this.textTimerController })
        .fontColor(this.fontColor)
        .id('TestText_timerFontColor')
    }
    .width('100%')
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }
}