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
  Column,
  Component,
  Button,
  ClickEvent,
  Text,
  Row,
  Scroll,
  ButtonType,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Alignment,
  TextAlign,
  TextOverflow,
  FontWeight,
  Profiler
} from '@ohos.arkui.component'
import {
  State,
  Link,
  PropRef,
} from '@ohos.arkui.stateManagement'
import Log from '../../common/Log';
import events_emitter from '@ohos.events.emitter';
import { AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext'
import inspector from '@ohos.arkui.inspector';
import common from '@ohos.app.ability.common';
import { RecordData } from '@ohos.base';

@Entry
@Component
struct Inspector {
  @State message: string = 'test'
  @State setColor: string = '#F9CF93'
  @State catchStatus: string = "success"
  @State response: string = ""
  @State text01: string = "text01"
  @State text02: string = "text02"


  onPageShow() {
    console.info('[inspector] page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 60211,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);
  }

  private stateChangCallBack: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
    console.info("[inspector] page stateChangCallBack");
    if (eventData != null) {
      console.info("[inspector] page state change called:" + JSON.stringify(eventData));
      if (JSON.parseJsonElement(JSON.stringify(eventData)).getElement('data').tryGetElement('setColor') != null) {
        this.setColor = JSON.parseJsonElement(JSON.stringify(eventData)).getElement('data').getString('setColor');
      }
    }
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      Text("inspector")
        .width('100%')
        .height('5%')
        .fontSize(5)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor('0xCCCCCC')
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
              // let getInspectorNodesObj = JSON.stringify(getInspectorNodes())
              // try {
              //   let data: Record<String,RecordData> = {
              //     "getInspectorNodes": getInspectorNodesObj,
              //     "result": "success"
              //   }
              //   let backData: events_emitter.EventData = {
              //     data: data
              //   }
              //   let backEvent: events_emitter.InnerEvent = {
              //     eventId: 60208,
              //     priority: events_emitter.EventPriority.LOW
              //   }
              //   console.info("inspector_101 onClick start to emit action state")
              //   events_emitter.emit(backEvent, backData)
              // } catch (err) {
              //   console.info("inspector_101 onClick emit action state err: " + JSON.stringify((err as Error)?.message))
              // }
            })
          Text("inspectorApiTwo")
            .key("inspectorApiTwo")
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .onClick((e: ClickEvent) => {
              try {
                // let i: string = JSON.parse(JSON.stringify(getInspectorNodes()))["inspectors"][0]["id"]
                // let getInspectorNodeByIdObj = JSON.stringify(getInspectorNodeById(parseInt(i)))
                // console.info("getInspectorNodeByIdObj is " + 'getInspectorNodeByIdObj')
                // let data: Record<String,RecordData> = {
                //   "result": "success",
                // }
                // let backData1: events_emitter.EventData = {
                //   data: data
                // }
                // let backEvent1: events_emitter.InnerEvent = {
                //   eventId: 60209,
                //   priority: events_emitter.EventPriority.LOW
                // }
                // console.info("inspector_102 onClick start to emit action state")
                // events_emitter.emit(backEvent1, backData1)
              } catch (err) {
                console.info("inspector_102 onClick emit action state err: " + JSON.stringify((err as Error)?.message))
              }
            })

          Text("inspectorApiThree")
            .key("inspectorApiThree")
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .onClick((e: ClickEvent) => {
              // setAppBgColor('#F9CF93'); ??哪来的
            })

          Text("inspectorApiFour")
            .key("inspectorApiFour")
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .onClick((e: ClickEvent) => {
              try {
                Profiler.registerVsyncCallback((info: string) => {
                  console.info("VsyncCallback" + info)
                });
                Profiler.unregisterVsyncCallback();
                this.catchStatus = "callBackSuccess"
              } catch (err) {
                console.info("inspector_103 onClick err: " + JSON.stringify((err as Error)?.message))
                this.catchStatus = "callBackFail"
              }
              try {
                let data: Record<String,RecordData> = {
                  "catchStatus": this.catchStatus,
                }
                let backData2: events_emitter.EventData = {
                  data: data
                }
                let backEvent2: events_emitter.InnerEvent = {
                  eventId: 60210,
                  priority: events_emitter.EventPriority.LOW
                }
                console.info("inspector_103 onClick start to emit action state")
                events_emitter.emit(backEvent2, backData2)
              } catch (err) {
                console.info("inspector_103 onClick emit action state err: " + JSON.stringify((err as Error)?.message))
              }
            })
          Text(this.text01).id("text01_id")
          Button("getFilteredInspectorTree").id("getFilteredInspectorTree")
            .onClick((e: ClickEvent) => {
              console.log("getFilteredInspectorTree...2")
              try {
                this.response = this.getUIContext().getFilteredInspectorTree(undefined) // 不支持undefined
                console.log("getFilteredInspectorTree...22 response")
              } catch (err) {
                this.text01 = JSON.stringify(err);
                console.log("catch err msg response:" + JSON.stringify(err))
              }
            })
          Text(this.text02).id("text02_id")
          Button("getFilteredInspectorTreeById").id("getFilteredInspectorTreeById")
            .onClick((e: ClickEvent) => {
              console.log("getFilteredInspectorTreeById...")
              try {
                this.response = this.getUIContext().getFilteredInspectorTreeById('testId', 0)
                console.log("response:" + this.response)
              } catch (err) {
                this.text02 = JSON.stringify(err);
                console.log("catch err msg response:" + JSON.stringify(err))
              }
            })

        }
        .width('100%')
      }
      .height('95%')

    }.width("100%").height("100%")
  }
}
