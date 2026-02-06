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
import web_webview from '@ohos.web.webview';
import Utils from '../../test/Utils';
import {waitForAssert, waitForExist} from '../../test/WaitTest.test';

class DataTrans {
  constructor() {
  }

  trans() {
    return "obj"
  }
}

@Entry
@Component
struct webViewJsBridgeLastJsProxyCallingFrameUrl {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  handler: FullScreenExitHandler = new FullScreenExitHandler();
  @State str: string = "emitJsBridgeLastJavascriptProxyCallingFrameUrl";
  @State webUrl: string = "loading_func_page.html";
  @State check: string = "null";
  @State getUrlStr: string = "";
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 172370,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(172370)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('getLastJavascriptProxyCallingFrameUrl page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("获取url")
          .key('webViewJsBridgeLastJsProxyCallingFrameUrl')
          .onClick(async () => {
            console.info('key==>' + this.str)
            await waitForExist(() => this.isPageEnd, this.str, 0);
            await waitForExist(() => this.isReceive, this.str, 0);
            this.isReceive = -1;
            switch (this.str) {
              case "emitJsBridgeGetLastJavascriptProxyCallingFrameUrl": {
                let transObj_02 = new DataTrans()
                this.controller.registerJavaScriptProxy(transObj_02, "dataTrans", ["trans"])
                this.controller.refresh()
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile(this.webUrl))
                await waitForExist(() => this.isPageEnd, this.str, 0);
                Utils.emitEvent('success', 172380)
                break;
              }
            }
          })
      }

      Web({ src: 'metaViewport.html', controller: this.controller })
        .javaScriptAccess(true)
        .fileAccess(true)
        .imageAccess(true)
        .domStorageAccess(true)
        .onlineImageAccess(true)
        .databaseAccess(true)
        .onPageEnd(async () => {
          this.isPageEnd = 0;
          try {
            this.getUrlStr = this.controller.getLastJavascriptProxyCallingFrameUrl()
            if (this.getUrlStr == this.webUrl) {
              this.check = 'success'
            } else {
              this.check = 'fail'
            }
            console.log('=====>getLastJavascriptProxyCallingFrameUrl | result {" + this.getUrlStr + "}')
            Utils.emitEvent('success', 172380)
          } catch (error) {
            console.log('getLastJavascriptProxyCallingFrameUrl ' + error)
            Utils.emitEvent("error", 172380)
          }
        })
    }
  }
}
