'use static'
import {
  Entry,
  Column,
  Component,
  Button,
  Flex,
  FlexAlign,
  Margin,
  ColumnOptions,
  HorizontalAlign,
  Color
} from '@ohos.arkui.component'
import { AttributeModifier, CommonAttribute } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
export class FocusButtonModifier implements AttributeModifier<CommonAttribute> {
  @State public change: boolean = true
  @State public buttonColor: string = '#87CEFA'

  applyNormalAttribute(instance: CommonAttribute): void {
    if (this.change) {
      instance.onBlur(() => {
        this.buttonColor = '#87CEFA'
      });
    } else {
      instance.onBlur(undefined);
    }
  }
}

@Entry
@Component
struct FocusEventExample {
  @State focusButtonModifier2: FocusButtonModifier = new FocusButtonModifier()
  @State focusButtonModifier4: FocusButtonModifier = new FocusButtonModifier()

  aboutToAppear() {
    this.focusButtonModifier2.change = true
    this.focusButtonModifier4.change = true
  }

  build() {
    Column({ space: 20 } as ColumnOptions) {
      Button('focusController1')
        .width(260)
        .height(70)
        .fontColor(Color.Black)
        .focusable(true)
        .onClick(() => {
          this.getUIContext().getFocusController().requestFocus('commonmethod_onBlurModifier4');
        })
        .id('commonmethod_onBlurModifier1')

      Button('focusController2')
        .width(260)
        .height(70)
        .fontColor(Color.Black)
        .focusable(true)
        .onClick(() => {
          this.getUIContext().getFocusController().requestFocus('commonmethod_onBlurModifier3');
        })
        .id('commonmethod_onBlurModifier2')

      Button('First Button')
        .width(260)
        .height(70)
        .fontColor(Color.Black)
        .focusable(true)
        .onFocus(() => {
          this.focusButtonModifier2.buttonColor = '#FFFFFF'
        })
        .backgroundColor(this.focusButtonModifier2.buttonColor)
        .attributeModifier(this.focusButtonModifier2)
        .id('commonmethod_onBlurModifier3')

      Button('Second Button')
        .width(260)
        .height(70)
        .fontColor(Color.Black)
        .focusable(true)
        .onFocus(() => {
          this.focusButtonModifier4.buttonColor = '#FFFFFF'
        })
        .backgroundColor(this.focusButtonModifier4.buttonColor)
        .attributeModifier(this.focusButtonModifier4)
        .id('commonmethod_onBlurModifier4')

      Button('undefined' + this.focusButtonModifier4.change)
        .width(260)
        .height(70)
        .fontColor(Color.Black)
        .onClick(() => {
          this.focusButtonModifier4.change = !this.focusButtonModifier4.change
        })
        .id('button_onBlurModifier')
    }
    .width('100%')
    .margin({ top: 20 } as Margin)
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }
}

