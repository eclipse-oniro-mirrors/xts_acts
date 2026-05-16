'use static'

import {
  Entry,
  Text,
  Column,
  Component,
  Button,
  ClickEvent,
  $r,
  ColumnOptions,
  BorderOptions,
  Row,
  Image,
  Builder,
  RowOptions,
  HorizontalAlign,
  Margin
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'


@Entry
@Component
struct Index {
  @State isOverlay: boolean = true;

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Image($r('app.media.startIcon'))
        .id('overlay_image')
        .height('20%')
        .draggable(true)
        .overlay(this.isOverlay ? undefined : 'Overlay...')

      Button('btn1 : ' + this.isOverlay)
        .id('overlay_btn1')
        .onClick((e: ClickEvent) => {
          this.isOverlay = !this.isOverlay
        })
    }
    .alignItems(HorizontalAlign.Center)
    .width('80%')
    .height('100%')
    .margin({ top: 30 } as Margin)
  }
}