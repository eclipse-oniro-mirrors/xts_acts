'use static'

import { Entry, Text, Column, Component, Button, ClickEvent, ScrollDirection, Row, Scroll, Image, $r } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Entry
@Component
struct ScrollZoom {
  @State currScale:number = 1;
  @State didZoom: string = 'zoom'
  @State zoomStart: string = 'start'
  @State zoomStop: string = 'stop'

  build() {
    Column() {
      Text(this.didZoom)
        .id('scroll_didZoom')
      Row(){
        Text(this.zoomStart)
          .id('scroll_Start')
          .margin({right:10})
        Text(this.zoomStop)
          .id('scroll_Stop')
      }
      Scroll() {
        Image($r('app.media.icon'))
          .id('img_zoom')
          .width('70%')
          .height('100%')
      }
      .id('scroll_zoom')
      .width('80%')
      .height('50%')
      .scrollable(ScrollDirection.FREE)
      .minZoomScale(1)
      .maxZoomScale(2)
      .zoomScale(this.currScale!!)
      .onDidZoom((scale: number) => {
        this.didZoom = 'onDidZoom: ' + scale
        console.info(`Scroll onDidZoom:${scale}`);
      })
      .onZoomStart(() => {
        this.zoomStart = 'onZoomStart'
        console.info('Scroll onZoomStart');
      })
      .onZoomStop(() => {
        this.zoomStop = 'onZoomStop'
        console.info('Scroll onZoomStop');
      })
    }.width('100%')
    .height('100%')
  }
}