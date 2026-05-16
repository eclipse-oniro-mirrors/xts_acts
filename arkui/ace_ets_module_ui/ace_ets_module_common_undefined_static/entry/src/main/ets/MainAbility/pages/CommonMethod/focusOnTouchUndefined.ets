'use static'
import {
  Entry,
  Column,
  Component,
  Button,
  Color,
  FlexAlign,
  Margin,
  ColumnOptions,
  HorizontalAlign
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct FocusableExample {
  @State isFocusOnTouch: boolean | undefined = true

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Button('Group')
        .width(165)
        .height(40)
        .fontColor(Color.White)
        .focusOnTouch(this.isFocusOnTouch)
        .id('commonmethod_focusOnTouch')
      Button('undefined: ' + this.isFocusOnTouch)
        .onClick(() => {
          this.isFocusOnTouch = this.isFocusOnTouch === undefined ? true : undefined
        })
        .id('button_focusOnTouch')
    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }
}