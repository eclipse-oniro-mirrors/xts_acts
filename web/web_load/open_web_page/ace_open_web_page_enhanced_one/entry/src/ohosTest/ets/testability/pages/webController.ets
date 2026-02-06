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
import { URL } from '../../test/Config.test'

const EVENT_ID_SET_EMIT_KEY = 200660;

@Entry
@Component
struct webController {
  controller: WebController = new WebController()
  @State str: string = "emitUserAgent"
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  startCaseNum: number = -1;

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

  build() {
    Column() {
      Row() {
        Button("WebController click").key('WebControllerButton').onClick(async () => {
          await Utils.waitForExist(()=>this.isReceive, 'WebControllerButtonIsReceive', 1, 1000);
          await Utils.waitForExist(()=>this.isPageEnd, 'WebControllerButtonIsPageEnd', 1, 1000);
          console.info("key==>" + this.str);
          this.isReceive = -1;
          switch (this.str) {

            case "testRefresh001": {
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl({ url: $rawfile('index.html') });
                await Utils.waitForExist(()=>this.isPageEnd, 'loadUrlIsPageEnd', 1, 1000);
                this.isReceive = -1;
                this.controller.refresh();
                await Utils.waitForExist(()=>this.isPageEnd, 'refreshIsPageEnd', 1, 1000);
                this.controller.runJavaScript({ script: "getTitle()", callback: (res) => {
                  Utils.emitEvent(res, 200670)
                }
                })
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 200670)
              }
              break;
            }
            case "testLoadData001": {
              try {
                this.isPageEnd = -1;
                this.controller.loadData({
                  data: "<html>" +
                    "<head>" +
                    "<title>LoadData</title>" +
                    "</head>" +
                    "<body bgcolor=\"white\">Source:<pre>source</pre</body>" +
                    "<script>function getTitle(){return document.title}" +
                    "</script>" +
                    "</html>",
                  mimeType: "text/html",
                  encoding: "UTF-8"
                })
                await Utils.waitForExist(()=>this.isPageEnd, 'loadDataIsPageEnd', 1, 1000);
                this.controller.runJavaScript({ script: "getTitle()", callback: (res) => {
                  Utils.emitEvent(res, 200680)
                } })
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 200680)
              }
              break;
            }

            case "testLoadUrl001": {
              try {
                this.startCaseNum = 1;
                this.isPageEnd = -1;
                this.controller.loadUrl({ url: "resource://rawfile/webMessageExt.html" });
                await Utils.waitForExist(()=>this.isPageEnd, 'loadUrlIsPageEnd', 1, 1000);
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 200690)
              }
              break;
            }

            case "testLoadUrl002": {
              try {
                this.startCaseNum = 2;
                this.isPageEnd = -1;
                this.controller.loadUrl({ url: URL });
                await Utils.waitForExist(()=>this.isPageEnd, 'loadUrlIsPageEnd', 1, 1000);
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case "testLoadUrl003": {
              try {
                this.startCaseNum = 3;
                this.isPageEnd = -1;
                this.controller.loadUrl({ url: $rawfile('second.html') });
                await Utils.waitForExist(()=>this.isPageEnd, 'loadUrlIsPageEnd', 1, 1000);
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case "testLoadUrl004": {
              try {
                this.startCaseNum = 4;
                this.isPageEnd = -1;
                let sandboxPath = Utils.copyRawFileToSandbox('second.html')
                this.controller.loadUrl({ url: `file://${sandboxPath}` });
                await Utils.waitForExist(()=>this.isPageEnd, 'loadUrlIsPageEnd', 1, 1000);
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

          }
        })
      }

      Web({ src: $rawfile('webPart1index.html'), controller: this.controller })
        .fileAccess(true)
        .onTitleReceive((event) => {
          if (event) {
            console.log('onTitleReceive title:' + event.title);
            switch (this.startCaseNum) {
              case 2: {
                Utils.emitEvent(event.title, 200700);
                this.startCaseNum = -1;
                break;
              }
              case 3: {
                Utils.emitEvent(event.title, 200710);
                this.startCaseNum = -1;
                break;
              }
              case 4: {
                Utils.emitEvent(event.title, 200720);
                this.startCaseNum = -1;
                break;
              }
              default :
                break;
            }
          }
        })
        .onPageEnd((event) => {
          if (event) {
            this.isPageEnd = 1;
            console.log("onPageEnd==> " + event.url);
            if (this.startCaseNum === 1) {
              if (event.url === "resource://rawfile/webMessageExt.html") {
                Utils.emitEvent(true, 200690);
              } else {
                Utils.emitEvent(false, 200690);
              }
              this.startCaseNum = -1;
            }
          }
        })
        .onSslErrorEvent((event: SslErrorEvent) => {
          console.info('onSslErrorEvent url: ' + event.url);
          console.info('onSslErrorEvent error: ' + event.error);
          console.info('onSslErrorEvent originalUrl: ' + event.originalUrl);
          console.info('onSslErrorEvent referrer: ' + event.referrer);
          console.info('onSslErrorEvent isFatalError: ' + event.isFatalError);
          console.info('onSslErrorEvent isMainFrame: ' + event.isMainFrame);
          event.handler.handleConfirm();
        })
    }
  }
}