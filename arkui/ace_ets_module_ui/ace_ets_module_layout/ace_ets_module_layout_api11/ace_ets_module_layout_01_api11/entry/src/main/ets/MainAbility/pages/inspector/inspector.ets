/*
 * Copyright (c) 2025Huawei Device Co., Ltd.
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

import Log from '../../common/Log';
import events_emitter from '@ohos.events.emitter';

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

  private stateChangCallBack = (eventData: events_emitter.EventData) => {
    console.info("[inspector] page stateChangCallBack");
    if (eventData != null) {
      console.info("[inspector] page state change called:" + JSON.stringify(eventData));
      if (eventData.data?.setColor != null) {
        this.setColor = eventData.data?.setColor;
      }
    }
  }

  build() {
    Column({ space: 2}) {

      Text("inspector")
        .width(180)
        .height(20)
        .fontSize(5)
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
            .height(20)
            .key("inspectorApiOne")
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .onClick(() => {
              let getInspectorNodesObj = JSON.stringify(getInspectorNodes())
              try {
                let backData: events_emitter.EventData = {
                  data: {
                    "getInspectorNodes": getInspectorNodesObj,
                    "result": "success"
                  }
                }
                let backEvent: events_emitter.InnerEvent = {
                  eventId: 60208,
                  priority: events_emitter.EventPriority.LOW
                }
                console.info("inspector_101 onClick start to emit action state")
                events_emitter.emit(backEvent, backData)
              } catch (err) {
                console.info("inspector_101 onClick emit action state err: " + JSON.stringify((err as Error)?.message))
              }
            })
          Text("inspectorApiTwo")
            .height(20)
            .key("inspectorApiTwo")
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .onClick(() => {
              try {
                let i: string = JSON.parse(JSON.stringify(getInspectorNodes()))["inspectors"][0]["id"]
                let getInspectorNodeByIdObj = JSON.stringify(getInspectorNodeById(parseInt(i)))
                console.info("getInspectorNodeByIdObj is " + getInspectorNodeByIdObj)
                let backData1: events_emitter.EventData = {
                  data: {
                    "result": "success",
                  }
                }
                let backEvent1: events_emitter.InnerEvent = {
                  eventId: 60209,
                  priority: events_emitter.EventPriority.LOW
                }
                console.info("inspector_102 onClick start to emit action state")
                events_emitter.emit(backEvent1, backData1)
              } catch (err) {
                console.info("inspector_102 onClick emit action state err: " + JSON.stringify((err as Error)?.message))
              }
            })

          Text("inspectorApiThree")
            .height(20)
            .key("inspectorApiThree")
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .onClick(() => {
              setAppBgColor('#F9CF93');
            })

          Text("inspectorApiFour")
            .height(20)
            .key("inspectorApiFour")
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .onClick(() => {
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
                let backData2: events_emitter.EventData = {
                  data: {
                    "catchStatus": this.catchStatus,
                  }
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

          Button("getFilteredInspectorTree").id("getFilteredInspectorTree")
            .height(20)
            .onClick(() => {
              console.log("getFilteredInspectorTree...")
              try {
                this.response = this.getUIContext().getFilteredInspectorTree(null)
              } catch (err) {
                this.text01 = JSON.stringify(err);
                console.log("catch err msg response:" + JSON.stringify(err))
              }
            })

          Row({space:2}){
            Text(this.text01).id("text01_id").height(20)
            Text(this.text02).id("text02_id").height(20)
          }

          Button("getFilteredInspectorTreeById").id("getFilteredInspectorTreeById")
            .height(20)
            .onClick(() => {
              console.log("getFilteredInspectorTreeById...")
              try {
                this.response = this.getUIContext().getFilteredInspectorTreeById('testId', 0, null)
                console.log("response:" + this.response)
              } catch (err) {
                this.text02 = JSON.stringify(err);
                console.log("catch err msg response:" + JSON.stringify(err))
              }
            })
        }
      }
    }.width("100%").height("100%")
  }
}

