'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import Log from '../../common/Log';
import Utils from '../../common/Utils';
import events_emitter from '@ohos.events.emitter';
import RectValue from '../../common/Rect';
import {
  Entry,
  Component,
  Flex,
  RefreshStatus,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Text,
  ClickEvent,
  Refresh,
  TextOverflow,
  TextAlign,
  Alignment
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import { RecordData } from '@ohos.base';

const TAG = 'ets_apiLack_add';

@Component
@Entry
struct RefreshDrag {
  dragRefresh() {
    let rect: RectValue = Utils.getComponentRect("Refresh")
    Utils.drag(rect.left, rect.top, rect.right, rect.bottom, 20)
  }

  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear RefreshDrag start`)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear RefreshDrag end`)
  }

  @State isRefreshing: boolean = false
  @State counter: number = 0

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      Text("refresh-Drag")
        .width(100)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("DragText")

      Text("refresh-Refresh")
        .width(100)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("RefreshText")


      Refresh({ refreshing: this.isRefreshing }) {
        Text('Pull Down and refresh: ' + this.counter)
          .fontSize(30)
          .margin(10)
      }
      .pullDownRatio(1)
      .key("Refresh")
      .onClick((e: ClickEvent) => {
        this.dragRefresh()
      })
      .onStateChange((refreshStatus: RefreshStatus) => {
        console.info('Refresh onStatueChange state is ' + refreshStatus)
        if (refreshStatus === RefreshStatus.Drag) {
          console.info("refreshStatus RefreshStatus.Drag")
        }
        if (refreshStatus === RefreshStatus.Refresh) {
          console.info("refreshStatus RefreshStatus.Refresh")
        }
        try {
          let backDataTwo: events_emitter.EventData = {
            data: {
              "Result": true
            } as Record<String,RecordData>
          }
          let backEventTwo: events_emitter.InnerEvent = {
            eventId: 60305,
            priority: events_emitter.EventPriority.LOW
          }
          console.info("Refresh start to emit action state")
          events_emitter.emit(backEventTwo, backDataTwo)
        } catch (err) {
          console.info("Refresh emit action state err: " + JSON.stringify((err as Error)?.message))
        }
      })
      .onRefreshing(() => {
        setTimeout(() => {
          this.counter++
          this.isRefreshing = false
        }, 1000)
        console.log('onRefreshing test')
        try {
          let backData: events_emitter.EventData = {
            data: {
              "Result": true
            } as Record<String,RecordData>
          }
          let backEvent: events_emitter.InnerEvent = {
            eventId: 60304,
            priority: events_emitter.EventPriority.LOW
          }
          console.info("Drag start to emit action state")
          events_emitter.emit(backEvent, backData)
        } catch (err) {
          console.info("Drag emit action state err: " + JSON.stringify((err as Error)?.message))
        }
      })
    }.width("100%").height("100%")
  }
}

