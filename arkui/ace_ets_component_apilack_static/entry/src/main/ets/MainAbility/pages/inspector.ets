'use static';
/*
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

import Log from '../common/Log';
import events_emitter from '@ohos.events.emitter';
import {
  Alignment,
  ClickEvent,
  Column,
  Component,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FontWeight,
  ItemAlign,
  Profiler,
  Row,
  setAppBgColor,
  Text,
  TextAlign,
  TextOverflow
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { RecordData } from '@ohos.base';

@Entry
@Component
struct Inspector {
  @State message: string = 'test'
  @State setColor: string = '#F9CF93'
  @State catchStatus: string = "success"

  onPageShow() {
    console.info('[inspector] page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 60211,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      Text("inspector")
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

      Row() {
        Column() {
          Text(this.message)
            .key("inspectorApiOne")
            .fontSize(50)
            .fontWeight(FontWeight.Bold)
            .onClick((e: ClickEvent) => {
              // let getInspectorNodesObj = JSON.stringify(inspector.getInspectorNodes())
              try {
                let backData: events_emitter.EventData = {
                  data: {
                    // "getInspectorNodes": getInspectorNodesObj,
                    "result": "success"
                  } as Record<String,RecordData>
                }
                let backEvent: events_emitter.InnerEvent = {
                  eventId: 60208,
                  priority: events_emitter.EventPriority.LOW
                }
                console.info("inspector_101 onClick start to emit action state")
                events_emitter.emit(backEvent, backData)
              } catch (err: Error) {
                console.info("inspector_101 onClick emit action state err: " + JSON.stringify((err as Error)?.message))
              }
            })
          Text("inspectorApiTwo")
            .key("inspectorApiTwo")
            .fontSize(50)
            .fontWeight(FontWeight.Bold)
            .onClick((e: ClickEvent) => {
              try {
                let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
                let i: string = obj.getArray("inspectors")[0].getString("id")
                let getInspectorNodeByIdObj = JSON.stringify(inspector.getInspectorByKey(i))
                console.info("getInspectorNodeByIdObj is " + getInspectorNodeByIdObj)
                let backData1: events_emitter.EventData = {
                  data: {
                    "result": "success",
                  } as Record<String,RecordData>
                }
                let backEvent1: events_emitter.InnerEvent = {
                  eventId: 60209,
                  priority: events_emitter.EventPriority.LOW
                }
                console.info("inspector_102 onClick start to emit action state")
                events_emitter.emit(backEvent1, backData1)
              } catch (err: Error) {
                console.info("inspector_102 onClick emit action state err: " + JSON.stringify((err as Error)?.message))
              }
            })

          Text("inspectorApiThree")
            .key("inspectorApiThree")
            .fontSize(50)
            .fontWeight(FontWeight.Bold)
            .onClick((e: ClickEvent) => {
              setAppBgColor('#F9CF93');
            })

          Text("inspectorApiFour")
            .key("inspectorApiFour")
            .fontSize(50)
            .fontWeight(FontWeight.Bold)
            .onClick((e: ClickEvent) => {
              try {
                Profiler.registerVsyncCallback((info: string) => {
                  console.info("VsyncCallback" + info)
                });
                Profiler.unregisterVsyncCallback();
                this.catchStatus = "callBackSuccess"
              } catch (err: Error) {
                console.info("inspector_103 onClick err: " + JSON.stringify((err as Error)?.message))
                this.catchStatus = "callBackFail"
              }
              try {
                let backData2: events_emitter.EventData = {
                  data: {
                    "catchStatus": this.catchStatus,
                  } as Record<String,RecordData>
                }
                let backEvent2: events_emitter.InnerEvent = {
                  eventId: 60210,
                  priority: events_emitter.EventPriority.LOW
                }
                console.info("inspector_103 onClick start to emit action state")
                events_emitter.emit(backEvent2, backData2)
              } catch (err: Error) {
                console.info("inspector_103 onClick emit action state err: " + JSON.stringify((err as Error)?.message))
              }
            })
        }
        .width('100%')
      }
      .height('100%')

    }.width("100%").height("100%")
  }

  private stateChangCallBack: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
    console.info("[inspector] page stateChangCallBack");
    if (eventData != null && eventData.data != null) {
      console.info("[inspector] page state change called:" + JSON.stringify(eventData));
      const data = eventData.data as Record<String,RecordData>
      if (data['setColor'] != null) {
        this.setColor = data['setColor'] as string;
      }
    }
  }
}
