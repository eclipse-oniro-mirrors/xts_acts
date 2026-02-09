/**
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
import events_emitter from '@ohos.events.emitter'
import webview from '@ohos.web.webview'
import Utils from '../../test/Utils'
import business_error from '@ohos.base'
import buffer from '@ohos.buffer'
import { WebNetErrorList } from '@ohos.web.netErrorList'
import { URL } from '../../test/Config.test';
import {waitForAssert, waitForExist} from '../../test/WaitTest.test';
@Entry
@Component
struct webViewSdkSchemeHandlerThree {
  controller: webview.WebviewController = new webview.WebviewController();
  schemeHandler: webview.WebSchemeHandler = new webview.WebSchemeHandler()
  @State emitKey: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  
  onPageShow() {
      let valueChangeEvent: events_emitter.InnerEvent = {
          eventId: 142401,
          priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(142401)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
      if (eventData != null) {
          console.info('valueChangeCallBack:' + JSON.stringify(eventData));
          if (eventData.data != null && eventData.data.ACTION != null) {
              this.emitKey = eventData.data.ACTION;
              this.isReceive = 0;
          }
      }
  }
  
  build() {
      Column() {
          Row() {
              Button('webThree click')
              .key('webViewSdkSchemeHandlerThreeButton')
              .onClick(async () => {
                  await waitForExist(()=>this.isReceive, this.emitKey, 0, 1000);
                  await waitForExist(()=>this.isPageEnd, this.emitKey, 0, 1000);
                  console.info('key==>' + this.emitKey);
                  this.isReceive = -1;
                  this.controller.clearWebSchemeHandler();
                  switch (this.emitKey) {
                    case 'emitSchemeHandlerDidFailCompleteIfNoResponse001': {
                      try {
                        let netErrorCode = 666;
                        this.schemeHandler.onRequestStart((
                          request: webview.WebSchemeHandlerRequest, resourceHandler: webview.WebResourceHandler) => {
                          let response = new webview.WebSchemeHandlerResponse();
                          response.setStatus(200);
                          response.setStatusText('OK');
                          response.setMimeType('text/html');
                          response.setEncoding('utf-8');
                          response.setHeaderByName('header1', 'value1', false);
                          response.setNetErrorCode(WebNetErrorList.ERR_IO_PENDING);
                          resourceHandler.didReceiveResponse(response);
                          console.log(this.emitKey + 'didFail start');
                          resourceHandler.didFail(WebNetErrorList.ERR_FAILED, true);
                          console.log(this.emitKey + 'didFail end');
                          netErrorCode = response.getNetErrorCode();
                          console.log(this.emitKey + ' getNetErrorCode==>' + netErrorCode);
                          return true
                        })
                        this.controller.setWebSchemeHandler('https', this.schemeHandler);
                        this.controller.loadUrl(URL);
                        let check = (v1: number, v2: number): boolean => {
                          return v1 === v2;
                        }
                        await waitForAssert(() => netErrorCode, check, -1, 142430, this.emitKey);
                      } catch (error) {
                        console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                      }
                      break;
                    }

                    case 'emitSchemeHandlerDidFailCompleteIfNoResponse002': {
                      try {
                        let netErrorCode = 666;
                        this.schemeHandler.onRequestStart((
                          request: webview.WebSchemeHandlerRequest, resourceHandler: webview.WebResourceHandler) => {
                          let response = new webview.WebSchemeHandlerResponse();
                          response.setStatus(200);
                          response.setStatusText('OK');
                          response.setMimeType('text/html');
                          response.setEncoding('utf-8');
                          response.setHeaderByName('header1', 'value1', false);
                          response.setNetErrorCode(WebNetErrorList.ERR_IO_PENDING);
                          resourceHandler.didReceiveResponse(response);
                          console.log(this.emitKey + 'didFail start');
                          resourceHandler.didFail(WebNetErrorList.ERR_FAILED, false);
                          console.log(this.emitKey + 'didFail end');
                          netErrorCode = response.getNetErrorCode();
                          console.log(this.emitKey + ' getNetErrorCode==>' + netErrorCode);
                          return true
                        })
                        this.controller.setWebSchemeHandler('https', this.schemeHandler);
                        this.controller.loadUrl(URL);
                        let check = (v1: number, v2: number): boolean => {
                          return v1 === v2;
                        }
                        await waitForAssert(() => netErrorCode, check, -1, 142440, this.emitKey);
                      } catch (error) {
                        console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                      }
                      break;
                    }
                    case 'emitSchemeHandlerDidFailCompleteIfNoResponse003': {
                      try {
                        let netErrorCode = 666;
                        this.schemeHandler.onRequestStart((
                          request: webview.WebSchemeHandlerRequest, resourceHandler: webview.WebResourceHandler) => {
                          console.log(this.emitKey + 'didFail start');
                          resourceHandler.didFail(WebNetErrorList.ERR_FAILED, true);
                          console.log(this.emitKey + 'didFail end');
                          let response = new webview.WebSchemeHandlerResponse();
                          netErrorCode = response.getNetErrorCode();
                          console.log(this.emitKey + ' getNetErrorCode==>' + netErrorCode);
                          return true
                        })
                        this.controller.setWebSchemeHandler('https', this.schemeHandler);
                        this.controller.loadUrl(URL);
                        let check = (v1: number, v2: number): boolean => {
                          return v1 === v2;
                        }
                        await waitForAssert(() => netErrorCode, check, 0, 142450, this.emitKey);
                      } catch (error) {
                        console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                      }
                      break;
                    }
                    case 'emitSchemeHandlerDidFailCompleteIfNoResponse004': {
                      try {
                        let netErrorCode = 666;
                        this.schemeHandler.onRequestStart((
                          request: webview.WebSchemeHandlerRequest, resourceHandler: webview.WebResourceHandler) => {
                          console.log(this.emitKey + 'didFail start');
                          resourceHandler.didFail(WebNetErrorList.ERR_FAILED, false);
                          console.log(this.emitKey + 'didFail end');
                          let response = new webview.WebSchemeHandlerResponse();
                          netErrorCode = response.getNetErrorCode();
                          console.log(this.emitKey + ' getNetErrorCode==>' + netErrorCode);
                          return true
                        })
                        this.controller.setWebSchemeHandler('https', this.schemeHandler);
                        this.controller.loadUrl(URL);
                        let check = (v1: number, v2: number): boolean => {
                          return v1 === v2;
                        }
                        await waitForAssert(() => netErrorCode, check, 0, 142460, this.emitKey);
                      } catch (error) {
                        console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                      }
                      break;
                    }
                    case 'emitSchemeHandlerDidFailCompleteIfNoResponse005': {
                      try {
                        let errorCode = '';
                        this.schemeHandler.onRequestStart((
                          request: webview.WebSchemeHandlerRequest, resourceHandler: webview.WebResourceHandler) => {
                          try {
                            console.log(this.emitKey + 'didFail start');
                            resourceHandler.didFinish();
                            console.log(this.emitKey + 'didFail end');
                            resourceHandler.didFail(WebNetErrorList.ERR_FAILED, true);
                          } catch (error) {
                            errorCode = String(error.code);
                            console.log(this.emitKey + 'error code' + error.code);
                          }
                          return true
                        })
                        this.controller.setWebSchemeHandler('https', this.schemeHandler);
                        this.controller.loadUrl(URL);
                        let check = (v1: string, v2: string): boolean => {
                          return v1 === v2;
                        }
                        await waitForAssert(() => errorCode, check, '17100021', 142470, this.emitKey);
                      } catch (error) {
                        console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                      }
                      break;
                    }
                    case 'emitSchemeHandlerDidFailCompleteIfNoResponse006': {
                      try {
                        let errorCode = '';
                        this.schemeHandler.onRequestStart((
                          request: webview.WebSchemeHandlerRequest, resourceHandler: webview.WebResourceHandler) => {
                          try {
                            console.log(this.emitKey + 'didFail start');
                            resourceHandler.didFinish();
                            console.log(this.emitKey + 'didFail end');
                            resourceHandler.didFail(WebNetErrorList.ERR_FAILED, false);
                          } catch (error) {
                            errorCode = String(error.code);
                            console.log(this.emitKey + 'error code' + error.code);
                          }
                          return true
                        })
                        this.controller.setWebSchemeHandler('https', this.schemeHandler);
                        this.controller.loadUrl(URL);
                        let check = (v1: string, v2: string): boolean => {
                          return v1 === v2;
                        }
                        await waitForAssert(() => errorCode, check, '17100021', 142480, this.emitKey);
                      } catch (error) {
                        console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                      }
                      break;
                    }
                    case 'emitSchemeHandlerDidFailCompleteIfNoResponse007': {
                      try {
                        this.schemeHandler.onRequestStart((
                          request: webview.WebSchemeHandlerRequest, resourceHandler: webview.WebResourceHandler) => {
                          try {
                            console.log(this.emitKey + 'didFail start');
                            resourceHandler.didFail(null, true);
                            console.log(this.emitKey + 'didFail end');
                          } catch (error) {
                            Utils.emitEvent(Number(error.code), 142490);
                            console.log(this.emitKey + 'error code' + error.code);
                          }
                          return true
                        })
                        this.controller.setWebSchemeHandler('https', this.schemeHandler);
                        this.controller.loadUrl(URL);
                      } catch (error) {
                        console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                      }
                      break;
                    }
                    case 'emitSchemeHandlerDidFailCompleteIfNoResponse008': {
                      try {
                        this.schemeHandler.onRequestStart((
                          request: webview.WebSchemeHandlerRequest, resourceHandler: webview.WebResourceHandler) => {
                          try {
                            console.log(this.emitKey + 'didFail start');
                            resourceHandler.didFail(null, false);
                            console.log(this.emitKey + 'didFail end');
                          } catch (error) {
                            Utils.emitEvent(Number(error.code), 142500);
                            console.log(this.emitKey + 'error code' + error.code);
                          }
                          return true
                        })
                        this.controller.setWebSchemeHandler('https', this.schemeHandler);
                        this.controller.loadUrl(URL);
                      } catch (error) {
                        console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                      }
                      break;
                    }
                    case 'emitSchemeHandlerDidReceiveResponseBodyNull': {
                      try {
                        this.schemeHandler.onRequestStart((
                          request: webview.WebSchemeHandlerRequest, resourceHandler: webview.WebResourceHandler) => {
                          try {
                            console.log(this.emitKey + 'didReceiveResponseBody start');
                            resourceHandler.didReceiveResponseBody(null);
                            console.log(this.emitKey + 'didReceiveResponseBody end');
                          } catch (error) {
                            Utils.emitEvent(Number(error.code), 26011601);
                            console.log(this.emitKey + 'error code' + error.code);
                          }
                          return true
                        })
                        this.controller.setWebSchemeHandler('https', this.schemeHandler);
                        this.controller.loadUrl(URL);
                      } catch (error) {
                        console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                      }
                      break;
                    }
                    case 'emitSchemeHandlerDidReceiveResponseBodyUndefined': {
                      try {
                        this.schemeHandler.onRequestStart((
                          request: webview.WebSchemeHandlerRequest, resourceHandler: webview.WebResourceHandler) => {
                          try {
                            console.log(this.emitKey + 'didReceiveResponseBody start');
                            resourceHandler.didReceiveResponseBody(undefined);
                            console.log(this.emitKey + 'didReceiveResponseBody end');
                          } catch (error) {
                            Utils.emitEvent(Number(error.code), 26011602);
                            console.log(this.emitKey + 'error code' + error.code);
                          }
                          return true
                        })
                        this.controller.setWebSchemeHandler('https', this.schemeHandler);
                        this.controller.loadUrl(URL);
                      } catch (error) {
                        console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                      }
                      break;
                    }
                  }
              })
          }
          Web({ src: $rawfile('index.html'), controller: this.controller })
            .key('webViewSdkSchemeHandlerThreeComponent')
            .onPageEnd((event) => {
              console.log('onPageEnd url==>' + event.url);
              this.isPageEnd = 0;
            })
      }
  }
}
