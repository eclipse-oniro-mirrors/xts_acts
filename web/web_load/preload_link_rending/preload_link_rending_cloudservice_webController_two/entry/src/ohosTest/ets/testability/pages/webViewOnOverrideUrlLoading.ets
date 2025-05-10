/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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
  
  onPageShow() {
      let valueChangeEvent: events_emitter.InnerEvent = {
          eventId: 10,
          priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }
  
  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
      if (eventData != null) {
          console.info("valueChangeCallBack:" + JSON.stringify(eventData));
          if (eventData.data != null && eventData.data.ACTION != null) {
              this.str = eventData.data.ACTION;
          }
      }
  }
  
  build() {
      Column() {
          Row() {
              Button("web click")
              .key('webViewOnOverrideUrlLoading')
              .onClick(async () => {
                  console.info("key==>" + this.str)
                  await Utils.sleep(3000)
                  switch (this.str) {
                    case "emitWebViewOnOverrideUrlLoading": {
                        this.controller.runJavaScript("jump()", (error, result) => {
                        })
                        await Utils.sleep(1000);
                        this.controller.runJavaScript("isOnOverrideUrlLoading()", (error, result) => {
                            console.log('>>>>>isOnOverrideUrlLoading:' + result)
                            Utils.emitEvent(result, 10007)
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
      }
  }
}
