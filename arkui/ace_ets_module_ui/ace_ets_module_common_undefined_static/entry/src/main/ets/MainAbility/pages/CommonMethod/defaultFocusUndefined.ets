'use static'
import {
  Entry,
  Text,
  Column,
  Component,
  Button,
  FlexAlign,
  Margin,
  Row,
  ColumnOptions,
  HorizontalAlign,
  Color,
  RowOptions,
  BorderStyle,
  TextInput
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct FocusableExample {
  @State inputValue: string = '';

  // undefined
  build() {
    Row() {
      Column({ space: 20 } as ColumnOptions) {
        Column({ space: 5 } as ColumnOptions) {
          Button('Group1')
            .width(165)
            .height(40)
            .fontColor(Color.White)
          Row({ space: 5 } as RowOptions) {
            Button('1')
              .width(80)
              .height(40)
              .fontColor(Color.White)

            Button('2')
              .width(80)
              .height(40)
              .fontColor(Color.White)
          }
        }
        .borderWidth(2)
        .borderColor(Color.Red)
        .borderStyle(BorderStyle.Dashed)
        .tabIndex(1)

        Column({ space: 5 } as ColumnOptions) {
          Button('Group2')
            .width(165)
            .height(40)
            .fontColor(Color.White)
          Row({ space: 5 } as RowOptions) {
            Button('1')
              .width(80)
              .height(40)
              .fontColor(Color.White)
            Button('2')
              .width(80)
              .height(40)
              .fontColor(Color.White)
          }
        }
        .borderWidth(2)
        .borderColor(Color.Green)
        .borderStyle(BorderStyle.Dashed)
        .tabIndex(2)
      }

      Column({ space: 20 } as ColumnOptions) {
        Column({ space: 5 } as ColumnOptions) {
          Button('Group1')
            .width(165)
            .height(40)
            .fontColor(Color.White)
          Row({ space: 5 } as RowOptions) {
            Button('1')
              .width(80)
              .height(40)
              .fontColor(Color.White)
            Button('2')
              .width(80)
              .height(40)
              .fontColor(Color.White)
          }
        }
        .borderWidth(2)
        .borderColor(Color.Orange)
        .borderStyle(BorderStyle.Dashed)
        .tabIndex(3)

        Column({ space: 5 } as ColumnOptions) {
          TextInput({ placeholder: 'input', text: this.inputValue })
            .onChange((value: string) => {
              this.inputValue = value
            })
            .width(156)
            .defaultFocus(undefined)
            .id('commonmethod_defaultFocus')
          Button('Group2')
            .width(165)
            .height(40)
            .fontColor(Color.White)
          Row({ space: 5 } as RowOptions) {
            Button('1')
              .width(80)
              .height(40)
              .fontColor(Color.White)
            Button('2')
              .width(80)
              .height(40)
              .fontColor(Color.White)
          }
        }
        .borderWidth(2)
        .borderColor(Color.Blue)
        .borderStyle(BorderStyle.Dashed)
        .tabIndex(4)
      }
      .width('100%')
      .alignItems(HorizontalAlign.Center)
      .justifyContent(FlexAlign.Center)
    }
    .justifyContent(FlexAlign.SpaceAround)
  }
}