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

import { Entry, Component, Column, Row, Button, ClickEvent, Web,  WebResourceResponse, Header, OnTitleReceiveEvent, DetectedBlankScreenReason, BlankScreenDetectionEventInfo, BlankScreenDetectionMethod} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import Utils from '../../src/test/Util.test';
import webView from '@ohos.web.webview';
import emitter from '@ohos.events.emitter';
import events_emitter from '@ohos.events.emitter';
import { BusinessError, Callback, RecordData } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext'
import { canIUse } from '@internal.full.global'
export class StringFields {
  public str: string = '';
}

@Entry
@Component
struct webViewController {
  stringObj: StringFields  = new StringFields ();
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  controller2: webView.WebviewController = new webView.WebviewController(undefined);
  @State str: string = ''
  @State httpErrorReceive: Int = 0
  @State responseCode: Int = 200
  heads: Header[] = new Array<Header>()
  responseWeb: WebResourceResponse = new WebResourceResponse()
  @State title: string = '';
  @State flag: number = 2;
  @State result: boolean = false;
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
        this.stringObj.str = strValue;
        console.info(this.stringObj.str)
      }
    }
  }

  build() {
    Row() {
      Column() {
        Button('WebViewBlankScreenDetectionConfigButton')
          .key('WebViewBlankScreenDetectionConfigButton')
          .onClick((e: ClickEvent) => {
            console.info('key==>' +  this.stringObj.str)
            switch (this.stringObj.str) {
              case "emitWebViewBlankScreenDetectionConfig": {
                try {
                  Utils.emitEvent('onDetectedBlankScreen', 160602)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'emitDetectedBlankScreenReason01': {
                try {
                  this.controller.loadUrl("resource://rawfile/1text.html");
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'emitDetectedBlankScreenReason02': {
                try {
                  this.controller.loadUrl("resource://rawfile/kongbai.html");
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'SwitchNextPageStatic' : {
                let uiContext: UIContext = this.getUIContext();
                let router: Router = uiContext.getRouter();
                router.pushUrl({ url: 'pages/WebViewBypassVsyncCondition' })
                console.log('push URL success')
              }
            }
          })

        Web({ src: 'resource://rawfile/1text.html', controller: this.controller })
          .javaScriptAccess(true)
          .geolocationAccess(true)
          .databaseAccess(true)
          .blankScreenDetectionConfig({
            enable:true,
            detectionTiming:[2,4,6,8],
            contentfulNodesCountThreshold:17,
            detectionMethods:[BlankScreenDetectionMethod.DETECTION_CONTENTFUL_NODES_SEVENTEEN]
          })
          .onDetectedBlankScreen((event: BlankScreenDetectionEventInfo) =>{
            console.log(`Found blank screen on ${event.url}.`);
              console.log("event.blankScreenReason: "+ event.blankScreenReason);
              if (event.blankScreenReason == DetectedBlankScreenReason.SUB_THRESHOLD_CONTENTFUL_NODES) {
                Utils.emitEvent(true, 160600)
              } else  {
                Utils.emitEvent(true, 160601)
              }


          })
      }
    }
  }
}
