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

import webView from '@ohos.web.webview';
import Utils from '../../test/Utils';
import events_emitter from '@ohos.events.emitter';
import { waitForExist } from '../../test/WaitTest.test';
@Entry
@Component
struct WebAttributeTest {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = ""
  @State initialScale: number = 100
  @State newScale: number = 0
  @State oldScale: number = 0
  @State text: boolean = true;
  @State isScaleEnd: number = -1
  @State isPageEnd: number = -1
  @State isReceive: number = -1
  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 153860,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(153860)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
       this.isReceive = 0;
        try {
          this.controller.loadUrl("resource://rawfile/index.html");
        } catch (error) {
          console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
        }
      }
    }
  }

  build() {
    Row() {
      Column() {
        Button("web click")
          .key('WebAttributeTestButton')
          .focusable(true)
          .onFocus(() => {
            console.log("onFocus==>")
          })
          .onBlur(() => {
            console.log("onBlur==>")
          })
          .onClick(async () => {
            await waitForExist(() => this.isPageEnd, this.str, 0);
            await waitForExist(() => this.isReceive, this.str, 0);
            this.isReceive = -1;
            console.info('zbr111111111::' + this.str);
            switch (this.str) {
              case "emitInitialScale001": {
                try {
                 this.isScaleEnd = -1;
                  this.initialScale = 120
                  await Utils.waitForExist(()=>this.isScaleEnd,'WebSetNetErrorCode2ButtonlsReceive',1,1000);
                  this.isPageEnd =-1;
                  this.controller.loadUrl("resource://rawfile/index.html");
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  Utils.emitEvent(`oldScale=${this.oldScale},newScale=${this.newScale}`, 153870);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitInitialScale002": {
                try {
                  this.isScaleEnd = -1;
                  this.initialScale = 100;
                  await Utils.waitForExist(()=>this.isScaleEnd,'WebSetNetErrorCode2ButtonlsReceive',1,1000);
                  this.isScaleEnd = -1;
                  this.initialScale = 90
                  await Utils.waitForExist(()=>this.isScaleEnd,'WebSetNetErrorCode2ButtonlsReceive',1,1000);
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/index.html");
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  Utils.emitEvent(`oldScale=${this.oldScale},newScale=${this.newScale}`, 153880)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitOnScaleChange": {
                try {
                  console.info('zbr22222::' + this.str);
                  this.isScaleEnd = -1;
                  this.initialScale = 100
                  await Utils.waitForExist(()=>this.isScaleEnd,'WebSetNetErrorCode2ButtonlsReceive',1,1000);
                  console.info('zbr1' + this.initialScale);
                  this.isScaleEnd = -1;
                  this.initialScale = 110
                  await Utils.waitForExist(()=>this.isScaleEnd,'WebSetNetErrorCode2ButtonlsReceive',1,1000);
                  console.info('zbr2' + this.initialScale);
                  this.isPageEnd =-1;
                  this.controller.loadUrl("resource://rawfile/index.html")
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  console.info('zbr3' + this.isPageEnd);
                  Utils.emitEvent(`oldScale=${this.oldScale},newScale=${this.newScale}`, 153890)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitZoomTwo": {
                try {
                  this.text = false;
                  this.isPageEnd =-1;
                  this.controller.loadUrl("resource://rawfile/index.html")
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.controller.zoom(1);
                } catch (error) {
                  console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                  Utils.emitEvent(`${error.code}`, 153900);
                }
                break;
              }
            }
          })

        Web({ src: $rawfile('index.html'), controller: this.controller })
          .key('webView')
          .height('50%')
          .fileAccess(true)
          .zoomAccess(this.text)
          .width('100%')
          .javaScriptAccess(true)
          .horizontalScrollBarAccess(true)
          .verticalScrollBarAccess(true)
          .initialScale(this.initialScale)
          .userAgent('Mozilla/5.0 (Windows NT 10.0; WOW64)')
          .onPageEnd((event) => {
            console.info(' zbr web pageEnd==>' + event.url);
            this.isPageEnd = 0;
          })
          .onScaleChange((event) => {
            console.info('zbr onScaleChange called oldScale :' + event.oldScale)
            console.info('zbr onScaleChange called newScale :' + event.newScale)
            this.oldScale = event.oldScale
            this.newScale = event.newScale
            this.isScaleEnd = 1;
          })
      }
      .width('100%')
    }

    .height('100%')
  }
}