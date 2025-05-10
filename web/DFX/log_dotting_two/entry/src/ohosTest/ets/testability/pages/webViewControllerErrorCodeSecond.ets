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

import Utils from '../../test/Utils';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import business_error from '@ohos.base';
import deviceInfo from '@ohos.deviceInfo';
import {waitForAssert, waitForExist} from '../../test/WaitTest';

@Entry
@Component
struct Index {
  controller: webView.WebviewController = new webView.WebviewController();
  controllerNull: webView.WebviewController = new webView.WebviewController();
  schemeHandler: webView.WebSchemeHandler = new webView.WebSchemeHandler();
  nativePort: webView.WebMessagePort | null = null;
  responseWeb: WebResourceResponse = new WebResourceResponse();
  @State str: string = '';
  @State javaScriptAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State message: string = '123';
  @State errorCode: string = '0';

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
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
      }
    }
  }


  build() {
    Column() {
      Row() {
        Button('click').key('WebViewControllerErrorCodeSecondButton').onClick(async () => {
          console.info('key==>' + this.str);
          this.errorCode = '0';
          switch (this.str) {

            case 'testLoadDataFullParamsError001': {
              try {
                this.controllerNull.loadData('<html><body bgcolor=\"white\">Source:<pre>source</pre></body></html>',
                  'text/html',
                  'UTF-8',
                  'www.example.com',
                  'www.baidu.com'
                );
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`testLoadDataFullParamsError001 ErrorCode: ${e.code},  Message: ${e.message}`);
                let check = (v1: string, v2: string): boolean => {
                  return v1 == v2 ? true: false;
                }
                this.errorCode = String(e.code)
                await waitForAssert(()=>this.errorCode, check, '17100001', 202503201, this.str);
              }
              break;
            }

            case 'testIsIncognitoModeError001': {
              try {
                this.controllerNull.isIncognitoMode();
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`testIsIncognitoModeError001 ErrorCode: ${e.code},  Message: ${e.message}`);
                let check = (v1: string, v2: string): boolean => {
                  return v1 == v2 ? true: false;
                }
                this.errorCode = String(e.code)
                await waitForAssert(()=>this.errorCode, check, '17100001', 202503202, this.str);
              }
              break;
            }

            case 'testGetLastJavascriptProxyCallingFrameUrlError001': {
              try {
                this.controllerNull.getLastJavascriptProxyCallingFrameUrl();
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`testGetLastJavascriptProxyCallingFrameUrlError001 ErrorCode: ${e.code}`);
                let check = (v1: string, v2: string): boolean => {
                  return v1 == v2 ? true: false;
                }
                this.errorCode = String(e.code)
                await waitForAssert(()=>this.errorCode, check, '17100001', 202503203, this.str);
              }
              break;
            }

            case 'testSetWebSchemeHandlerError001': {
              try {
                this.controllerNull.setWebSchemeHandler('http', this.schemeHandler);
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`testSetWebSchemeHandlerError001 ErrorCode: ${e.code},  Message: ${e.message}`);
                let check = (v1: string, v2: string): boolean => {
                  return v1 == v2 ? true: false;
                }
                this.errorCode = String(e.code)
                await waitForAssert(()=>this.errorCode, check, '17100001', 202503204, this.str);
              }
              break;
            }

            case 'testClearWebSchemeHandlerError001': {
              try {
                this.controllerNull.clearWebSchemeHandler();
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`testClearWebSchemeHandlerError001 ErrorCode: ${e.code},  Message: ${e.message}`);
                let check = (v1: string, v2: string): boolean => {
                  return v1 == v2 ? true: false;
                }
                this.errorCode = String(e.code)
                await waitForAssert(()=>this.errorCode, check, '17100001', 202503205, this.str);
              }
              break;
            }

            case 'testEnableIntelligentTrackingPreventionError001': {
              try {
                this.controllerNull.enableIntelligentTrackingPrevention(true);
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`testEnableIntelligentTrackingPreventionError001 ErrorCode: ${e.code}`);
                let check = (v1: string, v2: string): boolean => {
                  return v1 == v2 ? true: false;
                }
                this.errorCode = String(e.code)
                if(e.code == 801) {
                  console.log(`testEnableIntelligentTrackingPreventionError001 The current device type does not support Cause code:${e.code},  Message: ${e.message}`)
                  Utils.emitEvent('17100001', 202503206)
                } else {
                  await waitForAssert(()=>this.errorCode, check, '17100001', 202503206, this.str);
                }
              }
              break;
            }

            case 'testIsIntelligentTrackingPreventionEnabled001': {
              try {
                this.controllerNull.isIntelligentTrackingPreventionEnabled();
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`testIsIntelligentTrackingPreventionEnabled001 ErrorCode: ${e.code}`);
                let check = (v1: string, v2: string): boolean => {
                  return v1 == v2 ? true: false;
                }
                this.errorCode = String(e.code)
                if(e.code == 801) {
                  console.log(`testIsIntelligentTrackingPreventionEnabled001 The current device type does not support Cause code:${e.code},  Message: ${e.message}`)
                  Utils.emitEvent('17100001', 202503207)
                } else {
                  await waitForAssert(()=>this.errorCode, check, '17100001', 202503207, this.str);
                }
              }
              break;
            }

            case 'testRemoveIntelligentTrackingPreventionBypassingListError001': {
              try {
                webView.WebviewController.removeIntelligentTrackingPreventionBypassingList(null);
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`testRemoveIntelligentTrackingPreventionBypassingListError001 ErrorCode: ${e.code}`);
                let check = (v1: string, v2: string): boolean => {
                  return v1 == v2 ? true: false;
                }
                this.errorCode = String(e.code)
                if(e.code == 801) {
                  console.log(`testRemoveIntelligentTrackingPreventionBypassingListError001 The current device type does not support Cause code:${e.code},  Message: ${e.message}`)
                  Utils.emitEvent('401', 202503208)
                } else {
                  await waitForAssert(()=>this.errorCode, check, '401', 202503208, this.str);
                }
              }
              break;
            }

            case 'testGetDefaultUserAgent001': {
              try {
                let isGetDefaultUserAgent = false;
                let userAgent = webView.WebviewController.getDefaultUserAgent();
                console.log('getDefaultUserAgent userAgent===>' + userAgent)
                if (userAgent.includes('Mozilla')) {
                  isGetDefaultUserAgent = true
                }
                let check = (v1: boolean, v2: boolean): boolean => {
                  return v1 === v2 ? true: false;
                }
                await waitForAssert(()=>isGetDefaultUserAgent, check, true, 202503209, this.str);
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`testGetDefaultUserAgentError001 ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 202503209);
              }
              break;
            }

            case 'testEnableAdsBlockError001': {
              try {
                this.controllerNull.enableAdsBlock(true);
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`testEnableAdsBlockError001 ErrorCode: ${e.code},  Message: ${e.message}`);
                let check = (v1: string, v2: string): boolean => {
                  return v1 == v2 ? true: false;
                }
                this.errorCode = String(e.code)
                if(e.code == 801) {
                  console.log(`testEnableAdsBlockError001 The current device type does not support Cause code:${e.code},  Message: ${e.message}`)
                  Utils.emitEvent('17100001', 202503210)
                } else {
                  await waitForAssert(()=>this.errorCode, check, '17100001', 202503210, this.str);
                }
              }
              break;
            }

            case 'testLoadUrlError001': {
              try {
                this.controller.loadUrl('');
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`testLoadUrlError001 ErrorCode: ${e.code},  Message: ${e.message}`);
                let check = (v1: string, v2: string): boolean => {
                  return v1 == v2 ? true: false;
                }
                this.errorCode = String(e.code)
                await waitForAssert(()=>this.errorCode, check, '17100002', 202503211, this.str);
              }
              break;
            }


          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .onErrorReceive((event) => {
          if (event) {
            console.log('getErrorInfo:' + event.error.getErrorInfo())
            console.log('getErrorCode:' + event.error.getErrorCode())
            console.log('url:' + event.request.getRequestUrl())
            console.log('isMainFrame:' + event.request.isMainFrame())
            console.log('isRedirect:' + event.request.isRedirect())
            console.log('isRequestGesture:' + event.request.isRequestGesture())
            console.log('getRequestHeader_headerKey:' + event.request.getRequestHeader().toString())
            let result = event.request.getRequestHeader()
            console.log('The request header result size is ' + result.length)
            for (let i of result) {
              console.log('The request header key is : ' + i.headerKey + ', value is : ' + i.headerValue)
            }
          }
        })
        .zoomAccess(false)
        .databaseAccess(this.databaseAccess)
    }
  }
}
