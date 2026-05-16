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
  public fontFamily: string | undefined = undefined;

  applyNormalAttribute(instance: TextTimerAttribute): void {
    instance.fontFamily(this.fontFamily)
  }
}

@Entry
@Component
struct TextPickerExample {
  textTimerController: TextTimerController = new TextTimerController();
  @State TextTimerModifier4: TextTimerModifier = new TextTimerModifier()

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

      Button('切换 fontFamily → ' +
        (this.TextTimerModifier4.fontFamily === undefined ? 'undefined' : 'sans-serif'))
        .height('5%')
        .onClick(() => {
          this.TextTimerModifier4.fontFamily =
            this.TextTimerModifier4.fontFamily === undefined ? 'sans-serif' : undefined
        }).margin({ top: 5 } as Margin)
        .id('changeButton')

      TextTimer({ controller: this.textTimerController })
        .attributeModifier(this.TextTimerModifier4)
        .id('TestText_timerFontFamilyModifier')
    }
    .width('100%')
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }
}