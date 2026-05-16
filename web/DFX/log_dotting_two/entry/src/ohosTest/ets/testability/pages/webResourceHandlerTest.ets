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
import business_error, { BusinessError } from '@ohos.base'
import { buffer } from '@kit.ArkTS';
import { WebNetErrorList } from '@ohos.web.netErrorList';
import { URL } from '../../test/Config';

const EVENT_ID_SET_EMIT_KEY = 114990;

@Entry
@Component
struct webResourceHandlerTest {
  controller: webview.WebviewController = new webview.WebviewController();
  schemeHandler: webview.WebSchemeHandler = new webview.WebSchemeHandler()
  httpBodyStream: webview.WebHttpBodyStream|null = null
  @State emitKey: string = '';
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = true;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  requests: webview.WebSchemeHandlerRequest[] = []
  @State isMainFrameUrl: boolean = false;
  @State isLoadUrlFrameUrl: boolean = false;
  @State isSubFrameUrl: boolean = false;
  @State isSkipFirstPageFlag: boolean = false;
  htmlData: string = '<html><body bgcolor=\"white\">Source:<pre>source</pre></body></html>';

  @State testDidReceiveResponse: number= -1;
  @State testDidReceiveResponseBody: number= -1;
  @State testDidFinish: number= -1;
  @State testDidFail: number= -1;
  @State isFirstPageEnd: number = -1;
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;
  @State isReadyToBackward: boolean = false;

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
      if (eventData != null) {
          console.info('valueChangeCallBack:' + JSON.stringify(eventData));
          if (eventData.data != null && eventData.data.ACTION != null) {
              this.emitKey = eventData.data.ACTION;
              this.isReceive = 1;
          }
      }
  }
  
  build() {
      Column() {
          Row() {
            Button('web click').key('webView').onClick(async () => {
              await Utils.waitForExist(()=>this.isFirstPageEnd, 'webViewIsPageEnd', 1, 1000);
              await Utils.waitForExist(()=>this.isReceive, 'webViewIsReceive', 1, 1000);
              console.info('key==>' + this.emitKey)
              this.isReceive = -1;
              switch (this.emitKey) {
                case 'emitWebView_didReceiveResponse_INVAILD': {
                  await Utils.waitForExist(()=>this.testDidReceiveResponse, 'didReceiveResponseCheck', 17100021, 500);
                  Utils.emitEvent(this.testDidReceiveResponse, 115000);
                  this.testDidReceiveResponse = -1;
                  break;
                }
                case 'emitWebView_didReceiveResponseBody_INVALID': {
                  await Utils.waitForExist(()=>this.testDidReceiveResponseBody, 'testDidReceiveResponseBodyCheck', 17100021, 500);
                  Utils.emitEvent(this.testDidReceiveResponseBody, 115010);
                  this.testDidReceiveResponseBody = -1;
                  break;
                }
                case 'emitWebView_didFinish_INVALID': {
                  await Utils.waitForExist(()=>this.testDidFinish, 'testDidFinishCheck', 17100021, 500);
                  Utils.emitEvent(this.testDidFinish, 115020);
                  this.testDidFinish = -1;
                  break;
                }
                case 'emitWebView_didFail_INVALID': {
                  await Utils.waitForExist(()=>this.testDidFail, 'testDidFailCheck', 17100021, 500);
                  Utils.emitEvent(this.testDidFail, 115030);
                  this.testDidFail = -1;
                  break;
                }
                case 'testWebNavigationType001': {
                  try {
                    this.controller.loadUrl($rawfile('index.html'));
                  } catch (error) {
                    let e: business_error.BusinessError = error as business_error.BusinessError;
                    console.error(`testWebNavigationType001 ErrorCode: ${e.code},  Message: ${e.message}`);
                  }
                  break;
                }
                case 'testWebNavigationType002': {
                  try {
                    this.isPageEnd = -1;
                    this.controller.loadUrl($rawfile('index.html'));
                    await Utils.waitForExist(()=>this.isPageEnd, 'webViewIsPageEnd', 1, 500);
                    this.controller.loadUrl($rawfile('index.html'));
                  } catch (error) {
                    let e: business_error.BusinessError = error as business_error.BusinessError;
                    console.error(`testWebNavigationType002 ErrorCode: ${e.code},  Message: ${e.message}`);
                  }
                  break;
                }
                case 'testWebNavigationType003': {
                  try {
                    this.controller.loadUrl($rawfile('iframe1.html'));
                  } catch (error) {
                    let e: business_error.BusinessError = error as business_error.BusinessError;
                    console.error(`testWebNavigationType003 ErrorCode: ${e.code},  Message: ${e.message}`);
                  }
                  break;
                }
              }
            })
          }
          Web({ src: URL, controller: this.controller })
            .javaScriptAccess(this.javaScriptAccess)
            .fileAccess(this.fileAccess)
            .imageAccess(this.imageAccess)
            .domStorageAccess(this.domStorageAccess)
            .onlineImageAccess(this.onlineImageAccess)
            .databaseAccess(this.databaseAccess)
            .onNavigationEntryCommitted((details) => {
              console.log('Navigation url : ' + details.url)
              console.log('Navigation type: ' + details.navigationType);
              // 去除首页加载的影响，只关注用例里的页面加载
              if (this.isFirstPageEnd === -1) {
                return;
              }
              switch (this.emitKey) {
                case 'testWebNavigationType001': {
                  Utils.emitEvent(details.navigationType === 1 ? true : false, 115040);
                  break;
                }
                case 'testWebNavigationType002': {
                  if (!this.isSkipFirstPageFlag) {
                    this.isSkipFirstPageFlag = true;
                    break;
                  }
                  Utils.emitEvent(details.navigationType === 2 ? true : false, 115050);
                  this.isSkipFirstPageFlag = false;
                  break;
                }
                case 'testWebNavigationType003': {
                  // 跳过iframe1的影响，仅关注iframe2
                  if (!this.isSkipFirstPageFlag) {
                    this.isSkipFirstPageFlag = true;
                    break;
                  }
                  Utils.emitEvent(details.navigationType === 4 ? true : false, 115060);
                  this.isSkipFirstPageFlag = false;
                  break;
                }
              }
            })
            .onControllerAttached(() => {
              try {
                this.schemeHandler.onRequestStart(
                  (request: webview.WebSchemeHandlerRequest, resourceHandler: webview.WebResourceHandler) => {
                    console.log('[schemeHandler] onRequestStart');
                    let response = new webview.WebSchemeHandlerResponse();
                    try {
                      response.setNetErrorCode(WebNetErrorList.NET_OK);
                      response.setStatus(200);
                      response.setStatusText('OK');
                      response.setMimeType('text/html');
                      response.setEncoding('utf-8');
                      response.setHeaderByName('header1', 'value1', false);
                    } catch (error) {
                      console.error(`[schemeHandler] ErrorCode: ${(error as BusinessError).code}`);
                    }

                    // 调用 didFinish/didFail 前需要优先调用 didReceiveResponse 将构造的响应头传递给被拦截的请求。
                    let buf = buffer.from(this.htmlData)
                    try {
                      if (buf.length == 0) {
                        console.log('[schemeHandler] length 0');
                        resourceHandler.didReceiveResponse(response);
                        // 如果认为buf.length为0是正常情况，则调用resourceHandler.didFinish，否则调用resourceHandler.didFail
                        resourceHandler.didFail(WebNetErrorList.ERR_FAILED);
                      } else {
                        console.log('[schemeHandler] length 1');
                        resourceHandler.didReceiveResponse(response);
                        resourceHandler.didReceiveResponseBody(buf.buffer);
                        resourceHandler.didFinish();
                      }
                    } catch (error) {
                      console.error(`[schemeHandler] ErrorCode: ${(error as BusinessError).code}`);
                    }
                    try {
                      resourceHandler.didReceiveResponse(response);
                    } catch (error) {
                      console.error(`[schemeHandler] ErrorCode didReceiveResponse: ${(error as BusinessError).code}`);
                      this.testDidReceiveResponse = (error as BusinessError).code;
                    }

                    try {
                      resourceHandler.didReceiveResponseBody(buf.buffer);
                    } catch (error) {
                      console.error(`[schemeHandler] ErrorCode didReceiveResponseBody: ${(error as BusinessError).code}`);
                      this.testDidReceiveResponseBody = (error as BusinessError).code;
                    }

                    try {
                      resourceHandler.didFinish();
                    } catch (error) {
                      console.error(`[schemeHandler] ErrorCode didFinish: ${(error as BusinessError).code}`);
                      this.testDidFinish = (error as BusinessError).code;
                    }

                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_FAILED);
                    } catch (error) {
                      console.error(`[schemeHandler] ErrorCode didFail: ${(error as BusinessError).code}`);
                      this.testDidFail = (error as BusinessError).code;
                    }

                    return false;
                })

                this.controller.setWebSchemeHandler('https', this.schemeHandler);
                this.controller.setWebSchemeHandler('http', this.schemeHandler);
                this.controller.setWebSchemeHandler('resource', this.schemeHandler);
                webview.WebviewController.setServiceWorkerWebSchemeHandler('https', this.schemeHandler)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
            })
            .onPageEnd((event) => {
              console.log('onPageEnd url:' + event.url);
              this.isFirstPageEnd = 1;
              this.isPageEnd = 1;
            })
      }
  }
}