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

import Utils from '../../test/Utils';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import { JsProxyObject } from '../../test/Interfaces';
import image from '@ohos.multimedia.image';

const EVENT_ID_SET_EMIT_KEY = 200820;

@Entry
@Component
struct webViewControllerPart2 {
  controller: webView.WebviewController = new webView.WebviewController();
  controllerone: webView.WebviewController = new webView.WebviewController();
  @State str: string = ""
  @State onScrollCallBack: boolean = false
  @State javaScriptAccess: boolean = true
  @State icon: image.PixelMap | undefined = undefined;
  @State onShowFileSelectorCallBack: boolean = false
  @State FileSelectorParamGetTitle: string = ''
  @State FileSelectorParamGetGetMode: number = 100
  @State FileSelectorParamGetGetAcceptType: Array<String> = []
  @State userAgent: string = "Mozilla/5.0 (X11; Linux aarch64) AppleWebKit/537.36 " +
    "(KHTML, like Gecko) Chrome/99.0.4844.88 Mobile Safari/537.36";
  @State uri: string = "file://docs/storage/Users/currentUser/Documents/1.json";
  @State FileSelectorParamGetIsCapture: boolean = true
  @State FileSelectorResultHandleFileList: Array<String> = []
  @State numberOfMatches: number = 0
  @State searchNext: boolean = false
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;
  no_error: string = "no error happened"

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
      }
    }
  }
  private jsObj: JsProxyObject = {
    test: (res: object) => {
      Utils.emitEvent(String(res), 102);
    },
    toString: (str: string) => {
      console.info("ets toString:" + String(str));
    },
    register: (res: object) => {
      Utils.emitEvent(String(res), 86);
      return "web222"
    }
  }

  build() {
    Column() {
      Row() {
        Button("WebViewControllerPart2 click").key('WebViewControllerPart2Button').onClick(async () => {
          await Utils.waitForExist(()=>this.isReceive, 'WebViewControllerPart2ButtonIsReceive', 1, 1000);
          await Utils.waitForExist(()=>this.isPageEnd, 'WebViewControllerPart2ButtonIsPageEnd', 1, 1000);
          console.info("key==>" + this.str);
          this.isReceive = -1;
          switch (this.str) {

            case "testRefresh001": {
              try {
                this.isPageEnd = -1;
                this.controller.refresh()
                await Utils.waitForExist(()=>this.isPageEnd, 'refreshIsPageEnd', 1, 1000);
                let title = this.controller.getTitle()
                Utils.emitEvent(title, 200830)
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case "testLoadData001": {
              try {
                this.isPageEnd = -1;
                this.controller.loadData(
                  "<html><head><title>LoadData</title></head>" +
                    "<body bgcolor=\"white\">Source:<pre>source</pre></body></html>",
                  "text/html",
                  "UTF-8"
                );
                await Utils.waitForExist(()=>this.isPageEnd, 'loadDataIsPageEnd', 1, 1000);
                let title = this.controller.getTitle();
                Utils.emitEvent(title, 200840)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testLoadUrl001": {
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl('www' + '.example.' + 'com');
                await Utils.waitForExist(()=>this.isPageEnd, 'loadUrlIsPageEnd', 1, 1000);
                let title = this.controller.getTitle();
                Utils.emitEvent(title, 200850)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testLoadUrl002": {
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl("resource://rawfile/second.html");
                await Utils.waitForExist(()=>this.isPageEnd, 'loadUrlIsPageEnd', 1, 1000);
                let title = this.controller.getTitle();
                Utils.emitEvent(title, 200860)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testLoadUrl003": {
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('second.html'));
                await Utils.waitForExist(()=>this.isPageEnd, 'loadUrlIsPageEnd', 1, 1000);
                let title = this.controller.getTitle();
                Utils.emitEvent(title, 200870)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testLoadUrl004": {
              try {
                this.isPageEnd = -1;
                let sandboxPath = Utils.copyRawFileToSandbox('second.html')
                this.controller.loadUrl(`file://${sandboxPath}`);
                await Utils.waitForExist(()=>this.isPageEnd, 'loadUrlIsPageEnd', 1, 1000);
                let title = this.controller.getTitle();
                Utils.emitEvent(title, 200880)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testGetUserAgent001": {
              try {
                console.log('getUserAgent: ' + this.controller.getUserAgent())
                Utils.emitEvent(this.controller.getUserAgent().indexOf('OpenHarmony') >= 0, 200890)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testGetWebId001": {
              try {
                let webId = this.controller.getWebId()
                Utils.emitEvent(webId > 0, 200900)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testGetTitle001": {
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('index.html'));
                await Utils.waitForExist(()=>this.isPageEnd, 'loadUrlIsPageEnd', 1, 1000);
                let getTitle = this.controller.getTitle();
                console.log('getTitle===>'+getTitle)
                Utils.emitEvent(getTitle, 200910)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testStop001": {
              try {
                this.controller.loadUrl('www' + '.example.' + 'com')
                this.controller.stop()
                let title = this.controller.getTitle();
                Utils.emitEvent(title, 200920)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testGetCustomUserAgent001": {
              try {
                Utils.emitEvent(this.controller.getCustomUserAgent().indexOf('OpenHarmony') >= 0, 200930)
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case "testSetCustomUserAgent001": {
              try {
                let setUA = "userAgent"
                this.controller.setCustomUserAgent(setUA)
                Utils.emitEvent(this.controller.getCustomUserAgent(), 200940);
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case "testProtectedResourceType001": {
              try {
                console.log('testProtectedResourceType001 :'+ProtectedResourceType.SENSOR)
                Utils.emitEvent(ProtectedResourceType.SENSOR, 200950);
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(true)
        .key("onShowFileSelectorKey")
        .javaScriptProxy({
          object: this.jsObj,
          name: "backToEts",
          methodList: ["test", "toString"],
          controller: this.controller
        })
        .onScroll((event) => {
          if (event) {
            console.info("x = " + event.xOffset)
            console.info("y = " + event.yOffset)
            this.onScrollCallBack = true
          }
        })
        .onOverScroll((event) => {
          if (event) {
            console.info("x = " + event.xOffset)
            console.info("y = " + event.yOffset)
            this.onScrollCallBack = true
          }
        })
        .onPageEnd((event) => {
          if (event) {
            this.isPageEnd = 1
          }
        })
        .onShowFileSelector((event) => {
          if (event) {
            console.log('MyFileUploader onShowFileSelector invoked')
            event.result.handleFileList([this.uri]);
            console.info('getTitle:', event.fileSelector.getTitle())
            console.info('getMode:', event.fileSelector.getMode())
            console.info('getAcceptType:', event.fileSelector.getAcceptType())
            console.info('isCapture:', event.fileSelector.isCapture())
            this.FileSelectorParamGetTitle = event.fileSelector.getTitle()
            this.FileSelectorParamGetGetMode = event.fileSelector.getMode()
            this.FileSelectorParamGetGetAcceptType = event.fileSelector.getAcceptType()
            this.FileSelectorParamGetIsCapture = event.fileSelector.isCapture()
          }
          return true
        })
        .onSearchResultReceive(ret => {
          if (ret) {
            console.log("on search result receive:" + "[cur]" + ret.activeMatchOrdinal +
              "[total]" + ret.numberOfMatches + "[isDone]" + ret.isDoneCounting);
            this.numberOfMatches = ret.numberOfMatches
            this.searchNext = true
          }
        })
    }
  }
}