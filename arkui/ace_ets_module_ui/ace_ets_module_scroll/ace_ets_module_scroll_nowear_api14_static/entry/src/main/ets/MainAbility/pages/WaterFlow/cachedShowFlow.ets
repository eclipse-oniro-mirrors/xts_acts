'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import {
  Entry,
  Component,
  Scroller,
  ScrollState,
  Column,
  WaterFlow,
  LazyForEach,
  FlowItem,
  Padding,
  Text,
  BarState,
  TextAlign,
  OnScrollFrameBeginCallback,
  WaterFlowOptions,
  OnScrollFrameBeginHandlerResult
} from '@ohos.arkui.component';
import events_emitter from '@ohos.events.emitter';
import { WaterFlowDataSource } from './WaterFlowDataSource';
import { State } from '@ohos.arkui.stateManagement';
import { RecordData } from '@ohos.base';

@Entry
@Component
struct cachedCountShowFlowExample {
  @State minSize: number = 80
  @State maxSize: number = 180
  @State colors: int[] = [0xFFC0CB, 0xDA70D6, 0x6B8E23, 0x6A5ACD, 0x00FFFF, 0x00FF7F] as int[]
  dataSource: WaterFlowDataSource = new WaterFlowDataSource()
  scroller: Scroller = new Scroller()
  @State clip1: boolean = false
  @State show1: boolean | undefined = true

  onPageShow() {
    console.info('[WaterFlow] page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 125,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangClipShow);
  }

  private stateChangClipShow: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
    console.info('[stateChangClipShow] stateChangeEvent');
    if (eventData != null && eventData.data != null) {
      console.info("[stateChangClipShow] state change called: " + JSON.stringify(eventData));
      const data = eventData.data as Record<String,RecordData>
      if (data['clip1'] != null) {
        this.clip1 = data['clip1'] as boolean
      }
      if (data['show1'] != null) {
        if (data['show1'] == 'undefined'){
          this.show1 = undefined
        }else{
          this.show1 = data['show1'] as boolean
        }
      }
    }
  }

  build() {
    Column() {
      WaterFlow({ scroller: this.scroller } as WaterFlowOptions) {
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
          .backgroundColor(this.colors[item.toInt() % 5])
        }, (item: number) => String(item))
      }
      .id('cachedCount_show_flow')
      .columnsTemplate('1fr 1fr 1fr')
      .clip(this.clip1)
      .cachedCount(6, this.show1)
      .border({ width: 1 })
      .width('90%')
      .height('40%')
      .friction(0.6)
      .padding('3%')
      .scrollBar(BarState.On)
      .onScrollIndex((first: int, last: int) => {
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
        return { offsetRemain: offset } as OnScrollFrameBeginHandlerResult
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .padding({ top: 5 } as Padding)
  }
}