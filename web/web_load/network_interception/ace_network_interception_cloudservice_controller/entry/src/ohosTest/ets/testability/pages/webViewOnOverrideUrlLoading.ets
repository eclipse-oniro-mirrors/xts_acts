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
import events_emitter from '@ohos.events.emitter';
import { Hypium } from '@ohos/hypium'
import Utils from '../../test/Utils';
import web_webview from '@ohos.web.webview'
import { waitForExist } from '../../test/WaitTest';

@Entry
@Component
struct webViewOnMetaOnOverriderUrlLoading {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  handler: FullScreenExitHandler = new FullScreenExitHandler();
  @State str: string = "emitWebViewOnOverrideUrlLoading";
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = true;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State checkEleResult: string = "";
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  
  onPageShow() {
      let valueChangeEvent: events_emitter.InnerEvent = {
          eventId: 142001,
          priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }
  onPageHide() {
    events_emitter.off(142001)
  }
  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
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
              Button("web click")
              .key('webViewOnOverrideUrlLoading')
              .onClick(async () => {
                await waitForExist(() => this.isReceive, this.str, 0);
                await waitForExist(() => this.isPageEnd, this.str, 0);
                  console.info("key==>" + this.str)
                  switch (this.str) {
                    case "emitWebViewOnOverrideUrlLoading": {
                        this.controller.runJavaScript("jump()", (error, result) => {
                        })
                        this.controller.runJavaScript("isOnOverrideUrlLoading()", (error, result) => {
                            console.log('>>>>>isOnOverrideUrlLoading:' + result)
                            Utils.emitEvent(result, 142010)
                        })
                        break;
                    }
                }
              })
          }
          Web({ src: $rawfile('onOverRideUrlLoading.html'), controller: this.controller })
                .javaScriptAccess(this.javaScriptAccess)
                .fileAccess(this.fileAccess)
                .imageAccess(this.imageAccess)
                .domStorageAccess(this.domStorageAccess)
                .onlineImageAccess(this.onlineImageAccess)
                .databaseAccess(this.databaseAccess)
                .onOverrideUrlLoading((webResourceRequest: WebResourceRequest) => {
                    if (webResourceRequest && webResourceRequest.getRequestUrl() == "https://www.baidu.com/") {
                        return true;
                    }
                    return false;
                })
            .onPageEnd(()=>{
              this.isPageEnd = 0
            })
      }
  }
}
