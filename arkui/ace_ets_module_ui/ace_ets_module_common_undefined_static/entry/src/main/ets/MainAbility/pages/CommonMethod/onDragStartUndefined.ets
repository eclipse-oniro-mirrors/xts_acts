'use static'
import {
  Entry,
  Text,
  Column,
  Component,
  Button,
  FlexAlign,
  Margin,
  ColumnOptions,
  HorizontalAlign,
  Image,
  DragEvent,
  DragItemInfo,
  FontWeight
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct dragPreviewOptionsDemo {
  @State change: boolean = true
  @State count: Int = 0

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Image('resources/base/media/startIcon.png')
        .margin({ top: 10 } as Margin)
        .width('30%')
        .border({
          radius: {
            topLeft: 1,
            topRight: 2,
            bottomLeft: 4,
            bottomRight: 8
          }
        })
        .draggable(true)
        .onDragStart(this.change?(event: DragEvent, extraParams?: string) => {
          this.count += 1;
          return {} as DragItemInfo
        }:undefined)
        .id('commonmethod_onDragStart')
      Text('Count' + this.count)
        .fontSize(26)
        .id('commonmethod_onDragStart2')
      Button('undefined' + this.change)
        .onClick(() => {
          this.change = !this.change
        })
        .id('button_onDragStart')
    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }
}