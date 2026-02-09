/**
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

import { Entry, Component, Column, Row, Text, Button, ClickEvent, Web, $rawfile, Visibility, CacheMode, OnBeforeUnloadEvent } from "@ohos.arkui.component";
import { State } from "@ohos.arkui.stateManagement";
import Utils from '../../src/test/Util.test';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import { Callback, RecordData } from '@ohos.base'
import { BusinessError } from '@ohos.base';

@Entry
@Component
struct WebOnBeforeUnload {
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  @State str: string = "";
  @State firstId: int = 60402;
  @State secondId: int = 60403;
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State userAgent: string = "Mozilla/5.0 (Window NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko)" +
    " CHrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.27";

   aboutToAppear() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data != null && data['ACTION'] != null) {
        let strValue: string = String(data['ACTION']);
        this.str = strValue;
        console.info('this.str has been updated to: ' + this.str);
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("web click").key('webOnBeforeUnload').onClick((e: ClickEvent) => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitOnBeforeUnload001": {
              try {
                console.log("action of emitOnBeforeUnload is refresh");
                this.controller.runJavaScript("myRefresh()", (result) => {
                  console.log(`The myRefresh() return value is: ${result}`);
                })
              } catch (error: BusinessError) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitOnBeforeUnload002": {
              try {
                this.firstId = 60404;
                this.secondId = 60405;
                console.log("action of emitOnBeforeUnloadAgain is loadUrl new");
                this.controller.runJavaScript("myNewPage()", (result) => {
                  console.log(`The myNewPage() return value is: ${result}`);
                })
              } catch (error: BusinessError) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
          }
        })
      }

      Web({ src: 'resource://rawfile/onBeforeUnloadTest.html', controller: this.controller })
        .key('onBeforeUnloadWebView')
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .onBeforeUnload((event: OnBeforeUnloadEvent): boolean => {
          if (event) {
            Utils.emitEvent(event.url, this.firstId)
            if (event.message === "Is it OK to leave/reload this page?" || event.message === "系统可能不会保存您所做的更改。") {
              Utils.emitEvent(true, this.secondId)
            }
            console.log("event.url:" + event.url)
            console.log("event.message:" + event.message)
            console.log("event.result.handleCancel: " + event?.result.handleCancel());
            console.log("event.result.handleConfirm: " + event?.result.handleConfirm());
          }
          return true
        })
    }
  }
}