'use static'
import {
  Entry,
  Column,
  Component,
  Button,
  ColumnOptions,
  HorizontalAlign,
  Color,
  FlexAlign
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct FocusableExample {
  @State isTabIndex: Int | undefined = 3

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Button('Group1')
        .width(165)
        .height(40)
        .fontColor(Color.White)
        .tabIndex(4)

      Button('Group2')
        .width(165)
        .height(40)
        .fontColor(Color.White)
        .tabIndex(undefined)

      Button('Group3')
        .width(165)
        .height(40)
        .fontColor(Color.White)

      Button('Group4')
        .width(165)
        .height(40)
        .fontColor(Color.White)
        .tabIndex(2)

      Button('Group5')
        .width(165)
        .height(40)
        .fontColor(Color.White)
        .tabIndex(1)

      Button('undefined: ' + this.isTabIndex)
        .backgroundColor(0x317aff)
        .tabIndex(this.isTabIndex)
        .id('common_tabIndex')

      Button('Click to change tabIndex')
        .backgroundColor(0x317aff)
        .onClick(() => {
          this.isTabIndex = this.isTabIndex === undefined ? 3 : undefined
        })
        .id('button_tabIndex')
    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }
}