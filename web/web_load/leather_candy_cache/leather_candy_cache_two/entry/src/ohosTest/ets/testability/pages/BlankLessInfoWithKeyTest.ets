/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
// import image from '@ohos.multimedia.image';
import { JsProxyObject } from '../../test/Interfaces';
// import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
// import { Hypium } from '@ohos/hypium';
// import testsuite from '../../test/List.test';
// import { BusinessError } from '@ohos.base';
import webview from '@ohos.web.webview';
import { waitForExist } from '../../test/WaitTest.test';

@Entry
@Component
struct blankLessInfoWithKeyTest {
  controller: webView.WebviewController = new webView.WebviewController();
  newController: webView.WebviewController = new webView.WebviewController();
  message: webView.WebMessageExt = new webView.WebMessageExt();
  @State str: string = ''
  @State javaScriptAccess: boolean = true;
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 148001,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
    webView.WebviewController.initializeWebEngine()
  }

  onPageHide() {
    events_emitter.off(148001)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
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
        Button('blankLessInfoWithKeyTest click').key('blankLessInfoWithKeyTestButton').onClick(async () => {
          console.info('key==>' + this.str)
          await waitForExist(() => this.isPageEnd, this.str, 0);
          await waitForExist(() => this.isReceive, this.str, 0);
          this.isReceive = -1;
          switch (this.str) {
            case 'testblankLessInfoWithKey001': {
              let msg = 'testblankLessInfoWithKey001'
              let key = 'blankLessInfoWithKey';
              try {
                this.isPageEnd = -1
                this.controller.loadUrl($rawfile('indexPhoto.html'))
                await waitForExist(() => this.isPageEnd, this.str, 0);
                console.log(msg, 'first loadUrl finish');
                let infoOne = this.controller.getBlanklessInfoWithKey(key);
                console.log(msg, `入参:${key}`,`返回值:${JSON.stringify(infoOne)}`,`预期值：0`,`实际值${infoOne.errCode}`);
                console.log(msg, 'getBlanklessInfoWithKey loadingTime:' + infoOne.loadingTime);
                if (infoOne.similarity >= 0.33) {
                  Utils.emitEvent(infoOne.errCode, 148010)
                  return;
                }

                this.isPageEnd = -1
                this.controller.loadUrl($rawfile('indexPhoto.html'))
                await waitForExist(() => this.isPageEnd, this.str, 0);
                console.log(msg, 'first loadUrl finish');
                let infoTwo = this.controller.getBlanklessInfoWithKey(key);
                console.log(msg, `入参:${key}`,`返回值:${JSON.stringify(infoTwo)}`,`预期值：0`,`实际值${infoTwo.errCode}`);
                console.log(msg, 'getBlanklessInfoWithKey info2:' + JSON.stringify(infoTwo));
                if (infoTwo.similarity >= 0.33) {
                  Utils.emitEvent(infoTwo.errCode, 148010)
                  return;
                }

                this.isPageEnd = -1
                this.controller.loadUrl($rawfile('indexPhoto.html'))
                await waitForExist(() => this.isPageEnd, this.str, 0);
                console.log(msg, 'first loadUrl finish');
                let infoThree = this.controller.getBlanklessInfoWithKey(key);
                console.log(msg, `入参:${key}`,`返回值:${JSON.stringify(infoThree)}`,`预期值：0`,`实际值${infoThree.errCode}`);
                console.log(msg, 'getBlanklessInfoWithKey info3:' + JSON.stringify(infoThree));
                if (infoThree.similarity >= 0.33) {
                  Utils.emitEvent(infoThree.errCode, 148010)
                  return;
                }

                this.isPageEnd = -1
                this.controller.refresh();
                await waitForExist(() => this.isPageEnd, this.str, 0);
                console.log(msg, 'first loadUrl finish');
                let infoFour = this.controller.getBlanklessInfoWithKey(key);
                console.log(msg, `入参:${key}`,`返回值:${JSON.stringify(infoFour)}`,`预期值：0`,`实际值${infoFour.errCode}`);
                console.log(msg, 'getBlanklessInfoWithKey info4:' + JSON.stringify(infoFour));
                if (infoFour.similarity >= 0.33) {
                  Utils.emitEvent(infoFour.errCode, 148010)
                  return;
                }

                this.isPageEnd = -1;
                this.controller.refresh()
                await waitForExist(() => this.isPageEnd, this.str, 0);
                console.log(msg, 'third loadUrl finish');
                let infoFive = this.controller.getBlanklessInfoWithKey(key);
                console.log(msg, `入参:${key}`,`返回值:${JSON.stringify(infoFive)}`,`预期值：0`,`实际值${infoFive.errCode}`);
                console.log(msg, 'getBlanklessInfoWithKey info5:' + JSON.stringify(infoFive));
                if (infoFive.errCode == webview.WebBlanklessErrorCode.SUCCESS) {
                  if (infoFive.similarity >= 0.33) {
                    console.log(msg, 'newInfo:' + infoFive.errCode);
                    let num1 = this.controller.setBlanklessLoadingWithKey(key, true);
                    Utils.emitEvent(infoFive.errCode, 148010)
                    return;
                  }
                }
              } catch (error) {
                console.log(msg, 'ErrorCode: ' + error.code, ' Message: ' + error.message);
                if (Number(error.code) == 801) {
                  Utils.emitEvent(0, 148010)
                } else {
                  Utils.emitEvent(401, 148010)
                }
                console.error(`${msg} ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testblankLessInfoWithKey002': {
              let msg = 'testblankLessInfoWithKey002';
              let key = '';
              try {
                let infoOne: webview.BlanklessInfo = this.controller.getBlanklessInfoWithKey(key);
                console.log(msg, 'getBlanklessInfoWithKey info:' + JSON.stringify(infoOne));
                if (infoOne.errCode === webview.WebBlanklessErrorCode.ERR_INVALID_PARAM) {
                  Utils.emitEvent(infoOne.errCode, 148020)
                  console.log(msg, `入参:${key}`,`返回值:${JSON.stringify(infoOne)}`,`预期值：-2`,`实际值${infoOne.errCode}`);
                  this.controller.setBlanklessLoadingWithKey(key, true);
                  console.log(msg, 'setBlanklessLoadingWithKey faild')
                } else {
                  console.log(msg, 'getBlanklessInfoWithKey info err');
                }
              } catch (error) {
                if (Number(error.code) == 801) {
                  Utils.emitEvent(-2, 148020)
                } else {
                  Utils.emitEvent(401, 148020)
                }
                console.error(`${msg} ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testblankLessInfoWithKey003': {
              let msg = 'testblankLessInfoWithKey003'
              try {
                let key = 'blankLessInfoWithKey';
                let infoOne: webview.BlanklessInfo = this.newController.getBlanklessInfoWithKey(key);
                console.log(msg, 'getBlanklessInfoWithKey info:' + JSON.stringify(infoOne));
                if (infoOne.errCode === webview.WebBlanklessErrorCode.ERR_CONTROLLER_NOT_INITED) {
                  this.newController.setBlanklessLoadingWithKey(key, false);
                  console.log(msg, `入参:${key}`,`返回值:${JSON.stringify(infoOne)}`,`预期值：-3`,`实际值${infoOne.errCode}`);
                  Utils.emitEvent(infoOne.errCode, 148030)
                  console.log(msg, 'setBlanklessLoadingWithKey faild')
                } else {
                  console.log(msg, 'getBlanklessInfoWithKey info err');
                }
              } catch (error) {
                if (Number(error.code) == 801) {
                  Utils.emitEvent(-3, 148030)
                } else {
                  Utils.emitEvent(401, 148030)
                }
                console.error(`${msg} ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testblankLessInfoWithKey004': {
              let msg = 'testblankLessInfoWithKey004'
              try {
                let infoOne: webview.BlanklessInfo = this.newController.getBlanklessInfoWithKey(null);
                console.log(msg, 'getBlanklessInfoWithKey info:' + JSON.stringify(infoOne));
              } catch (error) {
                Utils.emitEvent(401, 148040)
                console.error(`${msg} ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testblankLessInfoWithKey005': {
              let msg = 'testblankLessInfoWithKey005'
              let key = 'blankLessInfoWithKey';
              let newKey = 'newBlankLessInfoWithKey';
              try {
                let infoOne: webview.BlanklessInfo = this.controller.getBlanklessInfoWithKey(key);
                console.log(msg, 'getBlanklessInfoWithKey info:' + JSON.stringify(infoOne));
                if (infoOne.errCode === webview.WebBlanklessErrorCode.SUCCESS) {
                  let errcode = this.controller.setBlanklessLoadingWithKey(newKey, true);
                  if (errcode == webview.WebBlanklessErrorCode.ERR_KEY_NOT_MATCH) {
                    console.log(msg, `入参:${key}`,`返回值:${JSON.stringify(infoOne)}`,`预期值：-4`,`实际值${infoOne.errCode}`);
                    Utils.emitEvent(errcode, 148050)
                  }
                  console.log(msg, 'setBlanklessLoadingWithKey faild')
                } else {
                  console.log(msg, 'getBlankless info err');
                }
              } catch (error) {
                if (Number(error.code) == 801) {
                  Utils.emitEvent(-4, 148050)
                } else {
                  Utils.emitEvent(401, 148050)
                }
                console.error(`${msg} ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testblankLessInfoWithKey006': {
              let msg = 'testblankLessInfoWithKey006'
              let key = 'blankLessInfoWithKey';
              try {
                this.isPageEnd = -1;
                this.controller.refresh();
                await waitForExist(() => this.isPageEnd, this.str, 0);
                console.log(msg, 'first loadUrl finish');
                this.controller.getBlanklessInfoWithKey(key);
                webView.WebviewController.clearBlanklessLoadingCache([key])
                this.isPageEnd = -1;
                this.controller.refresh();
                await waitForExist(() => this.isPageEnd, this.str, 0);
                console.log(msg, 'second loadUrl finish');
                let infoOne = this.controller.getBlanklessInfoWithKey(key);
                console.log(msg, 'getBlanklessInfoWithKey info:' + JSON.stringify(infoOne));
                if (infoOne.errCode === webview.WebBlanklessErrorCode.SUCCESS) {
                  let newInfo = this.controller.setBlanklessLoadingWithKey(key, true);
                  if (newInfo === webview.WebBlanklessErrorCode.ERR_SIGNIFICANT_CHANGE) {
                    console.log(msg, `入参:${key}`,`返回值:${JSON.stringify(infoOne)}`,`预期值：-5`,`实际值${infoOne.errCode}`);
                    Utils.emitEvent(newInfo, 148060)
                  }
                }
              } catch (error) {
                console.log(msg, 'testblankLessInfoWithKey006' + error)
                if (Number(error.code) == 801) {
                  Utils.emitEvent(-5, 148060)
                } else {
                  Utils.emitEvent(401, 148060)
                }
                console.error(`${msg} ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testblankLessInfoWithKey007': {
              let msg = 'testblankLessInfoWithKey007'
              try {
                let key = 'blankLessInfoWithKey';
                let infoOne: webview.BlanklessInfo = this.controller.getBlanklessInfoWithKey(key);
                console.log('${msg}', 'info:' + JSON.stringify(infoOne))
                this.controller.setBlanklessLoadingWithKey(null, true);
              } catch (error) {
                Utils.emitEvent(401, 148070)
                console.error(`${msg} ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testblankLessInfoWithKey008': {
              let msg = 'testblankLessInfoWithKey008'
              let key = 'blankLessInfoWithKey';
              try {
                webView.WebviewController.clearBlanklessLoadingCache(null)
              } catch (error) {
                Utils.emitEvent(401, 148080)
                console.error(`${msg} ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('indexPhoto.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .onPageEnd(() => {
          this.isPageEnd = 0
        })
    }
  }
}
