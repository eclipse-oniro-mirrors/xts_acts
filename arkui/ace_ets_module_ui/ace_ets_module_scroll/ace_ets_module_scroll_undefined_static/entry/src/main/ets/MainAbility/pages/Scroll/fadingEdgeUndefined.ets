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
  Scroll,
  Color,
  Margin,
  FadingEdgeOptions,
  LengthMetrics
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct ScrollPage {
  @State arr: Int[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  @State feEnabled1: boolean | undefined = true;
  @State feEnabled2: FadingEdgeOptions | undefined = { fadingEdgeLength: LengthMetrics.vp(80) } as FadingEdgeOptions;

  build() {
    Stack() {
      Scroll() {
        Column() {
          ForEach(this.arr, (item: Int) => {
            Stack() {
              Text('item' + item)
                .width('90%')
                .height('20%')
                .backgroundColor(Color.White)
                .borderRadius(15)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .focusable(true)
                .focusOnTouch(true)
            }
            .width('80%')
            .padding(20)
            .borderRadius(15)
            .backgroundColor(Color.Blue)
            .margin({ top: 30, bottom: 30 } as Margin)
          })
        }.width('100%').backgroundColor('rgb(213,213,213)')
      }
      .backgroundColor('rgb(213,213,213)')
      .scrollBar(BarState.On)
      .fadingEdge(this.feEnabled1, this.feEnabled2)
      .id('common_fadingEdge')

      Column() {
        Button('切换 feEnabled1 → ' + this.feEnabled1)
          .height('5%')
          .onClick(() => {
            this.feEnabled1 = this.feEnabled1 === undefined ? true : undefined
          }).margin({ top: 5 } as Margin)
          .id('button_fadingEdge')
        Button('切换 feEnabled2 → ' + this.feEnabled2)
          .height('5%')
          .onClick(() => {
            this.feEnabled2 =
              this.feEnabled2 === undefined ? { fadingEdgeLength: LengthMetrics.vp(80) } as FadingEdgeOptions :
                undefined
          }).margin({ top: 5 } as Margin)
      }
    }.width('100%').height('100%')
  }
}