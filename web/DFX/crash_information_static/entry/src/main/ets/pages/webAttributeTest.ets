/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
  OnRenderExitedEvent,
  Entry,
  Component,
  Column,
  Row,
  Button,
  ClickEvent,
  Web,
  RenderExitReason,
  OnRenderExitedEvent
} from "@ohos.arkui.component"
import { State } from "@ohos.arkui.stateManagement" // should be insert by ui-plugins
import web_webview from '@ohos.web.webview'
import { BusinessError, RecordData } from '@ohos.base';
import { Hypium } from "../../../hypium";
import emitter from '@ohos.events.emitter';
import testsuite from '../../src/test/List.test';
import Utils from '../../src/test/Util.test';
import { Callback } from '@ohos.base'

@Entry
@Component
struct webAttributeTest {
  controller: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  @State str: string = ''
  @State flag: boolean = false

  aboutToAppear() {
    console.info('Entry aboutToAppear');
    let valueChangeEvent: emitter.InnerEvent = {
      eventId: 10,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(valueChangeEvent, this.valueChangeCallBack)
    console.info('Finish aboutToAppear ' + this.valueChangeCallBack);
  }

  //编译失败待解决P1 | 已解决
  private valueChangeCallBack: Callback<emitter.EventData> = (eventData: emitter.EventData): void => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data && data['ACTION'] != null) {
        console.info('Received ACTION value: ' + data['ACTION']);
        let strValue: string = String(data['ACTION']);
        console.info('strValue has been updated to: ' + strValue);
        this.str = strValue;
        console.info('this.str has been updated to: ' + this.str);
      }
    }
  }

  build() {
    Row() {
      Column() {
        Button("web click")
          .key('WebAttributeTestButton')
          .onClick((e: ClickEvent) => {
            console.info("key==>" + this.str)
            switch (this.str) {
              case "emitOnRenderExited": {
                try {
                  this.controller.loadUrl('chrome://crash/')
                } catch (error: BusinessError) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitRenderExitReasonProcessCrashed": {
                console.log("RenderExitReason0", RenderExitReason.PROCESS_ABNORMAL_TERMINATION)
                console.log("RenderExitReason1", RenderExitReason.PROCESS_WAS_KILLED)
                console.log("RenderExitReason2", RenderExitReason.PROCESS_CRASHED)
                console.log("RenderExitReason3", RenderExitReason.PROCESS_OOM)
                console.log("RenderExitReason4", RenderExitReason.PROCESS_EXIT_UNKNOWN)
                this.flag = true;
                this.controller.loadUrl('chrome://crash/')
                break;
              }
            }
          })

        Web({ src: 'resource://rawfile/index.html', controller: this.controller })
          .key('webView')
          .onRenderExited((event: OnRenderExitedEvent): void => {
            if (event) {
              if (!this.flag) {
                console.info('onRenderExited==>' + event.renderExitReason);
                this.controller.loadUrl("resource://rawfile/index.html");
                Utils.emitEvent(event.renderExitReason, 60106);
              } else {
                console.info("onRenderExited==>" + event.renderExitReason);
                this.controller.loadUrl("resource://rawfile/index.html");
                Utils.emitEvent(event.renderExitReason, 901);
              }
            }
          })
      }
    }
  }
}