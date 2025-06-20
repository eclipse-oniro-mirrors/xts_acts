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
import image from '@ohos.multimedia.image';
import { JsProxyObject } from '../../test/Interfaces';

@Entry
@Component
struct WebViewControllerPart3 {
  controller: webView.WebviewController = new webView.WebviewController();
  controllerTwo: webView.WebviewController = new webView.WebviewController();
  nativePort: webView.WebMessagePort | null = null;
  message: webView.WebMessageExt = new webView.WebMessageExt();
  @State str: string = ""
  @State pixelMap: image.PixelMap | undefined = undefined;
  @State javaScriptAccess: boolean = true
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = true;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = false;
  @State databaseAccess: boolean = true;
  @State checkEleResult: number[] = [];
  @State registerJavaScriptProxyFlag: boolean = false;
  @State console: string = ""
  @State arrTime: Array<number> = [0, 0]
  @State time: number = 0
  @State onScrollCallBack: boolean = false;
  @State onMessageEventCallBack: boolean = false
  @State ports: webView.WebMessagePort[] = [];
  @State userAgentPC:string = "";

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
        if (this.controller) {
          this.controller.loadUrl("resource://rawfile/index.html");
          this.controller.clearHistory()
        }
      }
    }
  }
  private jsObj: JsProxyObject = {
    test: (res: object) => {
      console.info("ets toString:" + String(res));
    },
    toString: (str: string) => {
      console.info("ets toString:" + String(str));
    },
    register: (res: object) => {
      if (this.registerJavaScriptProxyFlag == true) {
        Utils.emitEvent(String(res), 100075);
      }
      return "web222"
    }
  }


  build() {
    Column() {
      Row() {
        Button("WebViewController click").key('WebViewControllerTestButton').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "testAccessForward001": {
              try {
                Utils.emitEvent(this.controller.accessForward(), 50520)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "testAccessForward002": {
              try {
                this.controller.loadUrl("resource://rawfile/second.html");
                await Utils.sleep(2000)
                this.controller.backward()
                await Utils.sleep(2000)
                Utils.emitEvent(this.controller.accessForward(), 50522)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "testAccessForward003": {
              try {
                this.controller.loadUrl("resource://rawfile/second.html");
                await Utils.sleep(2000)
                this.controller.backward()
                await Utils.sleep(2000)
                this.controller.clearHistory()
                await Utils.sleep(2000)
                Utils.emitEvent(this.controller.accessForward(), 200000)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "testAccessForward004": {
              try {
                this.controller.loadData(
                  "<html><head><title>LoadData</title></head>" +
                    "<body bgcolor=\"white\">Source:<pre>source</pre></body></html>",
                  "text/html",
                  "UTF-8"
                );
                await Utils.sleep(2000)
                this.controller.backward()
                await Utils.sleep(2000)
                Utils.emitEvent(this.controller.accessForward(), 200002)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "testAccessBackward001": {
              try {
                Utils.emitEvent(this.controller.accessBackward(), 50526)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "testAccessBackward002": {
              try {
                this.controller.loadUrl("resource://rawfile/second.html");
                await Utils.sleep(2000)
                Utils.emitEvent(this.controller.accessBackward(), 50528)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "testAccessBackward003": {
              try {
                this.controller.loadUrl("resource://rawfile/second.html");
                await Utils.sleep(2000)
                this.controller.clearHistory()
                await Utils.sleep(2000)
                Utils.emitEvent(this.controller.accessBackward(), 200001)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "testAccessBackward004": {
              try {
                this.controller.loadData(
                  "<html><head><title>LoadData</title></head>" +
                    "<body bgcolor=\"white\">Source:<pre>source</pre></body></html>",
                  "text/html",
                  "UTF-8"
                );
                await Utils.sleep(2000)
                Utils.emitEvent(this.controller.accessBackward(), 200003)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "testAccessStep001": {
              try {
                Utils.emitEvent(this.controller.accessStep(1), 50530)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "testAccessStep002": {
              try {
                this.controller.loadUrl("resource://rawfile/second.html");
                await Utils.sleep(2000)
                this.controller.backward()
                await Utils.sleep(2000)
                Utils.emitEvent(this.controller.accessStep(1), 50532)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "testAccessStep003": {
              try {
                Utils.emitEvent(this.controller.accessStep(-1), 50534)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "testAccessStep004": {
              try {
                this.controller.loadUrl("resource://rawfile/second.html");
                await Utils.sleep(2000)
                Utils.emitEvent(this.controller.accessStep(-1), 50536)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testAccessStep005": {
              try {
                this.controller.loadData(
                  "<html><head><title>LoadData</title></head>" +
                    "<body bgcolor=\"white\">Source:<pre>source</pre></body></html>",
                  "text/html",
                  "UTF-8"
                );
                await Utils.sleep(2000)
                Utils.emitEvent(this.controller.accessStep(1), 100096)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "testAccessStep006": {
              try {
                this.controller.loadData(
                  "<html><head><title>LoadData</title></head>" +
                    "<body bgcolor=\"white\">Source:<pre>source</pre></body></html>",
                  "text/html",
                  "UTF-8"
                );
                await Utils.sleep(2000)
                this.controller.backward()
                await Utils.sleep(2000)
                Utils.emitEvent(this.controller.accessStep(1), 100097)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "testAccessStep007": {
              try {
                this.controller.loadData(
                  "<html><head><title>LoadData</title></head>" +
                    "<body bgcolor=\"white\">Source:<pre>source</pre></body></html>",
                  "text/html",
                  "UTF-8"
                );
                await Utils.sleep(2000)
                this.controller.clearHistory()
                await Utils.sleep(2000)
                Utils.emitEvent(this.controller.accessStep(-1), 100098)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "testAccessStep008": {
              try {
                this.controller.loadData(
                  "<html><head><title>LoadData</title></head>" +
                    "<body bgcolor=\"white\">Source:<pre>source</pre></body></html>",
                  "text/html",
                  "UTF-8"
                );
                await Utils.sleep(2000)
                Utils.emitEvent(this.controller.accessStep(-1), 100099)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testBackward001": {
              try {
                this.controller.loadUrl($rawfile('second.html'))
                await Utils.sleep(3000)
                this.controller.backward();
                await Utils.sleep(1000)
                let title = this.controller.getTitle();
                Utils.emitEvent(title, 100071)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "testBackward002": {
              try {
                this.controller.loadUrl($rawfile("index.html"));
                await Utils.sleep(2000)
                this.controller.loadData(
                  "<html><head><title>LoadData</title></head>" +
                    "<body bgcolor=\"white\">Source:<pre>source</pre></body></html>",
                  "text/html",
                  "UTF-8"
                );
                await Utils.sleep(2000)
                this.controller.backward()
                await Utils.sleep(2000)
                Utils.emitEvent(this.controller.getTitle(), 200004)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "testBackward003": {
              try {
                this.controller.loadUrl($rawfile("second.html"));
                await Utils.sleep(2000)
                this.controller.clearHistory()
                await Utils.sleep(2000)
                this.controller.backward()
                await Utils.sleep(2000)
                Utils.emitEvent(this.controller.getTitle(), 200005)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "testForward001": {
              try {
                this.controller.loadUrl($rawfile('second.html'))
                await Utils.sleep(3000)
                this.controller.backward();
                await Utils.sleep(2000)
                this.controller.forward();
                await Utils.sleep(2000)
                let title = this.controller.getTitle();
                Utils.emitEvent(title, 100072)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "testForward002": {
              try {
                this.controller.loadData(
                  "<html><head><title>LoadData</title></head>" +
                    "<body bgcolor=\"white\">Source:<pre>source</pre></body></html>",
                  "text/html",
                  "UTF-8"
                );
                await Utils.sleep(2000)
                this.controller.backward();
                await Utils.sleep(2000)
                this.controller.forward();
                await Utils.sleep(2000)
                let title = this.controller.getTitle();
                Utils.emitEvent(title, 100085)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "testForward003": {
              try {
                this.controller.loadUrl($rawfile("second.html"));
                await Utils.sleep(2000)
                this.controller.backward();
                await Utils.sleep(2000)
                this.controller.clearHistory()
                await Utils.sleep(2000)
                this.controller.forward();
                await Utils.sleep(2000)
                let title = this.controller.getTitle();
                Utils.emitEvent(title, 100086)
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
        .onConsole((event) => {
          if (event) {
            this.console = event.message.getMessage()
          }
          return false
        })
        .onFirstContentfulPaint(event => {
          if (event) {
            console.log("onFirstContentfulPaint:" + "[navigationStartTick]:" +
            event.navigationStartTick + ", [firstContentfulPaintMs]:" +
            event.firstContentfulPaintMs)
            this.time = event.firstContentfulPaintMs - event.navigationStartTick / 1000
            this.arrTime.push(this.time)
          }
        })
        .onScroll((event) => {
          if (event) {
            console.info("onScroll x = " + event.xOffset)
            console.info("onScroll y = " + event.yOffset)
            this.onScrollCallBack = true
          }
        })
        .onPageEnd((event) => {
          if (event) {
            if (this.onMessageEventCallBack) {
              this.ports = this.controller.createWebMessagePorts(true);
              this.controller.postMessage("init_web_messageport", [this.ports[1]], "*");
              this.nativePort = this.ports[0];
              this.nativePort.onMessageEvent((result) => {
                if (result) {
                  console.log(`log error result: ${result}`);

                }
              });
            }
            console.log('url:' + event.url)
          }
        })
      Web({ src: $rawfile('indexTwo.html'), controller: this.controllerTwo })
        .id('2')
        .key('web2')
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
    }
  }
}
