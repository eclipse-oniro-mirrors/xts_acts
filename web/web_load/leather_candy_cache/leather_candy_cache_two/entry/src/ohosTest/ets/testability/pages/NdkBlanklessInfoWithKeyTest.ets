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
import { JsProxyObject } from '../../test/Interfaces';
import webview from '@ohos.web.webview';
import testNapi from 'libentry.so'
import { waitForExist } from '../../test/WaitTest.test';

@Entry
@Component
struct ndkBlanklessInfoWithKeyTest {
  @State webTag: string = 'WebTag';
  controller: webview.WebviewController = new webview.WebviewController(this.webTag);
  message: webView.WebMessageExt = new webView.WebMessageExt();
  @State str: string = ''
  @State javaScriptAccess: boolean = true;
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 148101,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(148101)
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
        Button('ndkBlanklessInfoWithKeyTest click').key('ndkBlanklessInfoWithKeyTestButton').onClick(async () => {
          console.info('key==>' + this.str)
          await waitForExist(() => this.isPageEnd, this.str, 0);
          await waitForExist(() => this.isReceive, this.str, 0);
          this.isReceive = -1
          switch (this.str) {
            case 'testndkBlanklessInfoWithKey001': {
              let msg = 'testndkBlanklessInfoWithKey001'
              let num1: number = -1;
              let num2: number = -1;
              let num3: number = -1;
              this.isPageEnd = -1;
              this.controller.loadUrl($rawfile('indexPhoto.html'))
              await waitForExist(() => this.isPageEnd, this.str, 0);
              console.log(msg, 'first loadUrl finish');
              num1 = testNapi.doblankless_Success(this.webTag);
              console.log(msg, `预期值：0`,`实际值${num1}`);
              console.log(msg, 'testNapi.doblankless_SUCCESS:' + num1);
              if (num1 != 801) {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('indexPhoto.html'))
                await waitForExist(() => this.isPageEnd, this.str, 0);
                console.log(msg, 'second loadUrl finish');
                num2 = testNapi.doblankless_Success(this.webTag);
                console.log(msg, `预期值：0`,`实际值${num2}`);
                console.log(msg, 'testNapi.doblankless_SUCCESS:' + num2);
                if (num2 != 801) {
                  this.isPageEnd = -1;
                  this.controller.loadUrl($rawfile('indexPhoto.html'))
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  console.log(msg, 'third loadUrl finish');
                  num3 = testNapi.doblankless_Success(this.webTag);
                  console.log(msg, `预期值：0`,`实际值${num3}`);
                  console.log(msg, 'testNapi.doblankless_SUCCESS:' + num1);
                  if (num3 != 801) {
                    Utils.emitEvent(num3, 148110)
                  } else {
                    Utils.emitEvent(0, 148110)
                  }
                } else {
                  Utils.emitEvent(0, 148110)
                }
              } else {
                Utils.emitEvent(0, 148110)
              }
              break;
            }
            case 'testndkBlanklessInfoWithKey002': {
              let msg = 'testndkBlanklessInfoWithKey002';
              let num: number = testNapi.doblankless_INVALID_ARGS(this.webTag);
              console.log(msg, `预期值：-2`,`实际值${num}`);
              console.log(msg, 'testNapi.doblankless_INVALID_ARGS:' + num);
              if (num == 801) {
                Utils.emitEvent(-2, 148120)
              } else {
                Utils.emitEvent(num, 148120)
              }
              break;
            }
            case 'testndkBlanklessInfoWithKey003': {
              let msg = 'testndkBlanklessInfoWithKey003'
              let num: number = testNapi.doblankless_CONTROLLER_NOT_INITED(this.webTag);
              console.log(msg, `预期值：-3`,`实际值${num}`);
              console.log(msg, 'testNapi.CONTROLLER_NOT_INITED:' + num);
              if (num == 801) {
                Utils.emitEvent(-3, 148130)
              } else {
                Utils.emitEvent(num, 148130)
              }
              break;
            }
            case 'testndkBlanklessInfoWithKey004': {
              let msg = 'testndkBlanklessInfoWithKey004'
              let num: number = testNapi.doblankless_ERR_KEY_NOT_MATCH(this.webTag);
              console.log(msg, `预期值：-4`,`实际值${num}`);
              console.log(msg, 'testNapi.doblankless_ERR_KEY_NOT_MATCH:' + num);
              if (num == 801) {
                Utils.emitEvent(-4, 148140)
              } else {
                Utils.emitEvent(num, 148140)
              }
              break;
            }
            case 'testndkBlanklessInfoWithKey005': {
              let msg = 'testndkBlanklessInfoWithKey005'
              let num: number = -1
              this.isPageEnd = -1;
              testNapi.clearBlanklessLoadingCache(this.webTag);
              await this.controller.refresh();
              await waitForExist(() => this.isPageEnd, this.str, 0);
              let num1: number = testNapi.doblankless_Success(this.webTag);
              console.log(`${msg}`, 'first loadUrl finish:' + num1);
              testNapi.clearBlanklessLoadingCache(this.webTag);
              this.isPageEnd = -1;
              await this.controller.refresh();
              await waitForExist(() => this.isPageEnd, this.str, 0);
              console.log(`${msg}`, 'second loadUrl finish');
              num = testNapi.doblankless_Success(this.webTag);
              console.log(msg, `预期值：-5`,`实际值${num}`);
              console.log(`${msg}`, 'testNapi.doblankless_SUCCESS0:' + num);
              if (num == 801) {
                Utils.emitEvent(-5, 148150)
                console.log(`${msg}`, 'testNapi.doblankless_SUCCESS1:' + num);
              } else {
                Utils.emitEvent(num, 148150)
                console.log(`${msg}`, 'testNapi.doblankless_SUCCESS2:' + num);
              }
              break;
            }
            case 'testndkBlanklessInfoWithKey006': {
              let msg = 'testndkBlanklessInfoWithKey006'
              let num: number = -1
              this.isPageEnd = -1;
              testNapi.clearBlanklessLoadingCache(this.webTag);
              await this.controller.refresh();
              await waitForExist(() => this.isPageEnd, this.str, 0);
              let num1: number = testNapi.doblankless_INVALID_ARGS_SET_ZERO(this.webTag);
              console.log(`${msg}`, 'first loadUrl finish:' + num1);
              this.isPageEnd = -1;
              await this.controller.refresh();
              await waitForExist(() => this.isPageEnd, this.str, 0);
              console.log(`${msg}`, 'second loadUrl finish');
              num = testNapi.doblankless_INVALID_ARGS_SET_ZERO(this.webTag);
              console.log(msg, `预期值：-2`,`1 实际值${num}`);
              this.isPageEnd = -1;
              await this.controller.refresh();
              await waitForExist(() => this.isPageEnd, this.str, 0);
              console.log(`${msg}`, 'third loadUrl finish');
              num = testNapi.doblankless_INVALID_ARGS_SET_ZERO(this.webTag);
              console.log(msg, `预期值：-2`,`2 实际值${num}`);
              console.log(`${msg}`, 'testNapi.doblankless_INVALID_ARGS_SET_ZERO 0:' + num);
              if (num == 801) {
                Utils.emitEvent(-2, 148160)
                console.log(`${msg}`, 'testNapi.doblankless_INVALID_ARGS_SET_ZERO 1:' + num);
              } else {
                Utils.emitEvent(num, 148160)
                console.log(`${msg}`, 'testNapi.doblankless_INVALID_ARGS_SET_ZERO 2:' + num);
              }
              break;
            }
            case 'testndkBlanklessInfoWithKey007': {
              let msg = 'testndkBlanklessInfoWithKey007'
              let num: number = -1
              this.isPageEnd = -1;
              testNapi.clearBlanklessLoadingCache(this.webTag);
              await this.controller.refresh();
              await waitForExist(() => this.isPageEnd, this.str, 0);
              let num1: number = testNapi.doblankless_INVALID_ARGS_SET_ONE(this.webTag);
              console.log(`${msg}`, 'first loadUrl finish:' + num1);
              this.isPageEnd = -1;
              await this.controller.refresh();
              await waitForExist(() => this.isPageEnd, this.str, 0);
              console.log(`${msg}`, 'second loadUrl finish');
              num = testNapi.doblankless_INVALID_ARGS_SET_ONE(this.webTag);
              console.log(msg, `预期值：-5`,`1 实际值${num}`);
              this.isPageEnd = -1;
              await this.controller.refresh();
              await waitForExist(() => this.isPageEnd, this.str, 0);
              console.log(`${msg}`, 'third loadUrl finish');
              num = testNapi.doblankless_INVALID_ARGS_SET_ONE(this.webTag);
              console.log(msg, `预期值：0`,`2 实际值${num}`);
              console.log(`${msg}`, 'testNapi.doblankless_INVALID_ARGS_SET_ONE 0:' + num);
              if (num == 801) {
                Utils.emitEvent(0, 148170)
                console.log(`${msg}`, 'testNapi.doblankless_INVALID_ARGS_SET_ONE 1:' + num);
              } else {
                Utils.emitEvent(num, 148170)
                console.log(`${msg}`, 'testNapi.doblankless_INVALID_ARGS_SET_ONE 2:' + num);
              }
              break;
            }
            case 'testndkBlanklessInfoWithKey008': {
              let msg = 'testndkBlanklessInfoWithKey008'
              let num: number = -1
              this.isPageEnd = -1;
              testNapi.clearBlanklessLoadingCache(this.webTag);
              await this.controller.refresh();
              await waitForExist(() => this.isPageEnd, this.str, 0);
              let num1: number = testNapi.doblankless_INVALID_ARGS_SET_2048(this.webTag);
              console.log(`${msg}`, 'first loadUrl finish:' + num1);
              this.isPageEnd = -1;
              await this.controller.refresh();
              await waitForExist(() => this.isPageEnd, this.str, 0);
              console.log(`${msg}`, 'second loadUrl finish');
              num = testNapi.doblankless_INVALID_ARGS_SET_2048(this.webTag);
              console.log(msg, `预期值：-5`,`1 实际值${num}`);
              this.isPageEnd = -1;
              await this.controller.refresh();
              await waitForExist(() => this.isPageEnd, this.str, 0);
              console.log(`${msg}`, 'third loadUrl finish');
              num = testNapi.doblankless_INVALID_ARGS_SET_2048(this.webTag);
              console.log(msg, `预期值：0`,`2 实际值${num}`);
              console.log(`${msg}`, 'testNapi.doblankless_INVALID_ARGS_SET_2048 0:' + num);
              if (num == 801) {
                Utils.emitEvent(0, 148180)
                console.log(`${msg}`, 'testNapi.doblankless_INVALID_ARGS_SET_2048 1:' + num);
              } else {
                Utils.emitEvent(num, 148180)
                console.log(`${msg}`, 'testNapi.doblankless_INVALID_ARGS_SET_2048 2:' + num);
              }
              break;
            }
            case 'testndkBlanklessInfoWithKey009': {
              let msg = 'testndkBlanklessInfoWithKey009'
              let num: number = -1
              this.isPageEnd = -1;
              testNapi.clearBlanklessLoadingCache(this.webTag);
              await this.controller.refresh();
              await waitForExist(() => this.isPageEnd, this.str, 0);
              let num1: number = testNapi.doblankless_INVALID_ARGS_SET_2049(this.webTag);
              console.log(`${msg}`, 'first loadUrl finish:' + num1);
              testNapi.clearBlanklessLoadingCache(this.webTag);
              this.isPageEnd = -1;
              await this.controller.refresh();
              await waitForExist(() => this.isPageEnd, this.str, 0);
              console.log(`${msg}`, 'second loadUrl finish');
              num = testNapi.doblankless_INVALID_ARGS_SET_2049(this.webTag);
              console.log(msg, `预期值：-2`,`实际值${num}`);
              console.log(`${msg}`, 'testNapi.doblankless_INVALID_ARGS_SET_2049 0:' + num);
              if (num == 801) {
                Utils.emitEvent(-2, 148190)
                console.log(`${msg}`, 'testNapi.doblankless_INVALID_ARGS_SET_2049 1:' + num);
              } else {
                Utils.emitEvent(num, 148190)
                console.log(`${msg}`, 'testNapi.doblankless_INVALID_ARGS_SET_2049 2:' + num);
              }
              break;
            }
            case 'testndkBlanklessInfoWithKey010': {
              let msg = 'testndkBlanklessInfoWithKey010'
              let num: number = -1
              this.isPageEnd = -1;
              testNapi.clearBlanklessLoadingCache(this.webTag);
              await this.controller.refresh();
              await waitForExist(() => this.isPageEnd, this.str, 0);
              let num1: number = testNapi.doblankless_INVALID_ARGS_SET_ONE(this.webTag);
              console.log(`${msg}`, 'first loadUrl finish:' + num1);
              this.isPageEnd = -1;
              await this.controller.refresh();
              await waitForExist(() => this.isPageEnd, this.str, 0);
              console.log(`${msg}`, 'second loadUrl finish');
              num = testNapi.doblankless_INVALID_ARGS_SET_ONE(this.webTag);
              console.log(msg, `预期值：-5`,`1 实际值${num}`);
              this.isPageEnd = -1;
              await this.controller.refresh();
              await waitForExist(() => this.isPageEnd, this.str, 0);
              console.log(`${msg}`, 'third loadUrl finish');
              num = testNapi.doblankless_INVALID_ARGS_SET_ONE(this.webTag);
              console.log(msg, `预期值：0`,`2 实际值${num}`);
              console.log(`${msg}`, 'testNapi.doblankless_INVALID_ARGS_SET_ONE 0:' + num);
              if (num == 801) {
                Utils.emitEvent(0, 148200)
                console.log(`${msg}`, 'testNapi.doblankless_INVALID_ARGS_SET_ONE 1:' + num);
              } else {
                Utils.emitEvent(num, 148200)
                console.log(`${msg}`, 'testNapi.doblankless_INVALID_ARGS_SET_ONE 2:' + num);
              }
              break;
            }
            case 'testndkBlanklessInfoWithKey011': {
              let msg = 'testndkBlanklessInfoWithKey011'
              let num: number = -1
              this.isPageEnd = -1;
              testNapi.clearBlanklessLoadingCache(this.webTag);
              await this.controller.refresh();
              await waitForExist(() => this.isPageEnd, this.str, 0);
              let num1: number = testNapi.doblankless_INVALID_ARGS_GET_2048(this.webTag);
              console.log(`${msg}`, 'first loadUrl finish:' + num1);
              this.isPageEnd = -1;
              await this.controller.refresh();
              await waitForExist(() => this.isPageEnd, this.str, 0);
              console.log(`${msg}`, 'second loadUrl finish');
              num = testNapi.doblankless_INVALID_ARGS_GET_2048(this.webTag);
              console.log(msg, `预期值：-5`,`1 实际值${num}`);
              this.isPageEnd = -1;
              await this.controller.refresh();
              await waitForExist(() => this.isPageEnd, this.str, 0);
              console.log(`${msg}`, 'third loadUrl finish');
              num = testNapi.doblankless_INVALID_ARGS_GET_2048(this.webTag);
              console.log(msg, `预期值：0`,`2 实际值${num}`);
              console.log(`${msg}`, 'testNapi.doblankless_INVALID_ARGS_GET_2048 0:' + num);
              if (num == 801) {
                Utils.emitEvent(0, 148210)
                console.log(`${msg}`, 'testNapi.doblankless_INVALID_ARGS_GET_2048 1:' + num);
              } else {
                Utils.emitEvent(num, 148210)
                console.log(`${msg}`, 'testNapi.doblankless_INVALID_ARGS_GET_2048 2:' + num);
              }
              break;
            }
            case 'testndkBlanklessInfoWithKey012': {
              let msg = 'testndkBlanklessInfoWithKey012'
              let num: number = -1
              this.isPageEnd = -1;
              testNapi.clearBlanklessLoadingCache(this.webTag);
              await this.controller.refresh();
              await waitForExist(() => this.isPageEnd, this.str, 0);
              let num1: number = testNapi.doblankless_INVALID_ARGS_GET_2049(this.webTag);
              console.log(`${msg}`, 'first loadUrl finish:' + num1);
              testNapi.clearBlanklessLoadingCache(this.webTag);
              this.isPageEnd = -1;
              await this.controller.refresh();
              await waitForExist(() => this.isPageEnd, this.str, 0);
              console.log(`${msg}`, 'second loadUrl finish');
              num = testNapi.doblankless_INVALID_ARGS_GET_2049(this.webTag);
              console.log(msg, `预期值：-2`,`实际值${num}`);
              console.log(`${msg}`, 'testNapi.doblankless_INVALID_ARGS_GET_2049 0:' + num);
              if (num == 801) {
                Utils.emitEvent(-2, 148220)
                console.log(`${msg}`, 'testNapi.doblankless_INVALID_ARGS_GET_2049 1:' + num);
              } else {
                Utils.emitEvent(num, 148220)
                console.log(`${msg}`, 'testNapi.doblankless_INVALID_ARGS_GET_2049 2:' + num);
              }
              break;
            }
            case 'testndkBlanklessInfoWithKey013': {
              let msg = 'testndkBlanklessInfoWithKey013'
              let num: number = -1
              this.isPageEnd = -1;
              testNapi.clearBlanklessLoadingCache100(this.webTag);
              await this.controller.refresh();
              await waitForExist(() => this.isPageEnd, this.str, 0);
              let num1: number = testNapi.doblankless_Success100(this.webTag);
              console.log(`${msg}`, 'first loadUrl finish:' + num1);
              testNapi.clearBlanklessLoadingCache100(this.webTag);
              await this.controller.refresh();
              await waitForExist(() => this.isPageEnd, this.str, 0);
              let num2: number = testNapi.doblankless_Success100(this.webTag);
              console.log(`${msg}`, 'second loadUrl finish:' + num2);
              this.isPageEnd = -1;
              await this.controller.refresh();
              await waitForExist(() => this.isPageEnd, this.str, 0);
              console.log(`${msg}`, 'third loadUrl finish');
              num = testNapi.doblankless_Success100(this.webTag);
              console.log(msg, `预期值：-5`,`实际值${num}`);
              console.log(`${msg}`, 'testNapi.doblankless_SUCCESS0:' + num);
              if (num == 801) {
                Utils.emitEvent(-5, 148230)
                console.log(`${msg}`, 'testNapi.doblankless_SUCCESS1:' + num);
              } else {
                Utils.emitEvent(num, 148230)
                console.log(`${msg}`, 'testNapi.doblankless_SUCCESS2:' + num);
              }
              break;
            }
            case 'testndkBlanklessInfoWithKey014': {
              let msg = 'testndkBlanklessInfoWithKey014'
              let num: number = -1
              this.isPageEnd = -1;
              testNapi.clearBlanklessLoadingCache101(this.webTag);
              await this.controller.refresh();
              await waitForExist(() => this.isPageEnd, this.str, 0);
              let num1: number = testNapi.doblankless_Success100(this.webTag);
              console.log(`${msg}`, 'first loadUrl finish:' + num1);
              await this.controller.refresh();
              await waitForExist(() => this.isPageEnd, this.str, 0);
              let num2: number = testNapi.doblankless_Success100(this.webTag);
              console.log(`${msg}`, 'second loadUrl finish:' + num2);
              this.isPageEnd = -1;
              await this.controller.refresh();
              await waitForExist(() => this.isPageEnd, this.str, 0);
              console.log(`${msg}`, 'third loadUrl finish');
              testNapi.clearBlanklessLoadingCache101(this.webTag);
              num = testNapi.doblankless_Success100(this.webTag);
              console.log(msg, `预期值：0`,`实际值${num}`);
              console.log(`${msg}`, 'testNapi.doblankless_SUCCESS0:' + num);
              if (num == 801) {
                Utils.emitEvent(0, 148240)
                console.log(`${msg}`, 'testNapi.doblankless_SUCCESS1:' + num);
              } else {
                Utils.emitEvent(num, 148240)
                console.log(`${msg}`, 'testNapi.doblankless_SUCCESS2:' + num);
              }
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('indexPhoto.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .onPageBegin(() => {
          this.isPageEnd = 0
        })
    }
  }
}
