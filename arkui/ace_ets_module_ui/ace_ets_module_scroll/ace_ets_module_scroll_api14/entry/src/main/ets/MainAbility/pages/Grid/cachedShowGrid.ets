/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import events_emitter from '@ohos.events.emitter';
@Entry
@Component
struct cachedCountShowGridExample {
  @State arr: string[] = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10','11','12', '13','14','15']
  scroller: Scroller = new Scroller()
  @State gridPosition: number = 0
  @State clip1: boolean = false
  @State show1: boolean | null | undefined = true

  onPageShow() {
    console.info('[Grid] page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 125,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangClipShow);
  }

  private stateChangClipShow = (eventData: events_emitter.EventData) => {
    console.info('[stateChangClipShow] stateChangeEvent');
    if (eventData != null) {
      console.info('[stateChangClipShow] state change called:' + JSON.stringify(eventData));
      if (eventData.data?.clip1 != null) {
        this.clip1 = eventData.data?.clip1;
      }
      this.show1 = eventData.data?.show1;
    }
  }

  build() {
    Column() {
      Grid(this.scroller) {
        ForEach(this.arr, (item: string,index:number) => {
          GridItem({style:GridItemStyle.PLAIN}) {
            Text('' + item)
              .id('show_grid_' + item)
              .width('100%')
              .height('34%')
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xF9CF93)
          }
        }, (item: string) => item)
      }
      .id('cachedCount_show_grid')
      .columnsTemplate('1fr 1fr 1fr')
      .friction(0.6)
      .clip(this.clip1)
      .cachedCount(2, this.show1)
      .border({width:1})
      .padding('3%')
      .width('90%')
      .height('40%')
      .scrollBar(BarState.On)
      .backgroundColor(0xFAEEE0)
      .onScrollIndex((first: number, last: number) => {
        console.info(first.toString())
        console.info(last.toString())
      })
      .onDidScroll((scrollOffset: number, scrollState: ScrollState) => {
        console.info(scrollOffset.toString())
        console.info(scrollState.toString())
      })
      .onScrollStart(() => {
        console.info('Grid onScrollStart')
      })
      .onScrollStop(() => {
        console.info('Grid onScrollStop')
      })
      .onReachStart(() => {
        this.gridPosition = 0
        console.info('Grid onReachStart')
      })
      .onReachEnd(() => {
        this.gridPosition = 2
        console.info('Grid onReachEnd')
      })

    }.width('100%')
    .height('100%')
    .margin({ top: 5 })
  }
}