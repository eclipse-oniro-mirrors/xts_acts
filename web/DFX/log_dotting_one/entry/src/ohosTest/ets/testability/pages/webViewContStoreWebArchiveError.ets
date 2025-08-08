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
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import Utils from '../../test/Utils';
import web_webview from '@ohos.web.webview';
interface objectCss {
  code: number;
  message: string;
}
@Entry
@Component
struct webViewContStoreWebArchiveError {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  controllerTwo: web_webview.WebviewController = new web_webview.WebviewController();
  @State str: string = "emitStoreWebArchiveCallBackInitErr";
  @State userAgent: string = "Mozilla/5.0 (Window NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko)" +
    " CHrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.27";
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State errorCode: string = '0';
  @State errorTestCode: number = 0;
  @State errorMsg: string = 'failed';

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("webViewContStoreWebArchiveError page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data?.ACTION;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("storeWebArchiveErrorTest").key('webViewContStoreWebArchiveError').onClick(() => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitStoreWebArchiveCallBackInitErr": {
              try {
                this.controllerTwo.storeWebArchive("/data/storage/el2/base/", true, (error, filename) => {
                  if (error) {
                    console.info(`save web archive error: ` + JSON.stringify(error));
                    return;
                  }
                  if (filename != null) {
                    console.info(`save web archive success: ${filename}`);
                  }
                });
              } catch (error) {
                console.error(`emitStoreWebArchiveCallBackInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 700)
              Utils.emitEvent(this.errorMsg, 701)
              break;
            }
            case "emitStoreWebArchiveCallBackPathErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controller.storeWebArchive("/ErrorPath/Error/Err/E12345/Error.html", false, (error, filename) => {
                  if (error) {
                    console.info(`save web archive error: ` + JSON.stringify(error));
                    this.errorTestCode = error.code;
                    this.errorMsg = error.message;
                    console.error("emitStoreWebArchiveCallBackPathErr storeWebArchive return result is :" + this.errorTestCode + this.errorMsg);
                    Utils.emitEvent(this.errorTestCode, 702)
                    Utils.emitEvent(this.errorMsg, 703)
                    return;
                  }
                  if (filename != null) {
                    console.info(`save web archive success: ${filename}`);
                  }
                });
              } catch (error) {
                console.error(`emitStoreWebArchiveCallBackPathErr ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitStoreWebArchiveCallBackUnAccessErr": {
              try {
                this.errorTestCode = 0;
                this.errorMsg = 'failed';
                this.controller.storeWebArchive("/proc/sys/net/core/", true, (error, filename) => {
                  if (error) {
                    console.info(`save web archive error: ` + JSON.stringify(error));
                    this.errorTestCode = error.code;
                    this.errorMsg = error.message;
                    console.error("emitStoreWebArchiveCallBackUnAccessErr storeWebArchive return result is :" + this.errorTestCode + this.errorMsg);
                    Utils.emitEvent(this.errorTestCode, 704)
                    Utils.emitEvent(this.errorMsg, 705)
                    return;
                  }
                  if (filename != null) {
                    console.info(`save web archive success: ${filename}`)
                  }
                });
              } catch (error) {
                console.error(`emitStoreWebArchiveCallBackUnAccessErr ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "emitStoreWebArchivePromiseInitErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controllerTwo.storeWebArchive("/data/storage/el2/base/", true)
                  .then(filename => {
                    if (filename != null) {
                      console.info(`save web archive success: ${filename}`);
                    }
                  })
                  .catch((error:objectCss) => {
                    console.log('error: ' + JSON.stringify(error));
                  })
              } catch (error) {
                console.error(`emitStoreWebArchivePromiseInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 706)
              Utils.emitEvent(this.errorMsg, 707)
              break;
            }
            case "emitStoreWebArchivePromisePathErr": {
              try {
                this.errorTestCode = 0;
                this.errorMsg = 'failed';
                this.controller.storeWebArchive("/ErrorPath/Error/Err/E12345/Error.html", false)
                  .then(filename => {
                    if (filename != null) {
                      console.info(`save web archive success: ${filename}`);
                    }
                  })
                  .catch((error:objectCss) => {
                    console.log('error: ' + JSON.stringify(error));
                    this.errorTestCode = error.code;
                    this.errorMsg = error.message;
                    console.error("emitStoreWebArchivePromisePathErr storeWebArchive return result is :" + this.errorTestCode + this.errorMsg);
                    Utils.emitEvent(this.errorTestCode, 708)
                    Utils.emitEvent(this.errorMsg, 709)
                  })
              } catch (error) {
                console.error(`emitStoreWebArchivePromisePathErr ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitStoreWebArchivePromiseUnAccessErr": {
              try {
                this.errorTestCode = 0;
                this.errorMsg = 'failed';
                this.controller.storeWebArchive("/proc/sys/net/core/", true)
                  .then(filename => {
                    if (filename != null) {
                      console.info(`save web archive success: ${filename}`);
                    }
                  })
                  .catch((error:objectCss) => {
                    console.log('error: ' + JSON.stringify(error));
                    this.errorTestCode = error.code;
                    this.errorMsg = error.message;
                    console.error("emitStoreWebArchivePromiseUnAccessErr storeWebArchive return result is :" + this.errorTestCode + this.errorMsg);
                    Utils.emitEvent(this.errorTestCode, 710)
                    Utils.emitEvent(this.errorMsg, 711)
                  })
              } catch (error) {
                console.error(`emitStoreWebArchivePromiseUnAccessErr ErrorCode: ${error.code},  Message: ${error.message}`);
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
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .userAgent(this.userAgent)
    }
  }
}