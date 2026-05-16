'use static'
import {
  Stack,
  Entry,
  Component,
  Column,
  Row,
  Button,
  ForEach,
  Text,
  TextAlign,
  BarState,
  Color,
  Margin,
  List,
  ListItem
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct ListPage {
  @State arr: String[] = ['0', '1', '2', '3', '4', '5', '6'];
  @State barState: BarState | undefined = BarState.On;

  build() {
    Stack() {
      List() {
        ForEach(this.arr, (item: string) => {
          ListItem() {
            Text('item' + item)
              .width('90%')
              .height('20%')
              .borderRadius(15)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .focusable(true)
              .focusOnTouch(true)
          }
        }, (item: string) => item)
      }
      .scrollBar(this.barState)
      .id('common_scrollBar')

      Column() {
        Button('切换 barState → ' + (this.barState === undefined ? 'undefined' : 'On'))
          .height('5%')
          .onClick(() => {
            this.barState = this.barState === undefined ? BarState.On : undefined
          }).margin({ top: 5 } as Margin)
          .id('button_scrollBar')
      }
    }.width('100%').height('100%')
  }
}