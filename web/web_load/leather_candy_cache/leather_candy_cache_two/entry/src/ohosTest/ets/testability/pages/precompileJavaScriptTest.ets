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
  @State str: string = ''
  @State javaScriptAccess: boolean = true;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 148401,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
    webView.WebviewController.initializeWebEngine()
  }

  onPageHide() {
    events_emitter.off(148401)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
      }
    }
  }
  private jsObj: JsProxyObject = {
    test: (res: object) => {
      console.info('ets toString:' + String(res));
    },
    toString: (str: string) => {
      console.info('ets toString:' + String(str));
    },
    register: (res: object) => {
      return 'precompileJavaScript test';
    }
  }

  build() {
    Column() {
      Row() {
        Button("precompileJavaScriptTest click").key('precompileJavaScriptTestButton').onClick(async () => {
          console.info('key==>' + this.str)
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
                console.info(msg + ' precompile result: ' + res);
                Utils.emitEvent(res, 148410)
              }).catch((err: number) => {
                console.error(msg + ' precompile error: ' + err);
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
                  console.info(msg + ' precompile result: ' + res);
                }).catch((err: number) => {
                  console.error(msg + ' precompile error: ' + err);
                })
              } catch (error) {
                console.error(`${msg} ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 148420)
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
                  console.info(msg + ' precompile result: ' + res);
                }).catch((err: number) => {
                  console.error(msg + ' precompile error: ' + err);
                })
              } catch (error) {
                console.error(`${msg} ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 148430)
              }
              break;
            }
            case "testPrecompileJavaScript011": {
              let msg = "testPrecompileJavaScript011"
              this.controller.precompileJavaScript('https://exmaple.com/example.js', 'hawe', null).then((res) => {
                console.info(msg + ' precompile result: ' + res);
                Utils.emitEvent(res, 148440)
              }).catch((err: number) => {
                console.error(msg + ' precompile error: ' + err);
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
