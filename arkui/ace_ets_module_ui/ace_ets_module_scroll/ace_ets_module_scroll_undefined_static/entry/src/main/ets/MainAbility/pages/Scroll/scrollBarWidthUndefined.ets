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
  @State scrollBarWidth: Double | undefined = 20.0;

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
      .scrollBar(BarState.On)
      .scrollBarWidth(this.scrollBarWidth)
      .id('common_scrollBarWidth')

      Column() {
        Button('切换 scrollBarWidth → ' + (this.scrollBarWidth === undefined ? 'undefined' : '20'))
          .height('5%')
          .onClick(() => {
            this.scrollBarWidth = this.scrollBarWidth === 20.0 ? undefined : 20.0
          }).margin({ top: 5 } as Margin)
          .id('button_scrollBarWidth')
      }
    }.width('100%').height('100%')
  }
}