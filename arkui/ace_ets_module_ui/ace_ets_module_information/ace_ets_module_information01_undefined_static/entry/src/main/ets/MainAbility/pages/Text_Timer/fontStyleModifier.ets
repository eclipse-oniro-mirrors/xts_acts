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
  public fontStyle: FontStyle | undefined = undefined;

  applyNormalAttribute(instance: TextTimerAttribute): void {
    instance.fontStyle(this.fontStyle)
  }
}

@Entry
@Component
struct TextPickerExample {
  textTimerController: TextTimerController = new TextTimerController();
  @State TextTimerModifier4: TextTimerModifier = new TextTimerModifier()

  aboutToAppear() {
    this.TextTimerModifier4.fontStyle = FontStyle.Italic
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

      Button('切换 fontStyle → ' + (this.TextTimerModifier4.fontStyle === undefined ? 'undefined' : 'FontStyle.Italic'))
        .height('5%')
        .onClick(() => {
          this.TextTimerModifier4.fontStyle =
            this.TextTimerModifier4.fontStyle === undefined ? FontStyle.Italic : undefined
        }).margin({ top: 5 } as Margin)
        .id('changeButton')

      TextTimer({controller: this.textTimerController })
        .attributeModifier(this.TextTimerModifier4)
        .id('TestText_timerfontStyleModifier')
    }
    .width('100%')
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }
}