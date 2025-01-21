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

@Entry
@Component
struct WebControllerLoadUrlTest {
  controller: WebController = new WebController()
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
        this.titleReceive = '';
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("WebControllerLoadUrlTestButton").key('WebControllerLoadUrlTestButton').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "testLoadUrl005": {
              try {
                this.controller.loadUrl({ url: 'resource://rawfile/second.html',
                  headers: [{
                    headerKey: "customHeaderKey",
                    headerValue: "customHeaderValue"
                  }]
                });
                await Utils.sleep(3000);
                Utils.emitEvent(this.titleReceive, 76006)
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case "testLoadUrl006": {
              try {
                this.controller.loadUrl({ url: 'www.OpenHarmony.cn',
                  headers: [{
                    headerKey: "customHeaderKey",
                    headerValue: "customHeaderValue"
                  }]
                });
                await Utils.sleep(3000);
                Utils.emitEvent(this.titleReceive, 76008)
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case "testLoadUrl007": {
              try {
                this.controller.loadUrl({ url: $rawfile('second.html'),
                  headers: [{
                    headerKey: "customHeaderKey",
                    headerValue: "customHeaderValue"
                  }]
                });
                await Utils.sleep(3000);
                Utils.emitEvent(this.titleReceive, 76010)
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case "testLoadUrl008": {
              try {
                let sandboxPath = Utils.copyRawFileToSandbox('second.html')
                this.controller.loadUrl({ url: `file://${sandboxPath}`,
                  headers: [{
                    headerKey: "customHeaderKey",
                    headerValue: "customHeaderValue"
                  }]
                });
                await Utils.sleep(3000);
                Utils.emitEvent(this.titleReceive, 76012)
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
