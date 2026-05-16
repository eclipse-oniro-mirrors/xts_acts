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
  Scroll,
  ClickEvent,
  Scroller
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct ScrollPage {
  @State arr: Int[] = [0, 1, 2, 3, 4, 5];
  @State change: boolean = true;
  @State count: Int = 1;
  scroller: Scroller = new Scroller();

  build() {
    Column() {
      Scroll(this.scroller) {
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
      .height('80%')
      .scrollBar(BarState.On)
      .onReachEnd(this.change ? () => {
        this.count += 1;
      } : undefined)

      Column() {
        Text('Count' + this.count)
          .id('common_onReachEnd')
        Button('切换 onReachEnd → ' + (this.change === true ? 'true' : 'false'))
          .height('5%')
          .onClick(() => {
            this.change = !this.change;
          }).margin({ top: 5 } as Margin)
          .id('button_onReachEnd')
        Row() {
          Button('flingTop')
            .id('flingTop')
            .onClick((e: ClickEvent) => {
              this.scroller.fling(4000);
            })
          Button('flingBottom')
            .id('flingBottom')
            .onClick((e: ClickEvent) => {
              this.scroller.fling(-4000);
            })
        }
      }
    }.width('100%').height('100%')
  }
}