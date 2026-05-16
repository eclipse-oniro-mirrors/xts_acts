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
  List,
  Color,
  Margin,
  ListItem
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct ListPage {
  @State arr: String[] = ['0', '1', '2', '3', '4', '5', '6'];
  @State fling: Double | undefined = 30.0;

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
      .flingSpeedLimit(this.fling)
      .id('common_flingSpeedLimit')

      Column() {
        Button('切换 fling → ' + (this.fling === undefined ? 'undefined' : '30.0'))
          .height('5%')
          .onClick(() => {
            this.fling = this.fling === undefined ? 30.0 : undefined
          }).margin({ top: 5 } as Margin)
          .id('button_flingSpeedLimit')
      }
    }.width('100%').height('100%')
  }
}