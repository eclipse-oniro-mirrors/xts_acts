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
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct FocusEventExample {
  @State oneButtonColor: string = '#0066FF'
  @State twoButtonColor: string = '#87CEFA'
  @State change: boolean = true

  build() {
    Column({ space: 20 } as ColumnOptions) {
      Button('focusController1')
        .width(260)
        .height(70)
        .fontColor(Color.Black)
        .focusable(true)
        .onClick(() => {
          this.getUIContext().getFocusController().requestFocus('commonmethod_onBlur4');
        })
        .id('commonmethod_onBlur1')
      Button('focusController2')
        .width(260)
        .height(70)
        .fontColor(Color.Black)
        .focusable(true)
        .onClick(() => {
          this.getUIContext().getFocusController().requestFocus('commonmethod_onBlur3');
        })
        .id('commonmethod_onBlur2')
      Button('First Button')
        .backgroundColor(this.oneButtonColor)
        .width(260)
        .height(70)
        .fontColor(Color.Black)
        .focusable(true)
        .onFocus(() => {
          this.oneButtonColor = '#FFFFFF'
        })
        .onBlur(() => {
          this.oneButtonColor = '#0066FF'
        })
        .id('commonmethod_onBlur3')
      Button('onBlur')
        .backgroundColor(this.twoButtonColor)
        .width(260)
        .height(70)
        .fontColor(Color.Black)
        .focusable(true)
        .onFocus(() => {
          this.twoButtonColor = '#FFFFFF'
        })
        .onBlur(this.change?() => {
          this.twoButtonColor = '#87CEFA'
        }:undefined)
        .id('commonmethod_onBlur4')
      Button('undefined' + this.change)
        .width(260)
        .height(70)
        .fontColor(Color.Black)
        .onClick(() => {
          this.change = !this.change
        })
        .id('button_onBlur')
    }
    .width('100%')
    .margin({ top: 20 } as Margin)
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }
}