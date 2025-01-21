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

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(10)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
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
        Button("WebViewControllerRefreshTestButton").key('WebViewControllerRefreshTestButton').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "testRefresh002": {
              try {
                this.controller.loadUrl('resource://rawfile/second.html');
                await Utils.sleep(2000);
                this.titleReceive = ''
                this.controller.refresh();
                await Utils.sleep(2000);
                Utils.emitEvent(this.titleReceive, 76700)
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case "testRefresh003": {
              try {
                this.controller.loadUrl('https://gitee.com/organizations/openharmony/projects');
                await Utils.sleep(6000);
                this.titleReceive = ''
                this.controller.refresh();
                await Utils.sleep(12000);
                if (this.titleReceive == 'OpenHarmony - Open_Harmony - Gitee.com' || this.titleReceive == 'OpenHarmony - Gitee.com') {
                  Utils.emitEvent(true, 76702)
                } else {
                  Utils.emitEvent(false, 76702)
                }
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case "testRefresh004": {
              try {
                let sandboxPath = Utils.copyRawFileToSandbox('second.html')
                this.controller.loadUrl(`file://${sandboxPath}`);
                await Utils.sleep(2000);
                this.titleReceive = ''
                this.controller.refresh();
                await Utils.sleep(2000);
                Utils.emitEvent(this.titleReceive, 76704)
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
    }
  }
}
