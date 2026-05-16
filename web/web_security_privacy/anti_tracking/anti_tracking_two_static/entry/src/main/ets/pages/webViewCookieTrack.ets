/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '../../../hypium/index';
import testsuite from '../../src/test/List.test';
import fs from '@ohos.file.fs';
import { OnErrorReceiveEvent,IntelligentTrackingPreventionDetails,CacheMode,OnPageEndEvent,$rawfile,OnRenderExitedEvent, OnPageBeginEvent, RenderProcessNotRespondingReason, RenderProcessNotRespondingData, Entry, Component, Column, Row, Button, ClickEvent, Web } from "@ohos.arkui.component"
import { State } from "@ohos.arkui.stateManagement"
import web_webview from '@ohos.web.webview'
import { BusinessError } from '@ohos.base';
import Utils from '../../src/test/Util.test';
import events_emitter from '@ohos.events.emitter';
import { Callback } from '@ohos.base'
import image from '@ohos.multimedia.image';
import webView from '@ohos.web.webview';
import { JsProxyObject } from '../../src/test/Interfaces';
import { AppStorage } from 'arkui.stateManagement.storage.appStorage'
import emitter from '@ohos.events.emitter';
import { Callback, RecordData } from '@ohos.base'
import events_emitter from '@ohos.events.emitter';
class DataTrans {
  constructor() {
  }

  trans() {
    return "obj"
  }
}

class StringFields {
  public str: string = '';
}

@Entry
@Component
struct webViewCookieTrack {
  stringObj: StringFields  = new StringFields ();
  controller: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  @State emitKey: string = "emitCookieTrackRemoveTrackingPrevention";
  @State getUrlStr: string = ""
  @State cookie: string = ""
  @State whiteUrlList: Array<string> = ["mc.yandex.ru","hm.baidu.com"]
  @State webUrl: string = ""
  @State pageStatus: string = 'add'
  @State traceHosts: Array<string> = new Array<string>()
  @State str:string = ""

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
    }
  }
}

  build() {
    Column() {
      Row() {
        Button("获取url").key('webViewCookieTrackTriggerButton')
          .onClick( (e:ClickEvent) => {
            console.info("key==>" +  this.stringObj.str)
            switch ( this.stringObj.str) {
              case 'testRemoveIntelligentTrackingPreventionBypassingListError001': {
                try {
                  let list = ['www.test1.com','www.test2.com'];
                  webView.WebviewController.removeIntelligentTrackingPreventionBypassingList(list);
                  Utils.emitEvent('401',202503208)
                } catch (e) {
                  e = e as BusinessError;
                  let check = (v1: string, v2: string): boolean => {
                    return v1 == v2 ? true: false;
                  }
                  Utils.emitEvent('401',202503208)
                }
                break;
              }
              case "emitWebViewCookieTrackEnableTrue": {
                this.controller.enableIntelligentTrackingPrevention(true)
                this.controller.refresh()
                Utils.emitEvent(true,7701)
                Utils.emitEvent(this.controller.isIntelligentTrackingPreventionEnabled() == true, 7701)
              }
              case "emitWebViewCookieTrackEnableFalse": {
                this.controller.enableIntelligentTrackingPrevention(false)
                this.controller.refresh()
                Utils.emitEvent(this.controller.isIntelligentTrackingPreventionEnabled() == false, 1278)
                break;
              }
              case "emitCookieTrackClearTrackingPrevention": {
                  let beforeTraceLength = this.traceHosts.length
                  console.log("this.traceHosts before: " + this.traceHosts)
                  web_webview.WebviewController.addIntelligentTrackingPreventionBypassingList(this.whiteUrlList)
                  this.controller.refresh()
                  console.log("this.traceHosts afterAdd: " + this.traceHosts)
                  let afterAddTraceLength = this.traceHosts.length
                  web_webview.WebviewController.clearIntelligentTrackingPreventionBypassingList()
                  this.controller.refresh()
                  console.log("this.traceHosts afterClear: " + this.traceHosts)
                  let afterClearTraceLength = this.traceHosts.length
                  Utils.emitEvent(beforeTraceLength >= 0 && beforeTraceLength <= afterAddTraceLength && afterClearTraceLength >= afterAddTraceLength, 1282)
                  Utils.emitEvent(true, 1282)
                break;
              }
            }
          })

      }
      Web({ src: 'https://www.baidu.com', controller: this.controller })
        .javaScriptAccess(true)
        .onErrorReceive((event: OnErrorReceiveEvent): void => {
          if (event) {
            console.log('getErrorInfo:' + event.error.getErrorInfo())
            console.log('getErrorCode:' + event.error.getErrorCode())
            console.log('url:' + event.request.getRequestUrl())
            console.log('isMainFrame:' + event.request.isMainFrame())
            console.log('isRedirect:' + event.request.isRedirect())
            console.log('isRequestGesture:' + event.request.isRequestGesture())
            console.log('getRequestHeader_headerKey:' + event.request.getRequestHeader().toString())
            let result = event.request.getRequestHeader()
            console.log('The request header result size is ' + result.length)
            for (let i of result) {
              console.log('The request header key is : ' + i.headerKey + ', value is : ' + i.headerValue)
            }
          }
        })
        .zoomAccess(false)
        .databaseAccess(true)
    }
  }
}
