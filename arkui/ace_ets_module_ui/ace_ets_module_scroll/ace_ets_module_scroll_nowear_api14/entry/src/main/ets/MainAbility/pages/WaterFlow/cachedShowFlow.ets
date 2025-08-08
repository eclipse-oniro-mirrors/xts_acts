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
import { WaterFlowDataSource } from './WaterFlowDataSource'
@Entry
@Component
struct cachedCountShowFlowExample {
  @State minSize: number = 80
  @State maxSize: number = 180
  @State colors: number[] = [0xFFC0CB, 0xDA70D6, 0x6B8E23, 0x6A5ACD, 0x00FFFF, 0x00FF7F]
  dataSource: WaterFlowDataSource = new WaterFlowDataSource()
  scroller: Scroller = new Scroller()
  @State clip1: boolean = false
  @State show1: boolean | null | undefined = true

  onPageShow() {
    console.info('[WaterFlow] page show called');
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
      WaterFlow({ scroller:this.scroller }) {
        LazyForEach(this.dataSource, (item: number) => {
          FlowItem() {
            Column() {
              Text('N' + item)
                .id('show_flow_' + item)
                .width('100%')
                .height('34%')
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .borderRadius(10)
            }
          }
          .width('100%')
          .backgroundColor(this.colors[item % 5])
        }, (item: string) => item)
      }
      .id('cachedCount_show_flow')
      .columnsTemplate('1fr 1fr 1fr')
      .clip(this.clip1)
      .cachedCount(6, this.show1)
      .border({width:1})
      .width('90%')
      .height('40%')
      .friction(0.6)
      .padding('3%')
      .scrollBar(BarState.On)
      .onScrollIndex((first: number, last: number) => {
        console.info('onScrollIndex first:' + first.toString() + ' last:' + last.toString())
      })
      .onReachStart(() => {
        console.info('waterFlow reach start')
      })
      .onReachEnd(() => {
        console.info('waterFlow reach end')
      })
      .onScrollFrameBegin((offset: number, state: ScrollState) => {
        console.info('waterFlow scrollFrameBegin offset: ' + offset + ' state: ' + state.toString())
        return { offsetRemain: offset }
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .padding({ top: 5 })
  }
}