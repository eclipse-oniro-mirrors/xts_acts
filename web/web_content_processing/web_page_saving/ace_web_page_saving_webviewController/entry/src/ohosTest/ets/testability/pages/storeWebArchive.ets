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
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import Utils from '../../test/Utils';
import web_webview from '@ohos.web.webview';
import business_error from '@ohos.base'

@Entry
@Component
struct Index {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State str: string = "emitStoreWebArchiveCallback";
  @State webId: number = 0;
  @State webResult: string = ' ';
  @State proResult: string = ' ';
  @State webFilename: string = ' ';
  @State errorResult: string = ' ';
  @State userAgent: string = "Mozilla/5.0 (Window NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) CHrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.27";
  @State pageResult: boolean = false;
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false
  @State imageAccess: boolean = true
  @State onlineImageAccess: boolean = true
  @State databaseAccess: boolean = true

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
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
        Button("web test").key('webcomponent02').onClick(() => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitStoreWebArchiveCallback": {
              try {
                console.info("testoooooooooooooooooooooooooooooooooooo");
                this.controller.storeWebArchive("/data/storage/el2/base/", true, (error, filename) => {
                  if (error) {
                    console.info(`save web archive error: ` + JSON.stringify(error))
                    return;
                  }
                  if (filename != null) {
                    console.info(`save web archive success: ${filename}`)
                    this.webFilename = filename
                    Utils.emitEvent(this.webFilename, 130)
                  }
                });
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitStoreWebArchiveCallbackFalse": {
              try {
                console.info("testAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
                this.controller.storeWebArchive("/data/storage/el2/base/index.html.mht", false, (error, filename) => {
                  if (error) {
                    console.info(`save web archive error: ` + JSON.stringify(error))
                    return;
                  }
                  if (filename != null) {
                    console.info(`save web archive success: ${filename}`)
                    this.webFilename = filename
                    Utils.emitEvent(this.webFilename, 132)
                  }
                });
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitStoreWebArchivePromise": {
              try {
                console.info("testBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB");
                this.controller.storeWebArchive("/data/storage/el2/base/", true)
                  .then(filename => {
                    if (filename != null) {
                      this.webFilename = filename
                      Utils.emitEvent(this.webFilename, 134)
                      console.info(`save web archive success: ${filename}`)
                    }
                  })
                  .catch((error:business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(error));
                  })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitStoreWebArchivePromiseFlase": {
              try {
                console.info("testCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC");
                this.controller.storeWebArchive("/data/storage/el2/base/index.html-2.mht", false)
                  .then(filename => {
                    if (filename != null) {
                      this.webFilename = filename
                      Utils.emitEvent(this.webFilename, 136)
                      console.info(`save web archive success: ${filename}`)
                    }
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(error));
                  })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
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
