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
import Utils from '../../test/Utils';
import webView from '@ohos.web.webview';

const EVENT_ID_SET_EMIT_KEY = 201160;

@Entry
@Component
struct WebViewControllerRefreshTest {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = ""
  @State titleReceive: string = ""
  @State javaScriptAccess: boolean = true
  @State fileAccess: boolean = true
  @State domStorageAccess: boolean = false
  @State imageAccess: boolean = true
  @State geolocationAccess: boolean = true
  @State onlineImageAccess: boolean = true
  @State databaseAccess: boolean = true
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_EMIT_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_EMIT_KEY)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 1;
        this.titleReceive = ''
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("WebViewControllerRefreshTestButton").key('WebViewControllerRefreshTestButton').onClick(async () => {
          await Utils.waitForExist(()=>this.isReceive, 'WebViewControllerRefreshTestButtonIsReceive', 1, 1000);
          await Utils.waitForExist(()=>this.isPageEnd, 'WebViewControllerRefreshTestButtonIsPageEnd', 1, 1000);
          console.info("key==>" + this.str)
          this.isReceive = -1;
          switch (this.str) {
            case "testRefresh002": {
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl('resource://rawfile/second.html');
                await Utils.waitForExist(()=>this.isPageEnd, 'loadUrlIsPageEnd', 1, 1000);
                this.isPageEnd = -1;
                this.controller.refresh();
                await Utils.waitForExist(()=>this.isPageEnd, 'refreshIsPageEnd', 1, 1000);
                Utils.emitEvent(this.titleReceive, 201170)
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case "testRefresh003": {
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl('www' + '.example.' + 'com');
                await Utils.waitForExist(()=>this.isPageEnd, 'loadUrlIsPageEnd', 1, 1000);
                this.isPageEnd = -1;
                this.controller.refresh();
                await Utils.waitForExist(()=>this.isPageEnd, 'refreshIsPageEnd', 1, 1000);
                if (this.titleReceive == 'Example Domain') {
                  Utils.emitEvent(true, 201180)
                } else {
                  Utils.emitEvent(false, 201180)
                }
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case "testRefresh004": {
              try {
                this.isPageEnd = -1;
                let sandboxPath = Utils.copyRawFileToSandbox('second.html')
                this.controller.loadUrl(`file://${sandboxPath}`);
                await Utils.waitForExist(()=>this.isPageEnd, 'loadUrlIsPageEnd', 1, 1000);
                this.isPageEnd = -1;
                this.controller.refresh();
                await Utils.waitForExist(()=>this.isPageEnd, 'refreshIsPageEnd', 1, 1000);
                Utils.emitEvent(this.titleReceive, 201190)
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .geolocationAccess(this.geolocationAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .onTitleReceive((event) => {
          if (event) {
            console.log('onTitleReceive title:' + event.title)
            this.titleReceive = event.title
          }
        })
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url);
          this.isPageEnd = 1;
        })
    }
  }
}