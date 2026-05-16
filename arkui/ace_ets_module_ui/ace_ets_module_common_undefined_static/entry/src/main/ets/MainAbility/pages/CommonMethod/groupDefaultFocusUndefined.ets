'use static'
import {
  Entry,
  Column,
  Component,
  Button,
  Color,
  FlexAlign,
  ColumnOptions,
  HorizontalAlign,
  Row,
  RowOptions,
  BorderStyle
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct FocusableExample {
  @State isGroupDefaultFocus: boolean | undefined = true

  build() {
    Row() {
      Column({ space: 20 } as ColumnOptions) {
        Column({ space: 5 } as ColumnOptions) {
          Button('Group1')
            .width(165)
            .height(40)
            .fontColor(Color.White)
          Button('undefined: ' + this.isGroupDefaultFocus)
            .onClick(() => {
              this.isGroupDefaultFocus = this.isGroupDefaultFocus === undefined ? true : undefined
            })
            .id('button_groupDefaultFocus')
          Row({ space: 5 } as RowOptions) {
            Button('1')
              .width(80)
              .height(40)
              .fontColor(Color.White)
            Button('2')
              .width(80)
              .height(40)
              .fontColor(Color.White)
              .groupDefaultFocus(this.isGroupDefaultFocus)
              .id('commonmethod_groupDefaultFocus')
          }
        }
        .borderWidth(2)
        .borderColor(Color.Blue)
        .borderStyle(BorderStyle.Dashed)
        .tabIndex(1)
      }
      .width('100%')
      .alignItems(HorizontalAlign.Center)
      .justifyContent(FlexAlign.Center)
    }
    .justifyContent(FlexAlign.SpaceAround)
  }
}