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
  Scroll
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct ScrollPage {
  @State arr: Int[] = [0, 1, 2, 3, 4, 5];
  @State change: boolean = true;
  @State count: Int = 1;

  build() {
    Stack() {
      Scroll() {
        Column() {
          ForEach(this.arr, (item: Int) => {
            Text('item' + item)
              .width('90%')
              .height('20%')
              .borderRadius(15)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .focusable(true)
              .focusOnTouch(true)
              .id('scrollItem' + item)
          })
        }.width('100%')
      }
      .scrollBar(BarState.On)
      .onScrollStop(this.change ? () => {
        this.count += 1;
      }:undefined)
      Column() {
        Text('Count' + this.count)
          .id('common_onScrollStop')
        Button('切换 onScrollStop → ' + (this.change === true ? 'true' : 'false'))
          .height('5%')
          .onClick(() => {
            this.change = !this.change;
          }).margin({ top: 5 } as Margin)
          .id('button_onScrollStop')
      }
    }.width('100%').height('100%')
  }
}