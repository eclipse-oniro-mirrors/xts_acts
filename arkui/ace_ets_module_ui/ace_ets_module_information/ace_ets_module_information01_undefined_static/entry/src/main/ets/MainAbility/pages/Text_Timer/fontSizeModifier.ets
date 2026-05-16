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
import { AttributeModifier, CommonAttribute, TextTimerAttribute } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
export class TextTimerModifier implements AttributeModifier<TextTimerAttribute> {
  public fontSize: number | undefined = 50;

  applyNormalAttribute(instance: TextTimerAttribute): void {
    instance.fontSize(this.fontSize)
  }
}

@Entry
@Component
struct TextPickerExample {
  textTimerController: TextTimerController = new TextTimerController();
  @State TextTimerModifier4: TextTimerModifier = new TextTimerModifier()

  aboutToAppear() {
    this.TextTimerModifier4.fontSize = 50.0
  }

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

      Button('切换 fontSize → ' + (this.TextTimerModifier4.fontSize === undefined ? 'undefined' : '50'))
        .height('5%')
        .onClick(() => {
          this.TextTimerModifier4.fontSize =
            this.TextTimerModifier4.fontSize === undefined ? 50.0 : undefined
        }).margin({ top: 5 } as Margin)
        .id('changeButton')

      TextTimer({controller: this.textTimerController })
        .attributeModifier(this.TextTimerModifier4)
        .id('TestText_timerFontSizeModifier')
    }
    .width('100%')
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }
}