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
import image from "@ohos.multimedia.image"

@Entry
@Component
struct OnWindowNew {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State str: string = "emitOnWindowNew01";
  @State testMultiWindowAccess: boolean = true;
  @State testAllowWindowOpenMethod: boolean = true;
  @State block: boolean = false;
  @State ref: number = 0;
  @State eventId: number = 0;
  @State userAgent: string = "Mozilla/5.0 (Window NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) CHrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.27";
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = true;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State arr: boolean = true;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("OnWindowNew page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("web click").key('onWindowNew').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitOnWindowNew01": {
              try {
                this.ref = 0;
                this.javaScriptAccess = true;
                this.testAllowWindowOpenMethod = true;
                this.testMultiWindowAccess = true;
                this.controller.runJavaScript("OpenNewWindow()", (res) => {
                  Utils.emitEvent(this.ref, 7100)
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitOnWindowNew02": {
              try {
                this.ref = 0;
                this.javaScriptAccess = true;
                this.testAllowWindowOpenMethod = false;
                this.testMultiWindowAccess = true;
                setTimeout(() => {
                  this.controller.runJavaScript("OpenNewWindow()", (res) => {
                    Utils.emitEvent(this.ref, 7102)
                  })
                }, 2000)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitOnWindowNew03": {
              try {
                this.ref = 0;
                this.javaScriptAccess = false;
                this.testAllowWindowOpenMethod = false;
                this.testMultiWindowAccess = true;
                this.controller.runJavaScript("OpenNewWindow()", (res) => {
                  Utils.emitEvent(this.ref, 7104)
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitOnWindowNew04": {
              try {
                this.ref = 0;
                this.javaScriptAccess = true;
                this.testAllowWindowOpenMethod = false;
                this.testMultiWindowAccess = false;
                this.controller.runJavaScript("OpenNewWindow()", (res) => {
                  Utils.emitEvent(this.ref, 7106)
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitOnPageVisibleLoadUrl": {
              try {
                this.eventId = 7108;
                this.controller.loadUrl($rawfile('index.html'));
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitOnPageVisibleRefresh": {
              try {
                this.eventId = 7110;
                this.controller.refresh();
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitBlockNetWorkTrue": {
              try {
                this.block = true;
                await Utils.sleep(2000);
                this.controller.loadUrl('www.weibo.com');
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitBlockNetWorkFalse": {
              try {
                this.block = false;
                await Utils.sleep(2000);
                this.controller.loadUrl('www.weibo.com');
                let testTitle = this.controller.getTitle();
                console.log(`testTitle is: ${testTitle}`);
                Utils.emitEvent(testTitle, 7114)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitGetOriginsPromiseLoadLocalHtml01": {
              this.arr = false
              let length = -1;
              try {
                this.controller.loadUrl($rawfile('getOrigins.html'));
                setTimeout(() => {
                  web_webview.WebStorage.getOrigins()
                    .then(origins => {
                      console.log(`getOrigins call`);
                      length = origins.length;
                      console.log(`length is: ${length}`);
                      Utils.emitEventTwo(1, length, 7166);
                      console.log(`getOrigins call end`);
                    })
                }, 2000)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(length, 7166);
              }
              break;
            }
          }
        })
      }

      Web({ src: $rawfile("onWindowNew.html"), controller: this.controller })
        .multiWindowAccess(this.testMultiWindowAccess)
        .javaScriptAccess(this.javaScriptAccess)
        .allowWindowOpenMethod(this.testAllowWindowOpenMethod)
        .onWindowNew((event) => {
          console.log("onWindowNew start");
          if (event) {
            console.log('this.ref ===:' + this.ref);
            this.ref += 1;
            event.handler.setWebController(null);
          }
        })
        .onPageVisible((event) => {
          if (this.arr) {
            if (event) {
              console.log('onWindowNew onPageVisible url:' + event.url);
              Utils.emitEvent(event.url, this.eventId);
            }
          }
        })
        .blockNetwork(this.block)
        .onErrorReceive((event) => {
          console.log(`onWindowNew onErrorReceive start`);
          if (event) {
            let Url = event.request.getRequestUrl()
            console.log(`onWindowNew onErrorReceive Url is: ${Url}`);
            Utils.emitEvent(Url, 7112);
          }
        })
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .userAgent(this.userAgent)
    }
  }
}