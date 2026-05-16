/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import { Entry, Component, Column, Row, Button, ClickEvent, Web,  OnPageVisibleEvent, OnPermissionRequestEvent, OnLoadInterceptEvent } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import Utils from '../../src/test/Util.test';
import webview from '@ohos.web.webview';
import emitter from '@ohos.events.emitter';
import events_emitter from '@ohos.events.emitter';
import { BusinessError, Callback, RecordData } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext'
import { canIUse } from '@internal.full.global'
import webView from '@ohos.web.webview';
export class StringFields {
  public str: string = '';
}

@Entry
@Component
struct setBlanklessLoadingWithParamsTest {
  stringObj: StringFields  = new StringFields ();
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  newController: webView.WebviewController = new webView.WebviewController(undefined);
  message: webView.WebMessageExt = new webView.WebMessageExt();
  @State str: string = ''
  @State httpErrorReceive: Int = 0
  @State title: string = 'test';
  @State stateRst: string = "Xts test result"
  @State msg2: string = ""
  updateFlag: boolean = false
  @State urlKey: string = 'baseTestSetBlanklessLoadingWithKey'


  aboutToAppear() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data != null && data['ACTION'] != null) {
        let strValue: string = String(data['ACTION']);
        this.stringObj.str = strValue;
        console.info(this.stringObj.str)
      }
    }
  }

  build() {
    Row() {
      Column() {
        Button('setBlanklessLoadingWithParamsTestButton')
          .key('setBlanklessLoadingWithParamsTestButton')
          .onClick((e: ClickEvent) => {
            console.info('key==>' +  this.stringObj.str)
            switch (this.stringObj.str) {
              case 'testSetBlanklessLoadingWithParams001': {
                let msg = 'testSetBlanklessLoadingWithParams001'
                let key = 'setBlanklessLoadingWithParams001';
                try {
                  console.log(msg, 'first loadUrl finish');
                  webView.WebviewController.clearBlanklessLoadingCache([key]);
                  let infoOne = this.controller.getBlanklessInfoWithKey(key);
                  console.log(msg, `getBlanklessInfoWithKey 入参:${key}`, `返回值:${JSON.stringify(infoOne)}`,
                    `预期值：0`,
                    `实际值${infoOne.errCode}`);
                  console.log(msg, 'getBlankless infoOne success', `infoOne.similarity==${JSON.stringify(infoOne.similarity)}`);
                  this.controller.refresh();
                  setTimeout(() => {
                    console.log(msg, 'second loadUrl finish');
                    let infoTwo = this.controller.getBlanklessInfoWithKey(key);
                    console.log(msg, ` 2 getBlanklessInfoWithKey 入参:${key}`, `返回值:${JSON.stringify(infoTwo)}`,
                      `预期值：0`,
                      `实际值${infoTwo.errCode}`);
                    console.log(msg, 'getBlankless infoTwo success', `infoTwo.similarity==${JSON.stringify(infoTwo.similarity)}`);
                    this.controller.refresh();
                    setTimeout(() => {
                      console.log(msg, 'third loadUrl finish');
                      let infoThree = this.controller.getBlanklessInfoWithKey(key);
                      console.log(msg, ` 3 getBlanklessInfoWithKey 入参:${key}`, `返回值:${JSON.stringify(infoThree)}`,
                        `预期值：0`,
                        `实际值${infoThree.errCode}`);
                      console.log(msg, 'getBlankless infoThree success', `infoThree.similarity==${JSON.stringify(infoThree.similarity)}`,
                        `infoThree.loadingTime==${JSON.stringify(infoThree.loadingTime)}`);
                      let param: webView.BlanklessLoadingParam = {
                        enable: true,
                        duration: 500,
                        expirationTime: 0,
                        callback: (info: webView.BlanklessFrameInterpolationInfo) => {
                          // 数据监控
                          console.log(msg +
                            ` callback key: ${info.key} , state: ${info.state} timestamp: ${info.timestamp} reason: ${info.reason}`)
                          // 插帧成功
                          if (info.state == webView.BlanklessFrameInterpolationState.FRAME_INTERPOLATION_SUCCEEDED) {
                            console.log(msg + `callback 插帧成功`);
                          }
                        }
                      }
                      let result = this.controller.setBlanklessLoadingWithParams(key, param);

                      if (result == webview.WebBlanklessErrorCode.SUCCESS) {
                        Utils.emitEvent(result, 148510);
                      }
                    }, 3000);
                  }, 3000);
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
                let key2049 =
                  'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
                    'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
                    'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
                    'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
                    'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
                    'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
                    'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
                    'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
                    'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
                    'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
                    'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
                    'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
                    'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
                    'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
                    'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
                    'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
                    'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
                    'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
                    'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
                    'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
                    'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
                    'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
                    'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
                    'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
                    'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
                    'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
                try {
                  this.controller.loadUrl('resource://rawfile/indexPhoto.html')
                  setTimeout(() => {
                    console.log(msg, 'first loadUrl finish');
                    try {
                      webView.WebviewController.clearBlanklessLoadingCache([key2049]);
                    } catch (error) {
                      console.log(msg, 'ErrorCode: ' + error.code, ' Message: ' + error.message);
                      if (Number(error.code) == 801) {
                        Utils.emitEvent(-2, 148520)
                        console.log(msg, ' 801 Capability not supported');
                      } else {
                        Utils.emitEvent(401, 148520)
                      }
                    }
                    try {
                      let infoOne = this.controller.getBlanklessInfoWithKey(key2049);
                      console.log(msg, `入参:${key2049}`, `返回值:${JSON.stringify(infoOne)}`, `预期值：0`,
                        `实际值${infoOne.errCode}`);
                    } catch (error) {
                      console.log(msg, 'ErrorCode: ' + error.code, ' Message: ' + error.message);
                      if (Number(error.code) == 801) {
                        Utils.emitEvent(-2, 148520)
                        console.log(msg, ' 801 Capability not supported');
                      } else {
                        Utils.emitEvent(401, 148520)
                      }
                    }

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
                    try {
                      let result = this.controller.setBlanklessLoadingWithParams(key2049, param);
                      console.log(msg + ` 实际值 result: ${result} 预期值 -2`);
                      if (result == webview.WebBlanklessErrorCode.ERR_INVALID_PARAM) {
                        Utils.emitEvent(result, 148520);
                      }
                    } catch (error) {
                      console.log(msg, 'ErrorCode: ' + error.code, ' Message: ' + error.message);
                      if (Number(error.code) == 801) {
                        Utils.emitEvent(-2, 148520)
                        console.log(msg, ' 801 Capability not supported');
                      } else {
                        Utils.emitEvent(401, 148520)
                      }
                    }

                  }, 2000);
                } catch (error) {
                  console.log(msg, 'ErrorCode: ' + error.code, ' Message: ' + error.message);
                  if (Number(error.code) == 801) {
                    Utils.emitEvent(-2, 148520)
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
                  this.controller.loadUrl('resource://rawfile/indexPhoto.html')
                  setTimeout(() => {
                    console.log(msg, 'first loadUrl finish');
                    try {
                      webView.WebviewController.clearBlanklessLoadingCache([key]);
                    } catch (error) {
                      console.log(msg, 'ErrorCode: ' + error.code, ' Message: ' + error.message);
                      if (Number(error.code) == 801) {
                        Utils.emitEvent(-3, 148530)
                        console.log(msg, ' 801 Capability not supported');
                      } else {
                        Utils.emitEvent(401, 148530)
                      }
                    }
                    try {
                      let infoOne = this.controller.getBlanklessInfoWithKey(key);
                      console.log(msg, `入参:${key}`, `返回值:${JSON.stringify(infoOne)}`, `预期值：0`,
                        `实际值${infoOne.errCode}`);
                    } catch (error) {
                      console.log(msg, 'ErrorCode: ' + error.code, ' Message: ' + error.message);
                      if (Number(error.code) == 801) {
                        Utils.emitEvent(-3, 148530)
                        console.log(msg, ' 801 Capability not supported');
                      } else {
                        Utils.emitEvent(401, 148530)
                      }
                    }
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
                    try {
                      let result = this.newController.setBlanklessLoadingWithParams(key, param);
                      console.log(msg + ` 实际值 result: ${result} 预期值 -3`);
                      if (result == webview.WebBlanklessErrorCode.ERR_CONTROLLER_NOT_INITED) {
                        Utils.emitEvent(result, 148530);
                      }
                    } catch (error) {
                      console.log(msg, 'ErrorCode: ' + error.code, ' Message: ' + error.message);
                      if (Number(error.code) == 801) {
                        Utils.emitEvent(-3, 148530)
                        console.log(msg, ' 801 Capability not supported');
                      } else {
                        Utils.emitEvent(401, 148530)
                      }
                    }
                  }, 2000);
                } catch (error) {
                  console.log(msg, 'ErrorCode: ' + error.code, ' Message: ' + error.message);
                  if (Number(error.code) == 801) {
                    Utils.emitEvent(-3, 148530)
                    console.log(msg, ' 801 Capability not supported');
                  } else {
                    Utils.emitEvent(401, 148530)
                  }
                }
                break;
              }
              case 'testSetBlanklessLoadingWithParams004': {
                let msg = 'testSetBlanklessLoadingWithParams004'
                let key = 'setBlanklessLoadingWithParams004';
                try {
                  this.controller.loadUrl('resource://rawfile/indexPhoto.html')
                  setTimeout(() => {
                    console.log(msg, 'first loadUrl finish');
                    try {
                      webView.WebviewController.clearBlanklessLoadingCache([key]);
                    } catch (error) {
                      console.log(msg, 'ErrorCode: ' + error.code, ' Message: ' + error.message);
                      if (Number(error.code) == 801) {
                        Utils.emitEvent(-4, 148540)
                        console.log(msg, ' 801 Capability not supported');
                      } else {
                        Utils.emitEvent(401, 148540)
                      }
                    }
                    try {
                      let infoOne = this.controller.getBlanklessInfoWithKey(key);
                      console.log(msg, `入参:${key}`, `返回值:${JSON.stringify(infoOne)}`, `预期值：0`,
                        `实际值${infoOne.errCode}`);
                    } catch (error) {
                      console.log(msg, 'ErrorCode: ' + error.code, ' Message: ' + error.message);
                      if (Number(error.code) == 801) {
                        Utils.emitEvent(-4, 148540)
                        console.log(msg, ' 801 Capability not supported');
                      } else {
                        Utils.emitEvent(401, 148540)
                      }
                    }
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
                    try {
                      let result = this.controller.setBlanklessLoadingWithParams(this.urlKey, param);
                      console.log(msg + ` 实际值 result: ${result} 预期值 -4`);
                      Utils.emitEvent(-4, 148540);
                    } catch (error) {
                      console.log(msg, 'ErrorCode: ' + error.code, ' Message: ' + error.message);
                      if (Number(error.code) == 801) {
                        Utils.emitEvent(-4, 148540)
                        console.log(msg, ' 801 Capability not supported');
                      } else {
                        Utils.emitEvent(401, 148540)
                      }
                    }
                  }, 2000);
                } catch (error) {
                  console.log(msg, 'ErrorCode: ' + error.code, ' Message: ' + error.message);
                  if (Number(error.code) == 801) {
                    Utils.emitEvent(-4, 148540)
                    console.log(msg, ' 801 Capability not supported');
                  } else {
                    Utils.emitEvent(401, 148540)
                  }
                }
                break;
              }
              case 'testSetBlanklessLoadingWithParams005': {
                let msg = 'testSetBlanklessLoadingWithParams005'
                let key = 'setBlanklessLoadingWithParams005';
                try {
                  this.controller.loadUrl('resource://rawfile/indexPhoto.html')
                  setTimeout(() => {
                    console.log(msg, 'first loadUrl finish');
                    try {
                      webView.WebviewController.clearBlanklessLoadingCache([key]);
                    } catch (error) {
                      console.log(msg, 'ErrorCode: ' + error.code, ' Message: ' + error.message);
                      if (Number(error.code) == 801) {
                        Utils.emitEvent(-5, 148550)
                        console.log(msg, ' 801 Capability not supported');
                      } else {
                        Utils.emitEvent(401, 148550)
                      }
                    }
                    try {
                      let infoOne = this.controller.getBlanklessInfoWithKey(key);
                      console.log(msg, `getBlanklessInfoWithKey 入参:${key}`, `返回值:${JSON.stringify(infoOne)}`,
                        `预期值：0`,
                        `实际值${infoOne.errCode}`);
                    } catch (error) {
                      console.log(msg, 'ErrorCode: ' + error.code, ' Message: ' + error.message);
                      if (Number(error.code) == 801) {
                        Utils.emitEvent(-5, 148550)
                        console.log(msg, ' 801 Capability not supported');
                      } else {
                        Utils.emitEvent(401, 148550)
                      }
                    }
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
                    try {
                      let result = this.controller.setBlanklessLoadingWithParams(key, param);
                      console.log(msg + `setBlanklessLoadingWithParams 实际值 result: ${result} 预期值 -5`);
                      if (result == webview.WebBlanklessErrorCode.ERR_SIGNIFICANT_CHANGE) {
                        Utils.emitEvent(result, 148550);
                      }
                    } catch (error) {
                      console.log(msg, 'ErrorCode: ' + error.code, ' Message: ' + error.message);
                      if (Number(error.code) == 801) {
                        Utils.emitEvent(-5, 148550)
                        console.log(msg, ' 801 Capability not supported');
                      } else {
                        Utils.emitEvent(401, 148550)
                      }
                    }
                  }, 2000);
                } catch (error) {
                  console.log(msg, 'ErrorCode: ' + error.code, ' Message: ' + error.message);
                  if (Number(error.code) == 801) {
                    Utils.emitEvent(-5, 148550)
                    console.log(msg, ' 801 Capability not supported');
                  } else {
                    Utils.emitEvent(401, 148550)
                  }
                }
                break;
              }

              case 'emitonSwitchNextPage': {
                let uiContext: UIContext = this.getUIContext();
                let router: Router = uiContext.getRouter();
                router.pushUrl({ url: 'pages/SetBlanklessLoadingWithKeyTest' })
              }
            }
          })

        Web({ src: 'resource://rawfile/indexPhoto.html', controller: this.controller })
          .javaScriptAccess(true)
          .geolocationAccess(true)
          .databaseAccess(true)
          .onLoadIntercept((event:OnLoadInterceptEvent) => {
            try {
              let info = this.controller.getBlanklessInfoWithKey("https://www.baidu.com");
              if (info.errCode == webview.WebBlanklessErrorCode.SUCCESS) {
                console.log(`info.similarity==${JSON.stringify(info.similarity)}`)
                console.log(`info.loadingTime==${JSON.stringify(info.loadingTime)}`)
                let data = new Date(2026, 5, 10, 0, 0, 0, 0);
                let param: webview.BlanklessLoadingParam = {
                  enable: info.similarity > 0.4 && info.loadingTime < 2000,
                  duration: info.loadingTime,
                  expirationTime: data.getTime().toInt(),
                  callback: (info: webview.BlanklessFrameInterpolationInfo)=>{
                  },
                };
                let result = this.controller.setBlanklessLoadingWithParams("https://www.baidu.com", param);
                console.log(this.msg2 + ` 实际值 result: ${result} 预期值 0`);
              } else {
                console.info('getBlankless info err');
              }
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},
                Message: ${(error as BusinessError).message}`);
            }
            return false;
          })

      }
    }
  }
}
