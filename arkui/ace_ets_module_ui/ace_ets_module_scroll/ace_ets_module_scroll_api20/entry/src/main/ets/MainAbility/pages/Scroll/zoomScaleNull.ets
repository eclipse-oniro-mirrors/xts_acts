/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
@Entry
@Component
struct ScrollZoomNullExample {
  @State currScale:number = 1;
  @State didZoom: string = 'zoom'
  @State zoomStart: string = 'start'
  @State zoomStop: string = 'stop'

  build() {
    Column() {
      Text('zoomScale: ' + this.currScale)
        .margin({top:5})
      Text(this.didZoom)
        .id('null_didZoom')
      Row(){
        Text(this.zoomStart)
          .id('zoom_nullStart')
          .margin({right:10})
        Text(this.zoomStop)
          .id('zoom_nullStop')
      }
      Scroll() {
        Image($r('app.media.icon'))
          .id('img_nullZoom')
          .width('70%')
          .height('100%')
      }
      .id('scroll_nullZoom')
      .width('80%')
      .height('50%')
      .borderWidth(1)
      .scrollable(ScrollDirection.FREE)
      .minZoomScale(null)
      .maxZoomScale(2)
      .zoomScale(this.currScale!!)
      .enableBouncesZoom(undefined)
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