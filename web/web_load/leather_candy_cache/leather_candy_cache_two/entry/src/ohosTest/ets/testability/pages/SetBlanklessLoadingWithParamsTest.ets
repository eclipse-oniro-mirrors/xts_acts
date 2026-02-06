/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { waitForExist } from '../../test/WaitTest.test';

@Entry
@Component
struct setBlanklessLoadingWithParamsTest {
  controller: webView.WebviewController = new webView.WebviewController();
  newController: webView.WebviewController = new webView.WebviewController();
  message: webView.WebMessageExt = new webView.WebMessageExt();
  @State str: string = ''
  @State urlKey: string = 'baseTestSetBlanklessLoadingWithKey'
  @State javaScriptAccess: boolean = true;
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 148501,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
    webView.WebviewController.initializeWebEngine()
  }

  onPageHide() {
    events_emitter.off(148501)
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
        Button('setBlanklessLoadingWithParamsTest click')
          .key('setBlanklessLoadingWithParamsTestButton')
          .onClick(async () => {
            console.info('key==>' + this.str)
            await waitForExist(() => this.isPageEnd, this.str, 0);
            await waitForExist(() => this.isReceive, this.str, 0);
            this.isReceive = -1;
            switch (this.str) {
              case 'testSetBlanklessLoadingWithParams001': {
                let msg = 'testSetBlanklessLoadingWithParams001'
                let key = 'setBlanklessLoadingWithParams001';
                try {
                  this.isPageEnd = -1
                  this.controller.loadUrl($rawfile('indexPhoto.html'))
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  console.log(msg, 'first loadUrl finish');
                  webView.WebviewController.clearBlanklessLoadingCache([key]);
                  let infoOne = this.controller.getBlanklessInfoWithKey(key);
                  console.log(msg, `getBlanklessInfoWithKey 入参:${key}`, `返回值:${JSON.stringify(infoOne)}`,
                    `预期值：0`,
                    `实际值${infoOne.errCode}`);
                  console.log(msg, 'getBlankless infoOne success');
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  console.log(msg, 'second loadUrl finish');
                  let infoTwo = this.controller.getBlanklessInfoWithKey(key);
                  console.log(msg, ` 2 getBlanklessInfoWithKey 入参:${key}`, `返回值:${JSON.stringify(infoTwo)}`,
                    `预期值：0`,
                    `实际值${infoTwo.errCode}`);
                  console.log(msg, 'getBlankless infoTwo success');
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  console.log(msg, 'third loadUrl finish');
                  let infoThree = this.controller.getBlanklessInfoWithKey(key);
                  console.log(msg, ` 3 getBlanklessInfoWithKey 入参:${key}`, `返回值:${JSON.stringify(infoThree)}`,
                    `预期值：0`,
                    `实际值${infoThree.errCode}`);
                  console.log(msg, 'getBlankless infoThree success');
                  let param: webview.BlanklessLoadingParam = {
                    enable: true,
                    duration: 500,
                    expirationTime: 0,
                    callback: (info: webview.BlanklessFrameInterpolationInfo) => {
                      // 数据监控
                      console.log(msg +
                        ` callback key: ${info.key} , state: ${info.state} timestamp: ${info.timestamp} reason: ${info.reason}`)
                      // 插帧成功
                      if (info.state == webview.BlanklessFrameInterpolationState.FRAME_INTERPOLATION_SUCCEEDED) {
                        console.log(msg + `callback 插帧成功`);
                      }
                    }
                  }
                  let result = this.controller.setBlanklessLoadingWithParams(key, param);
                  console.log(msg + ` 实际值 result: ${result} 预期值 0`);
                  Utils.emitEvent(result, 148510);
                } catch (error) {
                  console.log(msg, 'ErrorCode: ' + error.code, ' Message: ' + error.message);
                  if (Number(error.code) == 801) {
                    Utils.emitEvent(0, 148510)
                    console.log(msg, ' 801 Capability not supported');
                  } else {
                    Utils.emitEvent(401, 148510)
                  }
                }
                break;
              }
              case 'testSetBlanklessLoadingWithParams002': {
                let msg = 'testSetBlanklessLoadingWithParams002'
                let key = 'setBlanklessLoadingWithParams002';
                try {
                  this.isPageEnd = -1
                  this.controller.loadUrl($rawfile('indexPhoto.html'))
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  console.log(msg, 'first loadUrl finish');
                  webView.WebviewController.clearBlanklessLoadingCache([key]);
                  let infoOne = this.controller.getBlanklessInfoWithKey(key);
                  console.log(msg, `入参:${key}`, `返回值:${JSON.stringify(infoOne)}`, `预期值：0`,
                    `实际值${infoOne.errCode}`);
                  console.log(msg, 'getBlankless success');
                  let param: webview.BlanklessLoadingParam = {
                    enable: true,
                    duration: 5000000,
                    expirationTime: 0,
                    callback: (info: webview.BlanklessFrameInterpolationInfo) => {
                      // 数据监控
                      console.log(msg +
                        `setBlanklessLoadingWithParams key: ${info.key} , state: ${info.state} timestamp: ${info.timestamp} reason: ${info.reason}`)
                    }
                  }
                  let result = this.controller.setBlanklessLoadingWithParams(key, param);
                  console.log(msg + `setBlanklessLoadingWithParams 实际值 result: ${result} 预期值 -6`);
                  if (result == webview.WebBlanklessErrorCode.ERR_DURATION_OUT_OF_RANGE) {
                    console.log(msg, `入参:${key}`, `返回值:${JSON.stringify(infoOne)}`, `预期值：-6`,
                      `实际值${infoOne.errCode}`);
                    Utils.emitEvent(result, 148520);
                  }
                } catch (error) {
                  console.log(msg, 'ErrorCode: ' + error.code, ' Message: ' + error.message);
                  if (Number(error.code) == 801) {
                    Utils.emitEvent(-6, 148520)
                    console.log(msg, ' 801 Capability not supported');
                  } else {
                    Utils.emitEvent(401, 148520)
                  }
                }
                break;
              }
              case 'testSetBlanklessLoadingWithParams003': {
                let msg = 'testSetBlanklessLoadingWithParams003'
                let key = 'setBlanklessLoadingWithParams003';
                try {
                  this.isPageEnd = -1
                  this.controller.loadUrl($rawfile('indexPhoto.html'))
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  console.log(msg, 'first loadUrl finish');
                  webView.WebviewController.clearBlanklessLoadingCache([key]);
                  let infoOne = this.controller.getBlanklessInfoWithKey(key);
                  console.log(msg, `入参:${key}`, `返回值:${JSON.stringify(infoOne)}`, `预期值：0`,
                    `实际值${infoOne.errCode}`);
                  console.log(msg, 'getBlanklessInfoWithKey loadingTime:' + infoOne.loadingTime);
                  console.log(msg, 'getBlankless success');
                  const date = new Date();
                  let param: webview.BlanklessLoadingParam = {
                    enable: true,
                    duration: 500,
                    expirationTime: date.getTime() + 2999000000,
                    callback: (info: webview.BlanklessFrameInterpolationInfo) => {
                      // 数据监控
                      console.log(msg +
                        `setBlanklessLoadingWithParams key: ${info.key} , state: ${info.state} timestamp: ${info.timestamp} reason: ${info.reason}`)
                    }
                  }
                  let result = this.controller.setBlanklessLoadingWithParams(this.urlKey, param);
                  console.log(msg + `setBlanklessLoadingWithParams 实际值 result: ${result} 预期值 -7`)
                  if (result == webview.WebBlanklessErrorCode.ERR_EXPIRATION_TIME_OUT_OF_RANGE) {
                    console.log(msg, `入参:${key}`, `返回值:${JSON.stringify(infoOne)}`, `预期值：-7`,
                      `实际值${infoOne.errCode}`);
                    Utils.emitEvent(result, 148530);
                  }
                } catch (error) {
                  console.log(msg, 'ErrorCode: ' + error.code, ' Message: ' + error.message);
                  if (Number(error.code) == 801) {
                    Utils.emitEvent(-7, 148530)
                    console.log(msg, ' 801 Capability not supported');
                  } else {
                    Utils.emitEvent(401, 148530)
                  }
                }
                break;
              }
              case 'testSetBlanklessLoadingWithParams004': {
                let msg = 'testSetBlanklessLoadingWithParams004';
                try {
                  let param: webview.BlanklessLoadingParam = {
                    enable: true,
                    duration: 500,
                    expirationTime: 0,
                    callback: (info: webview.BlanklessFrameInterpolationInfo) => {
                      // 数据监控
                      console.log(msg +
                        `setBlanklessLoadingWithParams key: ${info.key} , state: ${info.state} timestamp: ${info.timestamp} reason: ${info.reason}`)
                    }
                  }
                  let result = this.controller.setBlanklessLoadingWithParams(null, param);
                  console.log(msg + `setBlanklessLoadingWithParams  result: ${result}`)
                } catch (error) {
                  console.error(`${msg} ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (Number(error.code) == 801) {
                    Utils.emitEvent(401, 148540);
                    console.log(msg, ' 801 Capability not supported');
                  } else {
                    Utils.emitEvent(Number(error.code), 148540)
                  }
                }
                break;
              }
              case 'testSetBlanklessLoadingWithParams005': {
                let msg = 'testSetBlanklessLoadingWithParams005';
                try {
                  let param: webview.BlanklessLoadingParam = {
                    enable: true,
                    duration: 500,
                    expirationTime: 0,
                    callback: (info: webview.BlanklessFrameInterpolationInfo) => {
                      // 数据监控
                      console.log(msg +
                        `setBlanklessLoadingWithParams key: ${info.key} , state: ${info.state} timestamp: ${info.timestamp} reason: ${info.reason}`)
                    }
                  }
                  let result = this.controller.setBlanklessLoadingWithParams(undefined, param);
                  console.log(msg + `setBlanklessLoadingWithParams  result: ${result}`)
                } catch (error) {
                  console.error(`${msg} ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (Number(error.code) == 801) {
                    Utils.emitEvent(401, 148550);
                    console.log(msg, ' 801 Capability not supported');
                  } else {
                    Utils.emitEvent(Number(error.code), 148550)
                  }
                }
                break;
              }
              case 'testSetBlanklessLoadingWithParams006': {
                let msg = 'testSetBlanklessLoadingWithParams006';
                try {
                  let result = this.controller.setBlanklessLoadingWithParams(this.urlKey, null);
                  console.log(msg + `setBlanklessLoadingWithParams  result: ${result}`)
                } catch (error) {
                  if (Number(error.code) == 801) {
                    Utils.emitEvent(401, 148560);
                    console.log(msg, ' 801 Capability not supported');
                  } else {
                    Utils.emitEvent(Number(error.code), 148560);
                  }
                  console.error(`${msg} ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testSetBlanklessLoadingWithParams007': {
                let msg = 'testSetBlanklessLoadingWithParams007';
                try {
                  let result = this.controller.setBlanklessLoadingWithParams(this.urlKey, undefined);
                  console.log(msg + `setBlanklessLoadingWithParams  result: ${result}`)
                } catch (error) {
                  console.error(`${msg} ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (Number(error.code) == 801) {
                    Utils.emitEvent(401, 148570);
                    console.log(msg, ' 801 Capability not supported');
                  } else {
                    Utils.emitEvent(Number(error.code), 148570)
                  }
                }
                break;
              }
              case 'testSetBlanklessLoadingWithParams008': {
                let msg = 'testSetBlanklessLoadingWithParams008'
                let key = 'setBlanklessLoadingWithParams008';
                try {
                  this.isPageEnd = -1
                  this.controller.loadUrl($rawfile('indexPhoto.html'))
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  console.log(msg, 'first loadUrl finish');
                  webView.WebviewController.clearBlanklessLoadingCache([key]);
                  let infoOne = this.controller.getBlanklessInfoWithKey(key);
                  console.log(msg, `getBlanklessInfoWithKey 入参:${key}`, `返回值:${JSON.stringify(infoOne)}`,
                    `预期值：0`,
                    `实际值${infoOne.errCode}`);
                  console.log(msg, 'getBlankless infoOne success');
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  console.log(msg, 'second loadUrl finish');
                  let infoTwo = this.controller.getBlanklessInfoWithKey(key);
                  console.log(msg, ` 2 getBlanklessInfoWithKey 入参:${key}`, `返回值:${JSON.stringify(infoTwo)}`,
                    `预期值：0`,
                    `实际值${infoTwo.errCode}`);
                  console.log(msg, 'getBlankless infoTwo success');
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  console.log(msg, 'third loadUrl finish');
                  let infoThree = this.controller.getBlanklessInfoWithKey(key);
                  console.log(msg, ` 3 getBlanklessInfoWithKey 入参:${key}`, `返回值:${JSON.stringify(infoThree)}`,
                    `预期值：0`,
                    `实际值${infoThree.errCode}`);
                  console.log(msg, 'getBlankless infoThree success');
                  let param: webview.BlanklessLoadingParam = {
                    enable: true,
                    duration: 500,
                    expirationTime: 0,
                    callback: (info: webview.BlanklessFrameInterpolationInfo) => {
                      // 数据监控
                      console.log(msg +
                        ` callback key: ${info.key} , state: ${info.state} timestamp: ${info.timestamp} reason: ${info.reason}`)
                      // 插帧成功
                      if (info.state == 0) {
                        console.log(msg + webview.BlanklessFrameInterpolationState.FRAME_INTERPOLATION_SUCCEEDED + ` 插帧成功 `);
                      }
                      // 插帧失败
                      if (info.state == 1) {
                        let result = info.state == webview.BlanklessFrameInterpolationState.FRAME_INTERPOLATION_FAILED;
                        console.log(msg + ' 插帧失败 result： ' + result)
                      }
                      // 插帧移除
                      if (info.state == 2) {
                        let result = info.state == webview.BlanklessFrameInterpolationState.FRAME_INTERPOLATION_REMOVED;
                        console.log(msg + ' 插帧移除 result： ' + result)
                      }
                    }
                  }
                  let result = this.controller.setBlanklessLoadingWithParams(key, param);
                  console.log(msg + ` 实际值 result: ${result} 预期值 0`);
                  Utils.emitEvent(result, 148580);
                  return;
                } catch (error) {
                  console.log(msg, 'ErrorCode: ' + error.code, ' Message: ' + error.message);
                  if (Number(error.code) == 801) {
                    Utils.emitEvent(0, 148580)
                    console.log(msg, ' 801 Capability not supported');
                  } else {
                    Utils.emitEvent(401, 148580)
                  }
                }
                break;
              }
              case 'testSetBlanklessLoadingWithParams009': {
                let msg = 'testSetBlanklessLoadingWithParams009'
                let key = 'setBlanklessLoadingWithParams009';
                try {
                  this.isPageEnd = -1
                  this.controller.loadUrl($rawfile('indexPhoto.html'))
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  console.log(msg, 'first loadUrl finish');
                  webView.WebviewController.clearBlanklessLoadingCache([key]);
                  let infoOne = this.controller.getBlanklessInfoWithKey(key);
                  console.log(msg, `getBlanklessInfoWithKey 入参:${key}`, `返回值:${JSON.stringify(infoOne)}`,
                    `预期值：0`,
                    `实际值${infoOne.errCode}`);
                  console.log(msg, 'getBlankless infoOne success');
                  let param: webview.BlanklessLoadingParam = {
                    enable: true,
                    duration: 500,
                    expirationTime: 0,
                    callback: (info: webview.BlanklessFrameInterpolationInfo) => {
                      // 数据监控
                      console.log(msg +
                        ` callback key: ${info.key} , state: ${info.state} timestamp: ${info.timestamp} reason: ${info.reason}`)
                    }
                  }
                  let result = this.controller.setBlanklessLoadingWithParams(key, param);
                  console.log(msg + `setBlanklessLoadingWithParams 实际值 result: ${result} 预期值 -5`);
                  if (result == webview.WebBlanklessErrorCode.ERR_SIGNIFICANT_CHANGE) {
                    Utils.emitEvent(result, 148590);
                  }
                } catch (error) {
                  console.log(msg, 'ErrorCode: ' + error.code, ' Message: ' + error.message);
                  if (Number(error.code) == 801) {
                    Utils.emitEvent(-5, 148590)
                    console.log(msg, ' 801 Capability not supported');
                  } else {
                    Utils.emitEvent(401, 148590)
                  }
                }
                break;
              }
              case 'testSetBlanklessLoadingWithParams010': {
                let msg = 'testSetBlanklessLoadingWithParams010'
                let key = 'setBlanklessLoadingWithParams010';
                try {
                  this.isPageEnd = -1
                  this.controller.loadUrl($rawfile('indexPhoto.html'))
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  console.log(msg, 'first loadUrl finish');
                  webView.WebviewController.clearBlanklessLoadingCache([key]);
                  let infoOne = this.controller.getBlanklessInfoWithKey(key);
                  console.log(msg, `入参:${key}`, `返回值:${JSON.stringify(infoOne)}`, `预期值：0`,
                    `实际值${infoOne.errCode}`);
                  console.log(msg, 'getBlankless success');
                  let param: webview.BlanklessLoadingParam = {
                    enable: true,
                    duration: 500,
                    expirationTime: 0,
                    callback: (info: webview.BlanklessFrameInterpolationInfo) => {
                      // 数据监控
                      console.log(msg +
                        ` callback key: ${info.key} , state: ${info.state} timestamp: ${info.timestamp} reason: ${info.reason}`)
                    }
                  }
                  let result = this.controller.setBlanklessLoadingWithParams(this.urlKey, param);
                  console.log(msg + ` 实际值 result: ${result} 预期值 -4`);
                  Utils.emitEvent(result, 148600);
                } catch (error) {
                  console.log(msg, 'ErrorCode: ' + error.code, ' Message: ' + error.message);
                  if (Number(error.code) == 801) {
                    Utils.emitEvent(-4, 148600)
                    console.log(msg, ' 801 Capability not supported');
                  } else {
                    Utils.emitEvent(401, 148600)
                  }
                }
                break;
              }
              case 'testSetBlanklessLoadingWithParams011': {
                let msg = 'testSetBlanklessLoadingWithParams011'
                let key = 'setBlanklessLoadingWithParams011';
                try {
                  this.isPageEnd = -1
                  this.controller.loadUrl($rawfile('indexPhoto.html'))
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  console.log(msg, 'first loadUrl finish');
                  webView.WebviewController.clearBlanklessLoadingCache([key]);
                  let infoOne = this.controller.getBlanklessInfoWithKey(key);
                  console.log(msg, `入参:${key}`, `返回值:${JSON.stringify(infoOne)}`, `预期值：0`,
                    `实际值${infoOne.errCode}`);
                  console.log(msg, 'getBlankless success');
                  let param: webview.BlanklessLoadingParam = {
                    enable: true,
                    duration: 500,
                    expirationTime: 0,
                    callback: (info: webview.BlanklessFrameInterpolationInfo) => {
                      // 数据监控
                      console.log(msg +
                        ` callback key: ${info.key} , state: ${info.state} timestamp: ${info.timestamp} reason: ${info.reason}`)
                    }
                  }
                  let result = this.newController.setBlanklessLoadingWithParams(key, param);
                  console.log(msg + ` 实际值 result: ${result} 预期值 -3`);
                  if (result == webview.WebBlanklessErrorCode.ERR_CONTROLLER_NOT_INITED) {
                    Utils.emitEvent(result, 148610);
                  }
                } catch (error) {
                  console.log(msg, 'ErrorCode: ' + error.code, ' Message: ' + error.message);
                  if (Number(error.code) == 801) {
                    Utils.emitEvent(-3, 148610)
                    console.log(msg, ' 801 Capability not supported');
                  } else {
                    Utils.emitEvent(401, 148610)
                  }
                }
                break;
              }
              case 'testSetBlanklessLoadingWithParams012': {
                let msg = 'testSetBlanklessLoadingWithParams012'
                let key2049 =
                  'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
                try {
                  this.isPageEnd = -1
                  this.controller.loadUrl($rawfile('indexPhoto.html'))
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  console.log(msg, 'first loadUrl finish');
                  webView.WebviewController.clearBlanklessLoadingCache([key2049]);
                  let infoOne = this.controller.getBlanklessInfoWithKey(key2049);
                  console.log(msg, `入参:${key2049}`, `返回值:${JSON.stringify(infoOne)}`, `预期值：0`,
                    `实际值${infoOne.errCode}`);
                  console.log(msg, 'getBlankless success');
                  let param: webview.BlanklessLoadingParam = {
                    enable: true,
                    duration: 500,
                    expirationTime: 0,
                    callback: (info: webview.BlanklessFrameInterpolationInfo) => {
                      // 数据监控
                      console.log(msg +
                        ` callback key: ${info.key} , state: ${info.state} timestamp: ${info.timestamp} reason: ${info.reason}`)
                    }
                  }
                  let result = this.newController.setBlanklessLoadingWithParams(key2049, param);
                  console.log(msg + ` 实际值 result: ${result} 预期值 -2`);
                  if (result == webview.WebBlanklessErrorCode.ERR_INVALID_PARAM) {
                    Utils.emitEvent(result, 148620);
                  }
                } catch (error) {
                  console.log(msg, 'ErrorCode: ' + error.code, ' Message: ' + error.message);
                  if (Number(error.code) == 801) {
                    Utils.emitEvent(-2, 148620)
                    console.log(msg, ' 801 Capability not supported');
                  } else {
                    Utils.emitEvent(401, 148620)
                  }
                }
                break;
              }
              case 'testSetBlanklessLoadingWithParams013': {
                let msg = 'testSetBlanklessLoadingWithParams013'
                let key2048 =
                  'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
                try {
                  this.isPageEnd = -1
                  this.controller.loadUrl($rawfile('indexPhoto.html'))
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  console.log(msg, 'first loadUrl finish');
                  webView.WebviewController.clearBlanklessLoadingCache([key2048]);
                  let infoOne = this.controller.getBlanklessInfoWithKey(key2048);
                  console.log(msg, `getBlanklessInfoWithKey 入参:${key2048}`, `返回值:${JSON.stringify(infoOne)}`,
                    `预期值：0`,
                    `实际值${infoOne.errCode}`);
                  console.log(msg, 'getBlankless infoOne success');
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  console.log(msg, 'second loadUrl finish');
                  let infoTwo = this.controller.getBlanklessInfoWithKey(key2048);
                  console.log(msg, ` 2 getBlanklessInfoWithKey 入参:${key2048}`, `返回值:${JSON.stringify(infoTwo)}`,
                    `预期值：0`,
                    `实际值${infoTwo.errCode}`);
                  console.log(msg, 'getBlankless infoTwo success');
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  console.log(msg, 'third loadUrl finish');
                  let infoThree = this.controller.getBlanklessInfoWithKey(key2048);
                  console.log(msg, ` 3 getBlanklessInfoWithKey 入参:${key2048}`, `返回值:${JSON.stringify(infoThree)}`,
                    `预期值：0`,
                    `实际值${infoThree.errCode}`);
                  console.log(msg, 'getBlankless infoThree success');
                  let param: webview.BlanklessLoadingParam = {
                    enable: true,
                    duration: 500,
                    expirationTime: 0,
                    callback: (info: webview.BlanklessFrameInterpolationInfo) => {
                      // 数据监控
                      console.log(msg +
                        ` callback key: ${info.key} , state: ${info.state} timestamp: ${info.timestamp} reason: ${info.reason}`);
                      console.log(msg + `callback 插帧成功`);
                    }
                  }
                  let result = this.controller.setBlanklessLoadingWithParams(key2048, param);
                  console.log(msg + ` 实际值 result: ${result} 预期值 0`);
                  console.log(msg +
                    ` webview.WebBlanklessErrorCode.SUCCESS:  ${webview.WebBlanklessErrorCode.SUCCESS} `);
                  if (result == webview.WebBlanklessErrorCode.SUCCESS) {
                    Utils.emitEvent(result, 148630);
                  }
                } catch (error) {
                  console.log(msg, 'ErrorCode: ' + error.code, ' Message: ' + error.message);
                  if (Number(error.code) == 801) {
                    Utils.emitEvent(0, 148630)
                    console.log(msg, ' 801 Capability not supported');
                  } else {
                    Utils.emitEvent(401, 148630)
                  }
                }
                break;
              }
              case 'testSetBlanklessLoadingWithParams014': {
                let msg = 'testSetBlanklessLoadingWithParams014'
                let key1 = 'y';
                try {
                  this.isPageEnd = -1
                  this.controller.loadUrl($rawfile('indexPhoto.html'))
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  console.log(msg, 'first loadUrl finish');
                  webView.WebviewController.clearBlanklessLoadingCache([key1]);
                  let infoOne = this.controller.getBlanklessInfoWithKey(key1);
                  console.log(msg, `getBlanklessInfoWithKey 入参:${key1}`, `返回值:${JSON.stringify(infoOne)}`,
                    `预期值：0`,
                    `实际值${infoOne.errCode}`);
                  console.log(msg, 'getBlankless infoOne success');
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  console.log(msg, 'second loadUrl finish');
                  let infoTwo = this.controller.getBlanklessInfoWithKey(key1);
                  console.log(msg, ` 2 getBlanklessInfoWithKey 入参:${key1}`, `返回值:${JSON.stringify(infoTwo)}`,
                    `预期值：0`,
                    `实际值${infoTwo.errCode}`);
                  console.log(msg, 'getBlankless infoTwo success');
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  console.log(msg, 'third loadUrl finish');
                  let infoThree = this.controller.getBlanklessInfoWithKey(key1);
                  console.log(msg, ` 3 getBlanklessInfoWithKey 入参:${key1}`, `返回值:${JSON.stringify(infoThree)}`,
                    `预期值：0`,
                    `实际值${infoThree.errCode}`);
                  console.log(msg, 'getBlankless infoThree success');
                  let param: webview.BlanklessLoadingParam = {
                    enable: true,
                    duration: 500,
                    expirationTime: 0,
                    callback: (info: webview.BlanklessFrameInterpolationInfo) => {
                      // 数据监控
                      console.log(msg +
                        ` callback key: ${info.key} , state: ${info.state} timestamp: ${info.timestamp} reason: ${info.reason}`);
                      console.log(msg + `callback 插帧成功`);
                    }
                  }
                  let result = this.controller.setBlanklessLoadingWithParams(key1, param);
                  console.log(msg + ` 实际值 result: ${result} 预期值 0`);
                  console.log(msg +
                    ` webview.WebBlanklessErrorCode.SUCCESS:  ${webview.WebBlanklessErrorCode.SUCCESS} `);
                  if (result == webview.WebBlanklessErrorCode.SUCCESS) {
                    Utils.emitEvent(result, 148640);
                  }
                } catch (error) {
                  console.log(msg, 'ErrorCode: ' + error.code, ' Message: ' + error.message);
                  if (Number(error.code) == 801) {
                    Utils.emitEvent(0, 148640)
                    console.log(msg, ' 801 Capability not supported');
                  } else {
                    Utils.emitEvent(401, 148640)
                  }
                }
                break;
              }
              case 'testSetBlanklessLoadingWithParams015': {
                let msg = 'testSetBlanklessLoadingWithParams015'
                let key0 = '';
                try {
                  let param: webview.BlanklessLoadingParam = {
                    enable: true,
                    duration: 500,
                    expirationTime: 0,
                    callback: (info: webview.BlanklessFrameInterpolationInfo) => {
                      // 数据监控
                      console.log(msg +
                        ` callback key: ${info.key} , state: ${info.state} timestamp: ${info.timestamp} reason: ${info.reason}`);
                      console.log(msg + `callback 插帧成功`);
                    }
                  }
                  let result = this.controller.setBlanklessLoadingWithParams(key0, param);
                  console.log(msg + ` 实际值 result: ${result} 预期值 -2`);
                  if (result == webview.WebBlanklessErrorCode.ERR_INVALID_PARAM) {
                    Utils.emitEvent(result, 148650);
                  }
                } catch (error) {
                  console.log(msg, 'ErrorCode: ' + error.code, ' Message: ' + error.message);
                  if (Number(error.code) == 801) {
                    Utils.emitEvent(-2, 148650)
                    console.log(msg, ' 801 Capability not supported');
                  } else {
                    Utils.emitEvent(401, 148650)
                  }
                }
                break;
              }
              case 'testSetBlanklessLoadingWithParams016': {
                let msg = 'testSetBlanklessLoadingWithParams016'
                let key = 'setBlanklessLoadingWithParams016';
                try {
                  this.isPageEnd = -1
                  this.controller.loadUrl($rawfile('indexPhoto.html'))
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  console.log(msg, 'first loadUrl finish');
                  webView.WebviewController.clearBlanklessLoadingCache([key]);
                  let infoOne = this.controller.getBlanklessInfoWithKey(key);
                  console.log(msg, `getBlanklessInfoWithKey 入参:${key}`, `返回值:${JSON.stringify(infoOne)}`,
                    `预期值：0`,
                    `实际值${infoOne.errCode}`);
                  console.log(msg, 'getBlankless infoOne success');
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  console.log(msg, 'second loadUrl finish');
                  let infoTwo = this.controller.getBlanklessInfoWithKey(key);
                  console.log(msg, ` 2 getBlanklessInfoWithKey 入参:${key}`, `返回值:${JSON.stringify(infoTwo)}`,
                    `预期值：0`,
                    `实际值${infoTwo.errCode}`);
                  console.log(msg, 'getBlankless infoTwo success');
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  console.log(msg, 'third loadUrl finish');
                  let infoThree = this.controller.getBlanklessInfoWithKey(key);
                  console.log(msg, ` 3 getBlanklessInfoWithKey 入参:${key}`, `返回值:${JSON.stringify(infoThree)}`,
                    `预期值：0`,
                    `实际值${infoThree.errCode}`);
                  console.log(msg, 'getBlankless infoThree success');
                  let param: webview.BlanklessLoadingParam = {
                    enable: false,
                    duration: 500,
                    expirationTime: 0,
                    callback: (info: webview.BlanklessFrameInterpolationInfo) => {
                      // 数据监控
                      console.log(msg +
                        ` callback key: ${info.key} , state: ${info.state} timestamp: ${info.timestamp} reason: ${info.reason}`)
                    }
                  }
                  let result = this.controller.setBlanklessLoadingWithParams(key, param);
                  console.log(msg + ` 实际值 result: ${result} 预期值 0`);
                  Utils.emitEvent(result, 148660);
                } catch (error) {
                  console.log(msg, 'ErrorCode: ' + error.code, ' Message: ' + error.message);
                  if (Number(error.code) == 801) {
                    Utils.emitEvent(0, 148660)
                    console.log(msg, ' 801 Capability not supported');
                  } else {
                    Utils.emitEvent(401, 148660)
                  }
                }
                break;
              }
              case 'testSetBlanklessLoadingWithParams017': {
                let msg = 'testSetBlanklessLoadingWithParams017'
                let key = 'setBlanklessLoadingWithParams017';
                try {
                  this.isPageEnd = -1
                  this.controller.loadUrl($rawfile('indexPhoto.html'))
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  console.log(msg, 'first loadUrl finish');
                  webView.WebviewController.clearBlanklessLoadingCache([key]);
                  let infoOne = this.controller.getBlanklessInfoWithKey(key);
                  console.log(msg, `getBlanklessInfoWithKey 入参:${key}`, `返回值:${JSON.stringify(infoOne)}`,
                    `预期值：0`,
                    `实际值${infoOne.errCode}`);
                  console.log(msg, 'getBlankless infoOne success');
                  let param: webview.BlanklessLoadingParam = {
                    enable: true,
                    duration: 199,
                    expirationTime: 0,
                    callback: (info: webview.BlanklessFrameInterpolationInfo) => {
                      // 数据监控
                      console.log(msg +
                        ` callback key: ${info.key} , state: ${info.state} timestamp: ${info.timestamp} reason: ${info.reason}`)
                    }
                  }
                  let result = this.controller.setBlanklessLoadingWithParams(key, param);
                  console.log(msg + ` 实际值 result: ${result} 预期值 -6`);
                  Utils.emitEvent(result, 148670);
                } catch (error) {
                  console.log(msg, 'ErrorCode: ' + error.code, ' Message: ' + error.message);
                  if (Number(error.code) == 801) {
                    Utils.emitEvent(-6, 148670)
                    console.log(msg, ' 801 Capability not supported');
                  } else {
                    Utils.emitEvent(401, 148660)
                  }
                }
                break;
              }
              case 'testSetBlanklessLoadingWithParams018': {
                let msg = 'testSetBlanklessLoadingWithParams018'
                let key = 'setBlanklessLoadingWithParams018';
                try {
                  this.isPageEnd = -1
                  this.controller.loadUrl($rawfile('indexPhoto.html'))
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  console.log(msg, 'first loadUrl finish');
                  webView.WebviewController.clearBlanklessLoadingCache([key]);
                  let infoOne = this.controller.getBlanklessInfoWithKey(key);
                  console.log(msg, `getBlanklessInfoWithKey 入参:${key}`, `返回值:${JSON.stringify(infoOne)}`,
                    `预期值：0`,
                    `实际值${infoOne.errCode}`);
                  console.log(msg, 'getBlankless infoOne success');
                  let param: webview.BlanklessLoadingParam = {
                    enable: true,
                    duration: 200,
                    expirationTime: 0,
                    callback: (info: webview.BlanklessFrameInterpolationInfo) => {
                      // 数据监控
                      console.log(msg +
                        ` callback key: ${info.key} , state: ${info.state} timestamp: ${info.timestamp} reason: ${info.reason}`)
                    }
                  }
                  let result = this.controller.setBlanklessLoadingWithParams(key, param);
                  console.log(msg + ` 实际值 result: ${result} 预期值 -5`);
                  Utils.emitEvent(result, 148680);
                } catch (error) {
                  console.log(msg, 'ErrorCode: ' + error.code, ' Message: ' + error.message);
                  if (Number(error.code) == 801) {
                    Utils.emitEvent(-5, 148680)
                    console.log(msg, ' 801 Capability not supported');
                  } else {
                    Utils.emitEvent(401, 148680)
                  }
                }
                break;
              }
              case 'testSetBlanklessLoadingWithParams019': {
                let msg = 'testSetBlanklessLoadingWithParams019'
                let key = 'setBlanklessLoadingWithParams019';
                try {
                  this.isPageEnd = -1
                  this.controller.loadUrl($rawfile('indexPhoto.html'))
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  console.log(msg, 'first loadUrl finish');
                  webView.WebviewController.clearBlanklessLoadingCache([key]);
                  let infoOne = this.controller.getBlanklessInfoWithKey(key);
                  console.log(msg, `getBlanklessInfoWithKey 入参:${key}`, `返回值:${JSON.stringify(infoOne)}`,
                    `预期值：0`,
                    `实际值${infoOne.errCode}`);
                  console.log(msg, 'getBlankless infoOne success');
                  let param: webview.BlanklessLoadingParam = {
                    enable: true,
                    duration: 2000,
                    expirationTime: 0,
                    callback: (info: webview.BlanklessFrameInterpolationInfo) => {
                      // 数据监控
                      console.log(msg +
                        ` callback key: ${info.key} , state: ${info.state} timestamp: ${info.timestamp} reason: ${info.reason}`)
                    }
                  }
                  let result = this.controller.setBlanklessLoadingWithParams(key, param);
                  console.log(msg + ` 实际值 result: ${result} 预期值 -5`);
                  Utils.emitEvent(result, 148690);
                } catch (error) {
                  console.log(msg, 'ErrorCode: ' + error.code, ' Message: ' + error.message);
                  if (Number(error.code) == 801) {
                    Utils.emitEvent(-5, 148690)
                    console.log(msg, ' 801 Capability not supported');
                  } else {
                    Utils.emitEvent(401, 148690)
                  }
                }
                break;
              }
              case 'testSetBlanklessLoadingWithParams020': {
                let msg = 'testSetBlanklessLoadingWithParams020'
                let key = 'setBlanklessLoadingWithParams020';
                try {
                  this.isPageEnd = -1
                  this.controller.loadUrl($rawfile('indexPhoto.html'))
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  console.log(msg, 'first loadUrl finish');
                  webView.WebviewController.clearBlanklessLoadingCache([key]);
                  let infoOne = this.controller.getBlanklessInfoWithKey(key);
                  console.log(msg, `getBlanklessInfoWithKey 入参:${key}`, `返回值:${JSON.stringify(infoOne)}`,
                    `预期值：0`,
                    `实际值${infoOne.errCode}`);
                  console.log(msg, 'getBlankless infoOne success');
                  let param: webview.BlanklessLoadingParam = {
                    enable: true,
                    duration: 2001,
                    expirationTime: 0,
                    callback: (info: webview.BlanklessFrameInterpolationInfo) => {
                      // 数据监控
                      console.log(msg +
                        ` callback key: ${info.key} , state: ${info.state} timestamp: ${info.timestamp} reason: ${info.reason}`)
                    }
                  }
                  let result = this.controller.setBlanklessLoadingWithParams(key, param);
                  console.log(msg + ` 实际值 result: ${result} 预期值 -6`);
                  Utils.emitEvent(result, 148700);
                } catch (error) {
                  console.log(msg, 'ErrorCode: ' + error.code, ' Message: ' + error.message);
                  if (Number(error.code) == 801) {
                    Utils.emitEvent(-6, 148700)
                    console.log(msg, ' 801 Capability not supported');
                  } else {
                    Utils.emitEvent(401, 148700)
                  }
                }
                break;
              }
              case 'testSetBlanklessLoadingWithParams021': {
                let msg = 'testSetBlanklessLoadingWithParams021'
                let key = 'setBlanklessLoadingWithParams021';
                try {
                  this.isPageEnd = -1
                  this.controller.loadUrl($rawfile('indexPhoto.html'))
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  console.log(msg, 'first loadUrl finish');
                  webView.WebviewController.clearBlanklessLoadingCache([key]);
                  let infoOne = this.controller.getBlanklessInfoWithKey(key);
                  console.log(msg, `getBlanklessInfoWithKey 入参:${key}`, `返回值:${JSON.stringify(infoOne)}`,
                    `预期值：0`,
                    `实际值${infoOne.errCode}`);
                  console.log(msg, 'getBlankless infoOne success');
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  console.log(msg, 'second loadUrl finish');
                  let infoTwo = this.controller.getBlanklessInfoWithKey(key);
                  console.log(msg, ` 2 getBlanklessInfoWithKey 入参:${key}`, `返回值:${JSON.stringify(infoTwo)}`,
                    `预期值：0`,
                    `实际值${infoTwo.errCode}`);
                  console.log(msg, 'getBlankless infoTwo success');
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  console.log(msg, 'third loadUrl finish');
                  let infoThree = this.controller.getBlanklessInfoWithKey(key);
                  console.log(msg, ` 3 getBlanklessInfoWithKey 入参:${key}`, `返回值:${JSON.stringify(infoThree)}`,
                    `预期值：0`,
                    `实际值${infoThree.errCode}`);
                  console.log(msg, 'getBlankless infoThree success');
                  let data = new Date();
                  let param: webview.BlanklessLoadingParam = {
                    enable: true,
                    duration: 500,
                    expirationTime: data.getTime() - 1,
                    callback: (info: webview.BlanklessFrameInterpolationInfo) => {
                      // 数据监控
                      console.log(msg +
                        ` callback key: ${info.key} , state: ${info.state} timestamp: ${info.timestamp} reason: ${info.reason}`)
                    }
                  }
                  let result = this.controller.setBlanklessLoadingWithParams(key, param);
                  console.log(msg + ` 实际值 result: ${result} 预期值 -7`);
                  Utils.emitEvent(result, 148710);
                } catch (error) {
                  console.log(msg, 'ErrorCode: ' + error.code, ' Message: ' + error.message);
                  if (Number(error.code) == 801) {
                    Utils.emitEvent(-7, 148710)
                    console.log(msg, ' 801 Capability not supported');
                  } else {
                    Utils.emitEvent(401, 148710)
                  }
                }
                break;
              }
              case 'testSetBlanklessLoadingWithParams022': {
                let msg = 'testSetBlanklessLoadingWithParams022'
                let key = 'setBlanklessLoadingWithParams022';
                try {
                  this.isPageEnd = -1
                  this.controller.loadUrl($rawfile('indexPhoto.html'))
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  console.log(msg, 'first loadUrl finish');
                  webView.WebviewController.clearBlanklessLoadingCache([key]);
                  let infoOne = this.controller.getBlanklessInfoWithKey(key);
                  console.log(msg, `getBlanklessInfoWithKey 入参:${key}`, `返回值:${JSON.stringify(infoOne)}`,
                    `预期值：0`,
                    `实际值${infoOne.errCode}`);
                  console.log(msg, 'getBlankless infoOne success');
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  console.log(msg, 'second loadUrl finish');
                  let infoTwo = this.controller.getBlanklessInfoWithKey(key);
                  console.log(msg, ` 2 getBlanklessInfoWithKey 入参:${key}`, `返回值:${JSON.stringify(infoTwo)}`,
                    `预期值：0`,
                    `实际值${infoTwo.errCode}`);
                  console.log(msg, 'getBlankless infoTwo success');
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  console.log(msg, 'third loadUrl finish');
                  let infoThree = this.controller.getBlanklessInfoWithKey(key);
                  console.log(msg, ` 3 getBlanklessInfoWithKey 入参:${key}`, `返回值:${JSON.stringify(infoThree)}`,
                    `预期值：0`,
                    `实际值${infoThree.errCode}`);
                  console.log(msg, 'getBlankless infoThree success');
                  let data = new Date();
                  let param: webview.BlanklessLoadingParam = {
                    enable: true,
                    duration: 500,
                    expirationTime: data.getTime(),
                    callback: (info: webview.BlanklessFrameInterpolationInfo) => {
                      // 数据监控
                      console.log(msg +
                        ` callback key: ${info.key} , state: ${info.state} timestamp: ${info.timestamp} reason: ${info.reason}`)
                    }
                  }
                  let result = this.controller.setBlanklessLoadingWithParams(key, param);
                  console.log(msg + ` 实际值 result: ${result} 预期值 0 或者 -7`);
                  if(result == 0 || result == -7){
                    Utils.emitEvent(true, 148720);
                  }
                } catch (error) {
                  console.log(msg, 'ErrorCode: ' + error.code, ' Message: ' + error.message);
                  if (Number(error.code) == 801) {
                    Utils.emitEvent(true, 148720)
                    console.log(msg, ' 801 Capability not supported');
                  } else {
                    Utils.emitEvent(false, 148720)
                  }
                }
                break;
              }
              case 'testSetBlanklessLoadingWithParams023': {
                let msg = 'testSetBlanklessLoadingWithParams023'
                let key = 'setBlanklessLoadingWithParams023';
                try {
                  this.isPageEnd = -1
                  this.controller.loadUrl($rawfile('indexPhoto.html'))
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  console.log(msg, 'first loadUrl finish');
                  webView.WebviewController.clearBlanklessLoadingCache([key]);
                  let infoOne = this.controller.getBlanklessInfoWithKey(key);
                  console.log(msg, `getBlanklessInfoWithKey 入参:${key}`, `返回值:${JSON.stringify(infoOne)}`,
                    `预期值：0`,
                    `实际值${infoOne.errCode}`);
                  console.log(msg, 'getBlankless infoOne success');
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  console.log(msg, 'second loadUrl finish');
                  let infoTwo = this.controller.getBlanklessInfoWithKey(key);
                  console.log(msg, ` 2 getBlanklessInfoWithKey 入参:${key}`, `返回值:${JSON.stringify(infoTwo)}`,
                    `预期值：0`,
                    `实际值${infoTwo.errCode}`);
                  console.log(msg, 'getBlankless infoTwo success');
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  console.log(msg, 'third loadUrl finish');
                  let infoThree = this.controller.getBlanklessInfoWithKey(key);
                  console.log(msg, ` 3 getBlanklessInfoWithKey 入参:${key}`, `返回值:${JSON.stringify(infoThree)}`,
                    `预期值：0`,
                    `实际值${infoThree.errCode}`);
                  console.log(msg, 'getBlankless infoThree success');
                  let data = new Date();
                  let param: webview.BlanklessLoadingParam = {
                    enable: true,
                    duration: 500,
                    expirationTime: data.getTime() + 2592000000,
                    callback: (info: webview.BlanklessFrameInterpolationInfo) => {
                      // 数据监控
                      console.log(msg +
                        ` callback key: ${info.key} , state: ${info.state} timestamp: ${info.timestamp} reason: ${info.reason}`)
                    }
                  }
                  let result = this.controller.setBlanklessLoadingWithParams(key, param);
                  console.log(msg + ` 实际值 result: ${result} 预期值 0`);
                  Utils.emitEvent(result, 148730);
                } catch (error) {
                  console.log(msg, 'ErrorCode: ' + error.code, ' Message: ' + error.message);
                  if (Number(error.code) == 801) {
                    Utils.emitEvent(0, 148730)
                    console.log(msg, ' 801 Capability not supported');
                  } else {
                    Utils.emitEvent(401, 148730)
                  }
                }
                break;
              }
              case 'testSetBlanklessLoadingWithParams024': {
                let msg = 'testSetBlanklessLoadingWithParams024'
                let key = 'setBlanklessLoadingWithParams024';
                try {
                  this.isPageEnd = -1
                  this.controller.loadUrl($rawfile('indexPhoto.html'))
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  console.log(msg, 'first loadUrl finish');
                  webView.WebviewController.clearBlanklessLoadingCache([key]);
                  let infoOne = this.controller.getBlanklessInfoWithKey(key);
                  console.log(msg, `getBlanklessInfoWithKey 入参:${key}`, `返回值:${JSON.stringify(infoOne)}`,
                    `预期值：0`,
                    `实际值${infoOne.errCode}`);
                  console.log(msg, 'getBlankless infoOne success');
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  console.log(msg, 'second loadUrl finish');
                  let infoTwo = this.controller.getBlanklessInfoWithKey(key);
                  console.log(msg, ` 2 getBlanklessInfoWithKey 入参:${key}`, `返回值:${JSON.stringify(infoTwo)}`,
                    `预期值：0`,
                    `实际值${infoTwo.errCode}`);
                  console.log(msg, 'getBlankless infoTwo success');
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  console.log(msg, 'third loadUrl finish');
                  let infoThree = this.controller.getBlanklessInfoWithKey(key);
                  console.log(msg, ` 3 getBlanklessInfoWithKey 入参:${key}`, `返回值:${JSON.stringify(infoThree)}`,
                    `预期值：0`,
                    `实际值${infoThree.errCode}`);
                  console.log(msg, 'getBlankless infoThree success');
                  let data = new Date();
                  let param: webview.BlanklessLoadingParam = {
                    enable: true,
                    duration: 500,
                    expirationTime: data.getTime() + 2592000001,
                    callback: (info: webview.BlanklessFrameInterpolationInfo) => {
                      // 数据监控
                      console.log(msg +
                        ` callback key: ${info.key} , state: ${info.state} timestamp: ${info.timestamp} reason: ${info.reason}`)
                    }
                  }
                  let result = this.controller.setBlanklessLoadingWithParams(key, param);
                  console.log(msg + ` 实际值 result: ${result} 预期值是 0 或者 -7`);
                  if(result == 0 || result == -7){
                    Utils.emitEvent(true, 148740);
                  }
                } catch (error) {
                  console.log(msg, 'ErrorCode: ' + error.code, ' Message: ' + error.message);
                  if (Number(error.code) == 801) {
                    Utils.emitEvent(true, 148740)
                    console.log(msg, ' 801 Capability not supported');
                  } else {
                    Utils.emitEvent(false, 148740)
                  }
                }
                break;
              }
              case 'testSetBlanklessLoadingWithParams025': {
                let msg = 'testSetBlanklessLoadingWithParams025'
                let key = 'testSetBlanklessLoadingWithParams025';
                try {
                  this.isPageEnd = -1
                  this.controller.loadUrl($rawfile('indexPhoto.html'))
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  console.log(msg, 'first loadUrl finish');
                  webView.WebviewController.clearBlanklessLoadingCache([key]);
                  let infoOne = this.controller.getBlanklessInfoWithKey(key);
                  console.log(msg, `getBlanklessInfoWithKey 入参:${key}`, `返回值:${JSON.stringify(infoOne)}`,
                    `预期值：0`,
                    `实际值${infoOne.errCode}`);
                  console.log(msg, 'getBlankless infoOne success');
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  console.log(msg, 'second loadUrl finish');
                  let infoTwo = this.controller.getBlanklessInfoWithKey(key);
                  console.log(msg, ` 2 getBlanklessInfoWithKey 入参:${key}`, `返回值:${JSON.stringify(infoTwo)}`,
                    `预期值：0`,
                    `实际值${infoTwo.errCode}`);
                  console.log(msg, 'getBlankless infoTwo success');
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  console.log(msg, 'third loadUrl finish');
                  let infoThree = this.controller.getBlanklessInfoWithKey(key);
                  console.log(msg, ` 3 getBlanklessInfoWithKey 入参:${key}`, `返回值:${JSON.stringify(infoThree)}`,
                    `预期值：0`,
                    `实际值${infoThree.errCode}`);
                  console.log(msg, 'getBlankless infoThree success');
                  let param: webview.BlanklessLoadingParam = {
                    enable: true,
                    duration: 500,
                    expirationTime: 0,
                    callback: (info: webview.BlanklessFrameInterpolationInfo) => {
                      // 数据监控
                      console.log(msg +
                        ` callback1  key: ${info.key} , state: ${info.state} timestamp: ${info.timestamp} reason: ${info.reason}`)
                    }
                  }
                  let param2: webview.BlanklessLoadingParam = {
                    enable: true,
                    duration: 500,
                    expirationTime: 0,
                    callback: (info: webview.BlanklessFrameInterpolationInfo) => {
                      // 数据监控
                      console.log(msg +
                        ` callback2 key: ${info.key} , state: ${info.state} timestamp: ${info.timestamp} reason: ${info.reason}`);
                    }
                  }
                  let result1 = this.controller.setBlanklessLoadingWithParams(key, param);
                  console.log(msg + ` 实际值 result1: ${result1} 预期值 0`);
                  let result2 = this.controller.setBlanklessLoadingWithParams(key, param2);
                  console.log(msg + ` 实际值 result2: ${result2} 预期值 -4`);
                  Utils.emitEvent(result2, 148750);
                } catch (error) {
                  console.log(msg, 'ErrorCode: ' + error.code, ' Message: ' + error.message);
                  if (Number(error.code) == 801) {
                    Utils.emitEvent(-4, 148750)
                    console.log(msg, ' 801 Capability not supported');
                  } else {
                    Utils.emitEvent(401, 148750)
                  }
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
