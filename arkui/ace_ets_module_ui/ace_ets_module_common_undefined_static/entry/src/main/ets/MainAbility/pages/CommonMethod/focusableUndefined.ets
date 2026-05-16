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
  HorizontalAlign,
  TextInput,
  Text
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct FocusableExample {
  @State isFocusable: boolean |  undefined = false
  @State focusable2: boolean |  undefined = true

  build() {
    Column({ space: 10 } as ColumnOptions) {
      TextInput({text: 'Group1'})
        .width(165)
        .height(40)
        .fontColor(Color.Black)
        .focusable(this.isFocusable)
        .id('commonmethod_focusable')


      Text('Group1')
        .width(165)
        .height(40)
        .focusable(this.focusable2)
        .id('commonmethod_focusable2')

      Button('undefined: ' + this.isFocusable)
        .onClick(() => {
          this.isFocusable = this.isFocusable === undefined ? false : undefined
        })
        .id('button_focusable')
      Button('undefined: ' + this.focusable2)
        .onClick(() => {
          this.focusable2 = this.focusable2 === undefined ? true : undefined
        })
        .id('button_focusable2')
    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }
}