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
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import { BusinessError } from '@ohos.base';

@Entry
@Component
struct PrecompileJavaScriptTest {
  controller: webView.WebviewController = new webView.WebviewController();
  message: webView.WebMessageExt = new webView.WebMessageExt();
  @State str: string = ""
  @State javaScriptAccess: boolean = true;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
    webView.WebviewController.initializeWebEngine()
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
  private jsObj: JsProxyObject = {
    test: (res: object) => {
      console.info("ets toString:" + String(res));
    },
    toString: (str: string) => {
      console.info("ets toString:" + String(str));
    },
    register: (res: object) => {
      return "precompileJavaScript test"
    }
  }

  build() {
    Column() {
      Row() {
        Button("precompileJavaScriptTest click").key('precompileJavaScriptTestButton').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "testPrecompileJavaScript001": {
              let msg = "testPrecompileJavaScript001"
              this.controller.precompileJavaScript("https://exmaple.com/example.js", 'hawe', {
                responseHeaders: [
                  {
                    headerKey: "E-Tag",
                    headerValue: "68ZpTzuAFdm85xPNtr3EOzySP8Q"
                  }
                ]
              }).then((res) => {
                console.info(msg + " precompile result: " + res);
                Utils.emitEvent(res, 10092)
              }).catch((err: number) => {
                console.error(msg + " precompile error: " + err);
              })
              break;
            }
            case "testPrecompileJavaScript002": {
              let msg = "testPrecompileJavaScript002"
              this.controller.precompileJavaScript("https://", 'hawe', {
                responseHeaders: [
                  {
                    headerKey: "E-Tag",
                    headerValue: "68ZpTzuAFdm85xPNtr3EOzySP8Q"
                  }
                ]
              }).then((res) => {
                console.info(msg + " precompile result: " + res);
              }).catch((err: number) => {
                console.error(msg + " precompile error: " + err);
                Utils.emitEvent(err, 10093)
              })
              break;
            }
            case "testPrecompileJavaScript003": {
              let msg = "testPrecompileJavaScript003"
              this.controller.precompileJavaScript("adbfs12345", 'hawe', {
                responseHeaders: [
                  {
                    headerKey: "E-Tag",
                    headerValue: "68ZpTzuAFdm85xPNtr3EOzySP8Q"
                  }
                ]
              }).then((res) => {
                console.info(msg + " precompile result: " + res);
              }).catch((err: number) => {
                console.error(msg + " precompile error: " + err);
                Utils.emitEvent(err, 10094)
              })
              break;
            }
            case "testPrecompileJavaScript004": {
              let msg = "testPrecompileJavaScript004"
              this.controller.precompileJavaScript("www.baidu.com", 'hawe', {
                responseHeaders: [
                  {
                    headerKey: "E-Tag",
                    headerValue: "68ZpTzuAFdm85xPNtr3EOzySP8Q"
                  }
                ]
              }).then((res) => {
                console.info(msg + " precompile result: " + res);
              }).catch((err: number) => {
                console.error(msg + " precompile error: " + err);
                Utils.emitEvent(err, 10095)
              })
              break;
            }
            case "testPrecompileJavaScript005": {
              let msg = "testPrecompileJavaScript005"
              try {
                this.controller.precompileJavaScript(null, 'hawe', {
                  responseHeaders: [
                    {
                      headerKey: "E-Tag",
                      headerValue: "68ZpTzuAFdm85xPNtr3EOzySP8Q"
                    }
                  ]
                }).then((res) => {
                  console.info(msg + " precompile result: " + res);
                }).catch((err: number) => {
                  console.error(msg + " precompile error: " + err);
                })
              } catch (error) {
                console.error(`${msg} ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 10096)
              }
              break;
            }
            case "testPrecompileJavaScript006": {
              let msg = "testPrecompileJavaScript006"
              try {
                this.controller.precompileJavaScript(undefined, 'hawe', {
                  responseHeaders: [
                    {
                      headerKey: "E-Tag",
                      headerValue: "68ZpTzuAFdm85xPNtr3EOzySP8Q"
                    }
                  ]
                }).then((res) => {
                  console.info(msg + " precompile result: " + res);
                }).catch((err: number) => {
                  console.error(msg + " precompile error: " + err);
                })
              } catch (error) {
                console.error(`${msg} ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 10097)
              }
              break;
            }
            case "testPrecompileJavaScript007": {
              let msg = "testPrecompileJavaScript007"
              this.controller.precompileJavaScript('https://exmaple.com/example.js', '', {
                responseHeaders: [
                  {
                    headerKey: "E-Tag",
                    headerValue: "68ZpTzuAFdm85xPNtr3EOzySP8Q"
                  }
                ]
              }).then((res) => {
                console.info(msg + " precompile result: " + res);
                Utils.emitEvent(res, 10098)
              }).catch((err: number) => {
                console.error(msg + " precompile error: " + err);
              })
              break;
            }
            case "testPrecompileJavaScript008": {
              let msg = "testPrecompileJavaScript008"
              this.controller.precompileJavaScript('https://exmaple.com/example.js', ' ', {
                responseHeaders: [
                  {
                    headerKey: "E-Tag",
                    headerValue: "68ZpTzuAFdm85xPNtr3EOzySP8Q"
                  }
                ]
              }).then((res) => {
                console.info(msg + " precompile result: " + res);
                Utils.emitEvent(res, 10099)
              }).catch((err: number) => {
                console.error(msg + " precompile error: " + err);
              })
              break;
            }
            case "testPrecompileJavaScript009": {
              let msg = "testPrecompileJavaScript009"
              try {
                this.controller.precompileJavaScript('https://exmaple.com/example.js', null, {
                  responseHeaders: [
                    {
                      headerKey: "E-Tag",
                      headerValue: "68ZpTzuAFdm85xPNtr3EOzySP8Q"
                    }
                  ]
                }).then((res) => {
                  console.info(msg + " precompile result: " + res);
                }).catch((err: number) => {
                  console.error(msg + " precompile error: " + err);
                })
              } catch (error) {
                console.error(`${msg} ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 10100)
              }
              break;
            }
            case "testPrecompileJavaScript010": {
              let msg = "testPrecompileJavaScript010"
              try {
                this.controller.precompileJavaScript('https://exmaple.com/example.js', undefined, {
                  responseHeaders: [
                    {
                      headerKey: "E-Tag",
                      headerValue: "68ZpTzuAFdm85xPNtr3EOzySP8Q"
                    }
                  ]
                }).then((res) => {
                  console.info(msg + " precompile result: " + res);
                }).catch((err: number) => {
                  console.error(msg + " precompile error: " + err);
                })
              } catch (error) {
                console.error(`${msg} ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 10101)
              }
              break;
            }
            case "testPrecompileJavaScript011": {
              let msg = "testPrecompileJavaScript011"
              this.controller.precompileJavaScript('https://exmaple.com/example.js', 'hawe', null).then((res) => {
                console.info(msg + " precompile result: " + res);
                Utils.emitEvent(res, 10102)
              }).catch((err: number) => {
                console.error(msg + " precompile error: " + err);
              })
              break;
            }
            case "testPrecompileJavaScript012": {
              let msg = "testPrecompileJavaScript012"
              this.controller.precompileJavaScript('https://exmaple.com/example.js', 'hawe', undefined)
                .then((res) => {
                  console.info(msg + " precompile result: " + res);
                  Utils.emitEvent(res, 10103)
                })
                .catch((err: number) => {
                  console.error(msg + " precompile error: " + err);
                })
              break;
            }
            case "testPrecompileJavaScript013": {
              let msg = "testPrecompileJavaScript013"
              this.controller.precompileJavaScript("https://exmaple.com/example.js", 'hawe', {
                responseHeaders: [
                  {
                    headerKey: "E-Tag",
                    headerValue: "123456"
                  }
                ]
              }).then((res) => {
                console.info(msg + " precompile result: " + res);
                Utils.emitEvent(res, 10104)
              }).catch((err: number) => {
                console.error(msg + " precompile error: " + err);
              })
              break;
            }
            case "testPrecompileJavaScript014": {
              let msg = "testPrecompileJavaScript014"
              this.controller.precompileJavaScript("https://exmaple.com/example.js", 'hawe', {
                responseHeaders: [
                  {
                    headerKey: "Last-Modified",
                    headerValue: "123456"
                  }
                ]
              }).then((res) => {
                console.info(msg + " precompile result: " + res);
                Utils.emitEvent(res, 10105)
              }).catch((err: number) => {
                console.error(msg + " precompile error: " + err);
              })
              break;
            }
            case "testPrecompileJavaScript015": {
              let msg = "testPrecompileJavaScript015"
              this.controller.precompileJavaScript("https://exmaple.com/example.js", 'hawe', {
                responseHeaders: [
                  {
                    headerKey: "abc",
                    headerValue: "def"
                  }
                ]
              }).then((res) => {
                console.info(msg + " precompile result: " + res);
                Utils.emitEvent(res, 10106)
              }).catch((err: number) => {
                console.error(msg + " precompile error: " + err);
              })
              break;
            }
            case "testPrecompileJavaScript016": {
              let msg = "testPrecompileJavaScript016"
              this.controller.precompileJavaScript("https://exmaple.com/example.js", 'hawe', {
                responseHeaders: [
                  {
                    headerKey: "",
                    headerValue: ""
                  }
                ]
              }).then((res) => {
                console.info(msg + " precompile result: " + res);
                Utils.emitEvent(res, 10107)
              }).catch((err: number) => {
                console.error(msg + " precompile error: " + err);
              })
              break;
            }
            case "testPrecompileJavaScript017": {
              let msg = "testPrecompileJavaScript017"
              this.controller.precompileJavaScript("https://exmaple.com/example.js", 'hawe', {
                responseHeaders: [
                  {
                    headerKey: " ",
                    headerValue: " "
                  }
                ]
              }).then((res) => {
                console.info(msg + " precompile result: " + res);
                Utils.emitEvent(res, 10108)
              }).catch((err: number) => {
                console.error(msg + " precompile error: " + err);
              })
              break;
            }
            case "testPrecompileJavaScript018": {
              let msg = "testPrecompileJavaScript018"
              this.controller.precompileJavaScript("https://exmaple.com/example.js", 'hawe', {
                responseHeaders: [
                  {
                    headerKey: "中文",
                    headerValue: "中文"
                  }
                ]
              }).then((res) => {
                console.info(msg + " precompile result: " + res);
                Utils.emitEvent(res, 10109)
              }).catch((err: number) => {
                console.error(msg + " precompile error: " + err);
              })
              break;
            }
            case "testPrecompileJavaScript019": {
              let msg = "testPrecompileJavaScript019"
              getContext().resourceManager.getRawFileContent("index.html").then((content) => {
                console.log(msg + " getRawFileContent result: " + content)
                this.controller.precompileJavaScript("https://exmaple.com/example.js", content, {
                  responseHeaders: [
                    {
                      headerKey: "E-Tag",
                      headerValue: "68ZpTzuAFdm85xPNtr3EOzySP8Q"
                    }
                  ]
                }).then((res) => {
                  console.info(msg + " precompile result: " + res);
                }).catch((err: number) => {
                  console.error(msg + " precompile error: " + err);
                  Utils.emitEvent(err, 10110)
                })
              }).catch((err) => {
                console.error(`${msg} getRawFileContent ErrorCode: ${err.code},  Message: ${err.message}`);
              })
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .javaScriptProxy({
          object: this.jsObj,
          name: "backToEts",
          methodList: ["test", "toString"],
          controller: this.controller
        })

    }
  }
}
