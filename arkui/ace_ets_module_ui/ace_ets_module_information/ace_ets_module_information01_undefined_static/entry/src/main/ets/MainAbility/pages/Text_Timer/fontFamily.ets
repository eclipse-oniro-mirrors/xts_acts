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
  FontWeight,
  Margin,
  ShadowOptions,
  FontStyle,
  $rawfile,
  Text,
  ColumnOptions,
  HorizontalAlign,
  FlexAlign
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { ComponentContent } from '@kit.ArkUI'

@Entry
@Component
struct TextTimerExample {
  textTimerController: TextTimerController = new TextTimerController();
  @State fontFamily: string | undefined = 'sans-serif';

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Text('这是一个自定义字体')
        .fontSize(20)
        .fontFamily('sans-serif')
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

      Button('切换 fontFamily → undefined')
        .height('5%')
        .onClick(() => {
          this.fontFamily = undefined
        }).margin({ top: 5 } as Margin)
        .id('changeButton')

      TextTimer({ controller: this.textTimerController })
        .fontFamily(this.fontFamily)
        .id('TestText_timerFontFamily')
    }
    .width('100%')
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }
}