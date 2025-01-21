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
import { JsProxyObject } from '../../test/Interfaces';
import business_error, { BusinessError } from '@ohos.base';

@Entry
@Component
struct webController {
  controller: WebController = new WebController()
  @State str: string = "emitUserAgent"
  @State loadedResource: string = ""
  @State progress: string = ""
  @State newUrl: string = ""
  @State pageBegin: string = ""
  @State pageEnd: string = ""
  @State console: string = ""
  @State confirm: string = ""
  @State alert: string = ""
  @State errorReceive: string = ""
  @State httpErrorReceive: number = 0
  @State titleReceive: string = ""
  @State isDownloadStart: boolean = false
  @State javaScriptAccess: boolean = true
  @State fileAccess: boolean = true
  @State domStorageAccess: boolean = false
  @State imageAccess: boolean = true
  @State geolocationAccess: boolean = true
  @State onlineImageAccess: boolean = true
  @State databaseAccess: boolean = true
  @State initialScale: number = 100
  @State enterPageEnd: boolean = false
  @State newScale: number = 0
  @State scaleChange: boolean = false
  @State geoShow: boolean = false
  @State mixedMode: MixedMode = MixedMode.All
  @State cacheMode: CacheMode = CacheMode.Default
  @State cacheError: boolean = false
  @State mixedSwitch: boolean = false
  @State mixedAllSwitch: boolean = false
  @State webVisibility: Visibility = Visibility.Visible
  @State isProgressFinish: boolean = false
  @State isHttpErrorReceive: boolean = false
  @State isLargeThan: boolean = false
  @State registerJavaScriptProxyFlag: boolean = false
  @State zoomAccess: boolean = false
  @State requestFocus: boolean = false

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
  private jsObj: JsProxyObject = {
    test: (res: object) => {
      console.info("ets toString:" + String(res));
    },
    toString: (str: string) => {
      console.info("ets toString:" + String(str));
    },
    register: (res: object) => {
      if (this.registerJavaScriptProxyFlag == true) {
        Utils.emitEvent(String(res), 31008);
      }
      return "web222"
    }
  }

  build() {
    Column() {
      Row() {
        Button("WebController click").key('WebControllerButton').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {

            case "testAccessStep001": {
              try {
                let isCan = this.controller.accessStep(1)
                Utils.emitEvent(isCan, 31015)
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 31015)
              }
              break;
            }
            case "testAccessStep002": {
              try {
                this.controller.loadUrl({ url: $rawfile("second.html") });
                await Utils.sleep(2000)
                this.controller.backward()
                await Utils.sleep(2000)
                Utils.emitEvent(this.controller.accessStep(1), 100089)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "testAccessStep003": {
              try {
                this.controller.clearHistory()
                await Utils.sleep(2000)
                Utils.emitEvent(this.controller.accessStep(-1), 100090)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "testAccessStep004": {
              try {
                this.controller.loadUrl({ url: $rawfile("second.html") });
                await Utils.sleep(2000)
                Utils.emitEvent(this.controller.accessStep(-1), 100091)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testAccessStep005": {
              try {
                this.controller.loadData({
                  data: "<html>" +
                  "<head>" +
                  "<title>LoadData</title>" +
                  "</head>" +
                  "<body bgcolor=\"white\">Source:<pre>source</pre</body>" +
                  "<script>function getTitle(){return document.title}</script>" +
                  "</html>",
                  mimeType: "text/html",
                  encoding: "UTF-8"
                })
                await Utils.sleep(2000)
                Utils.emitEvent(this.controller.accessStep(1), 100092)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testAccessStep006": {
              try {
                this.controller.loadData({
                  data: "<html>" +
                  "<head>" +
                  "<title>LoadData</title>" +
                  "</head>" +
                  "<body bgcolor=\"white\">Source:<pre>source</pre</body>" +
                  "<script>function getTitle(){return document.title}</script>" +
                  "</html>",
                  mimeType: "text/html",
                  encoding: "UTF-8"
                })
                await Utils.sleep(2000)
                this.controller.backward()
                await Utils.sleep(2000)
                Utils.emitEvent(this.controller.accessStep(1), 100093)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testAccessStep007": {
              try {
                this.controller.loadData({
                  data: "<html>" +
                  "<head>" +
                  "<title>LoadData</title>" +
                  "</head>" +
                  "<body bgcolor=\"white\">Source:<pre>source</pre</body>" +
                  "<script>function getTitle(){return document.title}</script>" +
                  "</html>",
                  mimeType: "text/html",
                  encoding: "UTF-8"
                })
                await Utils.sleep(2000)
                this.controller.clearHistory()
                await Utils.sleep(2000)
                Utils.emitEvent(this.controller.accessStep(-1), 100094)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testAccessStep008": {
              try {
                this.controller.loadUrl({ url: $rawfile('second.html') })
                await Utils.sleep(2000)
                this.controller.loadData({
                  data: "<html>" +
                  "<head>" +
                  "<title>LoadData</title>" +
                  "</head>" +
                  "<body bgcolor=\"white\">Source:<pre>source</pre</body>" +
                  "<script>function getTitle(){return document.title}</script>" +
                  "</html>",
                  mimeType: "text/html",
                  encoding: "UTF-8"
                })
                await Utils.sleep(2000)
                Utils.emitEvent(this.controller.accessStep(-1), 100095)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testRefresh001": {
              try {
                this.controller.loadUrl({ url: $rawfile('index.html') })
                await Utils.sleep(4000);
                this.controller.refresh();
                await Utils.sleep(2000);
                this.controller.runJavaScript({ script: "getTitle()", callback: (res) => {
                  Utils.emitEvent(res, 31006)
                }
                })
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 31006)
              }
              break;
            }

            case "testAccessBackward001": {
              try {
                let isCan = this.controller.accessBackward()
                Utils.emitEvent(isCan, 31011)
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 31011)
              }
              break;
            }


            case "testRegisterJavaScriptProxy001": {
              try {
                this.controller.loadUrl({ url: $rawfile('webPart1index.html') })
                await Utils.sleep(2000);
                this.registerJavaScriptProxyFlag = true
                this.controller.registerJavaScriptProxy({
                  object: this.jsObj,
                  name: "objName",
                  methodList: ["test", "toString", "register"]
                })
                this.controller.refresh()
                await Utils.sleep(2000);
                this.controller.runJavaScript({ script: "proxy()" })
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 31008)
              }
              break;
            }

            case "testAccessBackward002": {
              try {
                this.controller.loadUrl({ url: "resource://rawfile/second.html" });
                await Utils.sleep(2000);
                let isCan = this.controller.accessBackward()
                Utils.emitEvent(isCan, 31012)
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 31012)
              }
              break;
            }

            case "testAccessBackward003": {
              try {
                this.controller.loadUrl({ url: "resource://rawfile/second.html" });
                await Utils.sleep(2000)
                this.controller.clearHistory()
                await Utils.sleep(2000)
                Utils.emitEvent(this.controller.accessBackward(), 200006)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "testAccessBackward004": {
              try {
                this.controller.loadData({
                  data: "<html>" +
                  "<head>" +
                  "<title>LoadData</title>" +
                  "</head>" +
                  "<body bgcolor=\"white\">Source:<pre>source</pre</body>" +
                  "<script>function getTitle(){return document.title}</script>" +
                  "</html>",
                  mimeType: "text/html",
                  encoding: "UTF-8"
                })
                await Utils.sleep(2000)
                Utils.emitEvent(this.controller.accessBackward(), 200007)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testOnInactive001": {
              try {
                let onInactiveCalled = false
                this.controller.loadUrl({ url: "resource://rawfile/webPart1index.html" });
                this.controller.onInactive()
                await Utils.sleep(2000);
                this.controller.runJavaScript({ script: "getTitle()", callback: (res) => {
                  console.info("GetTitle++++++" + res)
                  if (res == "\"index\"") {
                    onInactiveCalled = true
                  }
                  Utils.emitEvent(onInactiveCalled, 31000)
                } })
              }
              catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 31000)
              }
              break;
            }

            case "testOnActive001": {
              try {
                this.controller.onActive()
                this.controller.loadUrl({ url: "resource://rawfile/webPart1index.html" });
                setTimeout(() => {
                  let onActiveCalled = this.pageBegin
                  Utils.emitEvent(onActiveCalled, 31001)
                }, 5000)
              }
              catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 31001)
              }
              break;
            }

            case "testClearHistory001": {
              try {
                let clearHistoryCalled: boolean
                this.controller.loadUrl({ url: "http://www.baidu.com/" })
                await Utils.sleep(2000);
                this.controller.clearHistory()
                await Utils.sleep(2000);
                clearHistoryCalled = this.controller.accessBackward()
                Utils.emitEvent(clearHistoryCalled, 31003)
              }
              catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 31003)
              }
              break;
            }

            case "testRunJavaScript001": {
              try {
                this.controller.loadUrl({ url: "resource://rawfile/webPart1index.html" });
                await Utils.sleep(2000);
                this.controller.runJavaScript({ script: "testRunJavaScript()", callback: (res) => {
                  Utils.emitEvent(String(res), 31004)
                } })
              }
              catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 31004)
              }
              break;
            }

            case "testLoadData001": {
              try {
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
                await Utils.sleep(2000);
                this.controller.runJavaScript({ script: "getTitle()", callback: (res) => {
                  Utils.emitEvent(res, 31005)
                } })
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 31005)
              }
              break;
            }

            case "testStop001": {
              try {
                let stopCalled = false
                this.controller.loadUrl({ url: "http://appgallery.huawei.com/" })
                this.controller.stop()
                await Utils.sleep(2000);
                if (this.pageEnd !== 'http://appgallery.huawei.com/') {
                  stopCalled = true
                }
                Utils.emitEvent(stopCalled, 31007)
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 31007)
              }
              break;
            }

            case "testDeleteJavaScriptRegister001": {
              try {
                this.controller.registerJavaScriptProxy({
                  object: this.jsObj,
                  name: "objName",
                  methodList: ["test", "toString", "register"]
                })
                this.controller.refresh()
                this.controller.deleteJavaScriptRegister("objName")
                this.controller.runJavaScript({ script: "registerTest()" })
                if (this.console !== "web222") {
                  let deleteEntireCookieCalled = true
                  Utils.emitEvent(deleteEntireCookieCalled, 31009)
                  return
                }
                Utils.emitEvent(false, 31009)
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 31009)
              }
              break;
            }

            case "testAccessForward001": {
              try {
                let isCan = this.controller.accessForward()
                Utils.emitEvent(isCan, 31013)
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 31013)
              }
              break;
            }

            case "testAccessForward002": {
              try {
                this.controller.loadUrl({ url: "http://appgallery.huawei.com/" })
                await Utils.sleep(2000);
                this.controller.backward()
                await Utils.sleep(2000);
                let isCan = this.controller.accessForward()
                Utils.emitEvent(isCan, 31014)
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 31014)
              }
              break;
            }

            case "testAccessForward003": {
              try {
                this.controller.loadUrl({ url: "resource://rawfile/second.html" })
                await Utils.sleep(2000)
                this.controller.backward()
                await Utils.sleep(2000)
                this.controller.clearHistory()
                await Utils.sleep(2000)
                Utils.emitEvent(this.controller.accessForward(), 200008)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "testAccessForward004": {
              try {
                this.controller.loadData({
                  data: "<html>" +
                  "<head>" +
                  "<title>LoadData</title>" +
                  "</head>" +
                  "<body bgcolor=\"white\">Source:<pre>source</pre</body>" +
                  "<script>function getTitle(){return document.title}</script>" +
                  "</html>",
                  mimeType: "text/html",
                  encoding: "UTF-8"
                })
                await Utils.sleep(2000)
                this.controller.backward()
                await Utils.sleep(2000)
                Utils.emitEvent(this.controller.accessForward(), 200009)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testBackward001": {
              try {
                this.controller.clearHistory()
                this.controller.loadUrl({ url: "resource://rawfile/webPart1index.html" });
                await Utils.sleep(2000);
                this.controller.loadUrl({ url: "http://appgallery.huawei.com/" })
                await Utils.sleep(2000);
                this.controller.backward()
                await Utils.sleep(2000);
                this.controller.runJavaScript({ script: "getTitle()", callback: (res) => {
                  Utils.emitEvent(res, 31016)
                } })
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 31016)
              }
              break;
            }
            case "testBackward002": {
              try {
                this.controller.loadUrl({ url: $rawfile("index.html") });
                await Utils.sleep(2000)
                this.controller.loadData({
                  data: "<html>" +
                  "<head>" +
                  "<title>LoadData</title>" +
                  "</head>" +
                  "<body bgcolor=\"white\">Source:<pre>source</pre</body>" +
                  "<script>" +
                  "function getTitle(){return document.title}" +
                  "</script>" +
                  "</html>",
                  mimeType: "text/html",
                  encoding: "UTF-8"
                })
                await Utils.sleep(2000)
                this.controller.backward()
                await Utils.sleep(2000)
                this.controller.runJavaScript({ script: "getTitle()", callback: (res) => {
                  Utils.emitEvent(res, 200010)
                } })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "testBackward003": {
              try {
                this.controller.loadUrl({ url: $rawfile("second.html") });
                await Utils.sleep(2000)
                this.controller.clearHistory()
                await Utils.sleep(2000)
                this.controller.backward()
                await Utils.sleep(2000)
                this.controller.runJavaScript({ script: "getTitle()", callback: (res) => {
                  Utils.emitEvent(res, 200011)
                } })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "testForward001": {
              try {
                this.controller.loadUrl({ url: "resource://rawfile/webMessageExt.html" });
                await Utils.sleep(2000);
                this.controller.backward()
                await Utils.sleep(2000);
                this.controller.forward()
                await Utils.sleep(2000);
                if (this.newUrl == "resource://rawfile/webMessageExt.html") {
                  Utils.emitEvent(true, 31017)
                  return;
                }
                Utils.emitEvent(false, 31017)
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 31017)
              }
              break;
            }
            case "testForward002": {
              try {
                this.controller.loadData({
                  data: "<html>" +
                  "<head>" +
                  "<title>LoadData</title>" +
                  "</head>" +
                  "<body bgcolor=\"white\">Source:<pre>source</pre</body>" +
                  "<script>function getTitle(){return document.title}</script>" +
                  "</html>",
                  mimeType: "text/html",
                  encoding: "UTF-8"
                })
                await Utils.sleep(2000);
                this.controller.backward()
                await Utils.sleep(2000);
                this.controller.forward()
                await Utils.sleep(2000);
                this.controller.runJavaScript({ script: "getTitle()", callback: (res) => {
                  Utils.emitEvent(res, 100087)
                } })
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }
            case "testForward003": {
              try {
                this.controller.loadUrl({ url: $rawfile('index.html') });
                await Utils.sleep(2000);
                this.controller.loadUrl({ url: $rawfile('second.html') });
                await Utils.sleep(2000);
                this.controller.backward()
                await Utils.sleep(2000);
                this.controller.clearHistory()
                await Utils.sleep(2000);
                this.controller.forward()
                await Utils.sleep(2000);
                this.controller.runJavaScript({ script: "getTitle()", callback: (res) => {
                  Utils.emitEvent(res, 100088)
                } })
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }
            case "testLoadUrl001": {
              try {
                this.controller.loadUrl({ url: "resource://rawfile/webMessageExt.html" });
                await Utils.sleep(2000);
                if (this.pageEnd == "resource://rawfile/webMessageExt.html") {
                  Utils.emitEvent(true, 31018)
                  return;
                }
                Utils.emitEvent(false, 31018)
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 31018)
              }
              break;
            }

            case "testLoadUrl002": {
              try {
                this.controller.loadUrl({ url: 'www.OpenHarmony.cn' });
                await Utils.sleep(3000);
                Utils.emitEvent(this.titleReceive, 76000)
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case "testLoadUrl003": {
              try {
                this.controller.loadUrl({ url: $rawfile('second.html') });
                await Utils.sleep(3000);
                Utils.emitEvent(this.titleReceive, 76002)
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case "testLoadUrl004": {
              try {
                let sandboxPath = Utils.copyRawFileToSandbox('second.html')
                this.controller.loadUrl({ url: `file://${sandboxPath}` });
                await Utils.sleep(3000);
                Utils.emitEvent(this.titleReceive, 76004)
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case "testImageAccess001": {
              try {
                this.imageAccess = false
                await Utils.sleep(1000)
                this.controller.loadUrl({ url: "resource://rawfile/index.html" });
                await Utils.sleep(3000)
                this.controller.runJavaScript({ script: "getImgResult()", callback: (res) => {
                  console.info("getImgResult==>" + res)
                  Utils.emitEvent(res, 33023)
                } })
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 33023)
              }
              break;
            }

            case "testImageAccess002": {
              try {
                this.imageAccess = true
                await Utils.sleep(1000)
                this.controller.loadUrl({ url: "resource://rawfile/index.html" });
                await Utils.sleep(3000)
                this.controller.runJavaScript({ script: "getImgResult()", callback: (res) => {
                  console.info("getImgResult==>" + res)
                  Utils.emitEvent(res, 33024)
                } })
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 33024)
              }
              break;
            }

            case "testDomStorageAccess001": {
              try {
                this.domStorageAccess = false
                await Utils.sleep(2000)
                this.controller.loadUrl({ url: "resource://rawfile/domApi.html" });
                await Utils.sleep(3000)
                this.controller.runJavaScript({ script: "getDomResult()", callback: (res) => {
                  console.info("getDomResult==>" + res)
                  Utils.emitEvent(res, 33025)
                } })
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 33025)
              }

              break;
            }

            case "testDomStorageAccess002": {
              try {
                this.domStorageAccess = true
                await Utils.sleep(2000)
                this.controller.loadUrl({ url: "resource://rawfile/domApi.html" });
                await Utils.sleep(3000)
                this.controller.runJavaScript({ script: "getDomResult()", callback: (res) => {
                  console.info("getDomResult==>" + res)
                  Utils.emitEvent(res, 33026)
                } })
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 33026)
              }
              break;
            }

            case "testOnlineImageAccess001": {
              try {
                this.onlineImageAccess = false
                await Utils.sleep(1000)
                this.controller.loadUrl({ url: "resource://rawfile/onlineImageAccess.html" });
                await Utils.sleep(3000)
                this.controller.runJavaScript({ script: "getImageLoadResult()", callback: (res) => {
                  console.info("getImageLoadResult==>" + res)
                  Utils.emitEvent(res, 33027)
                } })
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 33027)
              }
              break;
            }

            case "testOnlineImageAccess002": {
              try {
                this.onlineImageAccess = true
                await Utils.sleep(1000)
                this.controller.loadUrl({ url: "resource://rawfile/onlineImageAccess.html" });
                await Utils.sleep(3000)
                this.controller.runJavaScript({ script: "getImageLoadResult()", callback: (res) => {
                  console.info("getImageLoadResult==>" + res)
                  Utils.emitEvent(res, 33028)
                } })
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 33028)
              }
              break;
            }

            case "testFileAccess001": {
              try {
                this.fileAccess = true
                await Utils.sleep(2000)
                this.controller.loadUrl({ url: "resource://rawfile/index.html" });
                await Utils.sleep(3000)
                this.controller.runJavaScript({ script: "openRawFile()" })
                await Utils.sleep(3000)
                this.controller.runJavaScript({ script: "getTitle()", callback: (res) => {
                  Utils.emitEvent(res, 33029)
                } })
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 33029)
              }
              break;
            }

            case "testFileAccess002": {
              try {
                this.fileAccess = false
                await Utils.sleep(3000)
                this.controller.loadUrl({ url: "resource://rawfile/index.html" });
                await Utils.sleep(3000)
                this.controller.runJavaScript({ script: "openRawFile()" })
                await Utils.sleep(3000)
                this.controller.runJavaScript({ script: "getTitle()", callback: (res) => {
                  Utils.emitEvent(res, 100070)
                } })
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 100070)
              }
              break;
            }

            case "testRequestFocus001": {
              try {
                this.controller.loadUrl({ url: "resource://rawfile/second.html" });
                await Utils.sleep(2000)
                this.requestFocus = false
                sendEventByKey('textInput', 10, '')
                await Utils.sleep(3000)
                Utils.emitEvent(this.requestFocus, 33030)
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 33030)
              }
              break;
            }

          }
        })
      }

      TextInput({ placeholder: "inputs your words" })
        .key('textInput')
        .type(InputType.Normal)
        .placeholderColor(Color.Blue)
        .placeholderFont({ size: 20, weight: FontWeight.Normal, family: "sans-serif", style: FontStyle.Normal })
        .enterKeyType(EnterKeyType.Next)
        .caretColor(Color.Green)
        .height(60)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
        .fontFamily("cursive")
        .fontStyle(FontStyle.Italic)
        .fontColor(Color.Red)
        .maxLength(20)
        .border({ width: 1, color: 0x317AF7, radius: 10, style: BorderStyle.Solid })
        .onClick(() => {
          console.info("TextInput click")
        })

      Web({ src: $rawfile('webPart1index.html'), controller: this.controller })
        .visibility(this.webVisibility)
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .geolocationAccess(this.geolocationAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .cacheMode(this.cacheMode)
        .initialScale(this.initialScale)
        .mixedMode(this.mixedMode)
        .userAgent("Mozila/5.0 (Linux; Andriod 9; VRD-AL10; HMSCore 6.3.0.331) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.105 HuaweiBrowser/12.0.4.1 MobileSafari/537.36")
        .javaScriptProxy({
          object: this.jsObj,
          name: "backToEts",
          methodList: ["test", "toString"],
          controller: this.controller
        })
        .onConsole((event) => {
          if (event) {
            this.console = event.message.getMessage()
          }
          return false
        })
        .onPageBegin((event) => {
          if (event) {
            this.pageBegin = event.url
          }
        })
        .onTitleReceive((event) => {
          if (event) {
            console.log('onTitleReceive title:' + event.title)
            this.titleReceive = event.title
          }
        })
        .onPageEnd((event) => {
          if (event) {
            this.pageEnd = event.url
            console.log("onPageEnd==>")
          }
        })
        .onRefreshAccessedHistory((event) => {
          if (event) {
            console.info("onRefreshAccessedHistory==>")
            this.newUrl = event.url
          }

        })
        .onResourceLoad((event) => {
          console.info("onResourceLoad==>" + event.url)
          this.loadedResource = event.url
        })
        .zoomAccess(this.zoomAccess)
        .onBlur(() => {
          console.info("onBlur==>")
          this.controller.requestFocus()
        })
        .onFocus(() => {
          this.requestFocus = true
        })
    }
  }
}
