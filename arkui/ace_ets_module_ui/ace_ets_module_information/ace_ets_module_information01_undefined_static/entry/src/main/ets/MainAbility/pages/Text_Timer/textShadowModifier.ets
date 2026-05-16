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
  public textShadows: ShadowOptions | Array<ShadowOptions> | undefined = undefined;

  applyNormalAttribute(instance: TextTimerAttribute): void {
    instance.textShadow(this.textShadows)
  }
}

@Entry
@Component
struct TextPickerExample {
  textTimerController: TextTimerController = new TextTimerController();
  @State TextTimerModifier4: TextTimerModifier = new TextTimerModifier()

  aboutToAppear() {
    this.TextTimerModifier4.textShadows = {
      radius: 10,
      color: Color.Red,
      offsetX: 10,
      offsetY: 0
    } as ShadowOptions
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

      Button('切换 textShadows → ' +
        (this.TextTimerModifier4.textShadows === undefined ? 'undefined' : 'ShadowOptions'))
        .height('5%')
        .onClick(() => {
          this.TextTimerModifier4.textShadows = undefined
        }).margin({ top: 5 } as Margin)
        .id('changeButton')

      TextTimer({ controller: this.textTimerController })
        .attributeModifier(this.TextTimerModifier4)
        .id('TestText_timertextShadowModifier')
    }
    .width('100%')
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }
}