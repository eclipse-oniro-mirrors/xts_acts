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
  ContentClipMode
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct ScrollPage {
  @State arr: Int[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  @State clipEnabled: ContentClipMode | undefined = ContentClipMode.SAFE_AREA;

  build() {
    Stack() {
      Scroll() {
        Column() {
          ForEach(this.arr, (item: Int) => {
            Stack() {
              Text('item' + item)
                .width('90%')
                .height('20%')
                .backgroundColor(Color.Red)
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
      .clipContent(this.clipEnabled)
      .id('common_clipContent')

      Column() {
        Button('切换 clipContent → ' + this.clipEnabled)
          .height('5%')
          .onClick(() => {
            this.clipEnabled = this.clipEnabled === undefined ? ContentClipMode.SAFE_AREA : undefined
          }).margin({ top: 5 } as Margin)
          .id('button_clipContent')
      }
    }.width('100%').height('100%')
  }
}