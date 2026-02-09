/*
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

import Utils from '../../test/Utils';
import events_emitter from '@ohos.events.emitter';
import webView from '@ohos.web.webview';
import { waitForExist } from '../../test/WaitTest.test';
import { Driver,MouseButton } from '@ohos.UiTest';
@Entry
@Component
struct WebZoomControlAccess {
  @State str: string = ""
  @State zoom: number = 0
  @State zoomState: string = ''
  @State userAgentPC:string = "";
  @State isComplete: number = -1;
  @State isReceive: number = -1;
  @State flag: number = -1;
  @State clientWidth01: number = 0;
  webController: webView.WebviewController = new webView.WebviewController();

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 153041,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(153041)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("WebZoomControlAccess").key('WebZoomControlAccessButton').onClick(async () => {
          await waitForExist(() => this.isComplete, this.str, 0);
          await waitForExist(() => this.isReceive, this.str, 0);
          this.isReceive = -1;
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitWebZoomControlAccess001": {
              // crtl＋滚轮
              this.webController.runJavaScript("changeFontStyle()").then((res) => {
                if(res) {
                  console.log('emitWebZoomControlAccess003333' + res )
                  this.clientWidth01 = Number(res)
                }
              })
              let webRect = Utils.getComponentRect('ZoomControlAccessKey');
              let downX = Math.round(globalThis.winLeft + webRect.left + (webRect.right - webRect.left) / 2);
              let downY = Math.round(globalThis.winTop + webRect.top + (webRect.bottom - webRect.top) / 2);
              this.flag = 1;
              this.isComplete = -1;
              let driver: Driver = Driver.create();
              await driver.mouseScroll({x:downX + 20, y:downY +150}, true, 30, 2072)
              await waitForExist(()=>this.isComplete, this.str, 0);
              this.webController.runJavaScript("changeFontStyle()").then((res) => {
                if(res) {
                  console.log('emitWebZoomControlAccess00444' + res )
                  let clientWidth02 = Number(res)
                  if(clientWidth02 > this.clientWidth01 || clientWidth02 == this.clientWidth01) {
                    Utils.emitEvent(true, 20251213)
                  }
                }
              })
              break;
            }


          }
        })
      }

      Web({ src: $rawfile('basic.html'), controller: this.webController }).key('ZoomControlAccessKey')
        .width('100%')
        .height('50%%')
        .zoomControlAccess(true)
        .onPageEnd((event) => {
          console.log('onPageEnd ==>' + event.url);
          this.isComplete = 0
        })
     }
  }
}
