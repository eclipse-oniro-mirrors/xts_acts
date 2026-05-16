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
  public change: boolean | undefined = true;
  public text: String = ''
  public flag: boolean = true

  applyNormalAttribute(instance: TextTimerAttribute): void {
    if (this.change) {
      instance.onTimer((utc: Long, elapsedTime: Long) => {
        if (this.flag) {
          this.text += '1'
          this.flag = !this.flag
        }
      })
    } else {
      instance.onTimer(undefined)
    }
  }
}

@Entry
@Component
struct TextPickerExample {
  textTimerController: TextTimerController = new TextTimerController();
  @State TextTimerModifier4: TextTimerModifier = new TextTimerModifier()

  aboutToAppear() {
    this.TextTimerModifier4.change = true
  }

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Row() {
        Button('start').onClick(() => {
          this.textTimerController.start();
        }).margin({ top: 5 } as Margin)
          .id('startModifier')
        Button('pause').onClick(() => {
          this.textTimerController.pause();
        }).margin({ top: 5 } as Margin)
          .id('pauseModifier')
        Button('reset').onClick(() => {
          this.textTimerController.reset();
        }).margin({ top: 5 } as Margin)
      }

      Text(this.TextTimerModifier4.text)
        .id('TestText')
      Button('切换 onTimer → ' + this.TextTimerModifier4.change)
        .height('5%')
        .onClick(() => {
          this.TextTimerModifier4.change = !this.TextTimerModifier4.change
          this.TextTimerModifier4.flag != this.TextTimerModifier4.flag
        })
        .id('changeButton')

      TextTimer({ controller: this.textTimerController })
        .attributeModifier(this.TextTimerModifier4)
    }
    .width('100%')
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }
}