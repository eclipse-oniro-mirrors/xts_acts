/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import events_emitter from '@ohos.events.emitter';
import Utils from '../../test/Utils';
import webView from '@ohos.web.webview';
import { window, KeyboardAvoidMode } from '@kit.ArkUI'
const EVENT_ID_SET_SUITE_KEY = 181202;



@Entry
@Component
struct WebEmulateTouchFromMouseEventTest {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = "";
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State zoomAccess: boolean = false;
  @State newScale: number = 0
  @State oldScale: number = 0
  @State userAgentPC:string = "";
  @State flag: boolean = false;
  @State compareScale: number = 0
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;
  @State isPointerEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_SUITE_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_SUITE_KEY)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 1;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("Web Button").key('WebEmulateTouchFromMouseEventButton').onClick(async () => {
          console.info("key==>" + this.str)
          await Utils.waitForExist(()=>this.isReceive, this.str+' isReceive', 1, 1000);
          await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
          switch (this.str) {
            case "emitWebEmulateTouchFromMouseEvent001": {
                try {
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/autofill.html")
                  await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                  Utils.emitEvent('emulateTouchFromMouseEvent', 20251212)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
            }
            case "emitWebEmulateTouchFromMouseEvent002": {
                try {
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/autofill.html")
                  await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                  Utils.emitEvent(true, 20251214)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
            }
          }
        })
      }

      Web({ src: $rawfile("autofill.html"), controller: this.controller, emulateTouchFromMouseEvent:undefined })
      //   //图片加载相关权限
        .imageAccess(true)
        .domStorageAccess(true)
        .onlineImageAccess(true)
        //支持缩放
        .zoomAccess(true)
        //支持JS代码运行
        .javaScriptAccess(true)
        .overviewModeAccess(true)
        .pinchSmooth(true)
        .fileAccess(true)
        .mixedMode(MixedMode.All).height("25%")
        .cacheMode(CacheMode.None).keyboardAvoidMode(WebKeyboardAvoidMode.OVERLAYS_CONTENT)

      Web({ src: $rawfile("autofill.html"), controller: this.controller, emulateTouchFromMouseEvent:null })
      //   //图片加载相关权限
        .imageAccess(true)
        .domStorageAccess(true)
        .onlineImageAccess(true)
        //支持缩放
        .zoomAccess(true)
        //支持JS代码运行
        .javaScriptAccess(true)
        .overviewModeAccess(true)
        .pinchSmooth(true)
        .fileAccess(true)
        .mixedMode(MixedMode.All).height("25%")
        .cacheMode(CacheMode.None).keyboardAvoidMode(WebKeyboardAvoidMode.OVERLAYS_CONTENT)

      Web({ src: $rawfile("autofill.html"), controller: this.controller, emulateTouchFromMouseEvent:true })
        .imageAccess(true)
        .domStorageAccess(true)
        .onlineImageAccess(true)
        //支持缩放
        .zoomAccess(true)
        //支持JS代码运行
        .javaScriptAccess(true)
        .overviewModeAccess(true)
        .pinchSmooth(true)
        .fileAccess(true)
        .mixedMode(MixedMode.All).height("25%")
        .cacheMode(CacheMode.None).keyboardAvoidMode(WebKeyboardAvoidMode.OVERLAYS_CONTENT)

      Web({ src: $rawfile("autofill.html"), controller: this.controller, emulateTouchFromMouseEvent:false })
        .imageAccess(true)
        .domStorageAccess(true)
        .onlineImageAccess(true)
        //支持缩放
        .zoomAccess(true)
        //支持JS代码运行
        .javaScriptAccess(true)
        .overviewModeAccess(true)
        .pinchSmooth(true)
        .fileAccess(true)
        .mixedMode(MixedMode.All).height("25%")
        .cacheMode(CacheMode.None).keyboardAvoidMode(WebKeyboardAvoidMode.OVERLAYS_CONTENT)

    }
  }
}