/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { Text,BlurOnKeyboardHideMode,$rawfile,OnConsoleEvent,Entry, Component, Column, Row, Button, ClickEvent, Web, BlankScreenDetectionMethod, DetectedBlankScreenReason, BlankScreenDetectionEventInfo } from "@ohos.arkui.component"
import { State } from "@ohos.arkui.stateManagement"
import { UIContext, Router } from '@ohos.arkui.UIContext'
import web_webview from '@ohos.web.webview';
import Utils from '../../src/test/Util.test';
import { BusinessError, RecordData } from '@ohos.base';
import { Driver, ON } from '@ohos.UiTest';
import events_emitter from '@ohos.events.emitter';
import { Callback } from '@ohos.base'

@Entry
@Component
struct WebComponent {
  controller: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  controller_1: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  controller_2: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  @State str: string = "";
  @State url: string = "";
  @State url_1: string = "";
  @State url_2: string = "";
  blankScreenReason?: DetectedBlankScreenReason
  detectedContentfulNodesCount?: int

  aboutToAppear() {
    console.info("Entry aboutToAppear");
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
    console.info("Finish aboutToAppear " + this.valueChangeCallBack);
  }

  onPageHide() {
    events_emitter.off(10)
  }

  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data && data["ACTION"] != null) {
        console.info('Received ACTION value: ' + data["ACTION"]);
        let strValue: string = String(data["ACTION"]);
        console.info('strValue has been updated to: ' + strValue);
        this.str = strValue;
        console.info('this.str has been updated to: ' + this.str);
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("WebBlankScreenDetectionMethod click")
          .key('WebBlankScreenDetectionMethodButton')
          .onClick((e: ClickEvent) => {
            console.info("key==>" + this.str);
            switch (this.str) {
              case "testWebBlankScreenDetectionMethod00": {
                try {
                  console.info(`testWebBlankScreenDetectionMethod result: ${BlankScreenDetectionMethod.DETECTION_CONTENTFUL_NODES_SEVENTEEN}`);
                  Utils.emitEvent(BlankScreenDetectionMethod.DETECTION_CONTENTFUL_NODES_SEVENTEEN, 20260310)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(error, 20260310)
                }
                break;
              }
              case "testWebBlankScreenDetectionMethod01": {
                try {
                  console.info(`testWebBlankScreenDetectionMethod result: ${this.url}`);
                  Utils.emitEvent(this.url, 20260311)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(error, 20260311)
                }
                break;
              }
              case "testWebBlankScreenDetectionMethod02": {
                try {
                  console.info(`testWebBlankScreenDetectionMethod result: ${this.blankScreenReason}`);
                  Utils.emitEvent(this.blankScreenReason == DetectedBlankScreenReason.NO_CONTENTFUL_NODES, 20260312)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(error, 20260312)
                }
                break;
              }
              case "testWebBlankScreenDetectionMethod03": {
                try {
                  console.info(`testWebBlankScreenDetectionMethod result: ${this.detectedContentfulNodesCount}`);
                  Utils.emitEvent(this.detectedContentfulNodesCount ?? 0, 20260313)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(error, 20260313)
                }
                break;
              }
              case "testWebBlankScreenDetectionMethod04": {
                try {
                  console.info(`testWebBlankScreenDetectionMethod result: ${this.url_1}`);
                  Utils.emitEvent(this.url_1, 20260314)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(error, 20260314)
                }
                break;
              }
              case "testWebBlankScreenDetectionMethod05": {
                try {
                  console.info(`testWebBlankScreenDetectionMethod result: ${this.url_2}`);
                  Utils.emitEvent(this.url_2, 20260315)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(error, 20260315)
                }
              }
            }
          })
      }
      Web({ src: 'https://www.example.com', controller: this.controller })
        .javaScriptAccess(true)
        .blankScreenDetectionConfig({
          enable: true,
          detectionTiming: [2, 4, 6, 8],
          contentfulNodesCountThreshold: 4,
          detectionMethods:[BlankScreenDetectionMethod.DETECTION_CONTENTFUL_NODES_SEVENTEEN]
        })
        .onDetectedBlankScreen((event: BlankScreenDetectionEventInfo): void =>{
          console.info(`Found blank screen on ${event.url}.`);
          console.info(`The blank screen reason is ${event.blankScreenReason}.`);
          console.info(`The blank screen detail is ${event.blankScreenDetails?.detectedContentfulNodesCount}.`);
          this.url = event.url
          this.blankScreenReason = event.blankScreenReason
          this.detectedContentfulNodesCount = event.blankScreenDetails?.detectedContentfulNodesCount
        })
      Web({ src: 'https://www.baidu.com', controller: this.controller_1 })
        .javaScriptAccess(true)
        .blankScreenDetectionConfig(undefined)
        .onDetectedBlankScreen((event: BlankScreenDetectionEventInfo): void =>{
          console.info(`Found blank screen on ${event.url}.`);
          this.url_1 = event.url
        })
      Web({ src: 'https://www.baidu.com', controller: this.controller_2 })
        .javaScriptAccess(true)
        .blankScreenDetectionConfig({ enable: false })
        .onDetectedBlankScreen((event: BlankScreenDetectionEventInfo): void =>{
          console.info(`Found blank screen on ${event.url}.`);
          this.url_2 = event.url
        })
    }
  }
}