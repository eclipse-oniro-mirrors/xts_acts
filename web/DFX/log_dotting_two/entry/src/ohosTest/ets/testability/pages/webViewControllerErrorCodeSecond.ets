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

const EVENT_ID_SET_EMIT_KEY = 115550;

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
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;


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
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 1;
      }
    }
  }


  build() {
    Column() {
      Row() {
        Button('click').key('WebViewControllerErrorCodeSecondButton').onClick(async () => {
          await Utils.waitForExist(()=>this.isPageEnd, 'WebViewControllerErrorCodeSecondButtonIsPageEnd', 1, 1000);
          await Utils.waitForExist(()=>this.isReceive, 'WebViewControllerErrorCodeSecondButtonIsReceive', 1, 1000);
          console.info('key==>' + this.str);
          this.isReceive = -1;
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
                Utils.emitEvent(e.code, 115560);
              }
              break;
            }

            case 'testIsIncognitoModeError001': {
              try {
                this.controllerNull.isIncognitoMode();
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`testIsIncognitoModeError001 ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 115570);
              }
              break;
            }

            case 'testGetLastJavascriptProxyCallingFrameUrlError001': {
              try {
                this.controllerNull.getLastJavascriptProxyCallingFrameUrl();
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`testGetLastJavascriptProxyCallingFrameUrlError001 ErrorCode: ${e.code}`);
                Utils.emitEvent(e.code, 115580);
              }
              break;
            }

            case 'testSetWebSchemeHandlerError001': {
              try {
                this.controllerNull.setWebSchemeHandler('http', this.schemeHandler);
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`testSetWebSchemeHandlerError001 ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 115590);
              }
              break;
            }

            case 'testClearWebSchemeHandlerError001': {
              try {
                this.controllerNull.clearWebSchemeHandler();
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`testClearWebSchemeHandlerError001 ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 115600);
              }
              break;
            }

            case 'testEnableIntelligentTrackingPreventionError001': {
              try {
                this.controllerNull.enableIntelligentTrackingPrevention(true);
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`testEnableIntelligentTrackingPreventionError001 ErrorCode: ${e.code}`);
                Utils.emitEvent((e.code == 801) ? '17100001' : e.code, 115610);
              }
              break;
            }

            case 'testIsIntelligentTrackingPreventionEnabled001': {
              try {
                this.controllerNull.isIntelligentTrackingPreventionEnabled();
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`testIsIntelligentTrackingPreventionEnabled001 ErrorCode: ${e.code}`);
                Utils.emitEvent((e.code == 801) ? '17100001' : e.code, 115620);
              }
              break;
            }

            case 'testRemoveIntelligentTrackingPreventionBypassingListError001': {
              try {
                webView.WebviewController.removeIntelligentTrackingPreventionBypassingList(null);
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`testRemoveIntelligentTrackingPreventionBypassingListError001 ErrorCode: ${e.code}`);
                Utils.emitEvent((e.code == 801) ? '401' : e.code, 115630);
              }
              break;
            }

            case 'testGetDefaultUserAgent001': {
              try {
                let userAgent = webView.WebviewController.getDefaultUserAgent();
                console.log('getDefaultUserAgent userAgent===>' + userAgent);
                Utils.emitEvent(userAgent.includes('Mozilla') ? true : false, 115640);
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`testGetDefaultUserAgentError001 ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 115640);
              }
              break;
            }

            case 'testEnableAdsBlockError001': {
              try {
                this.controllerNull.enableAdsBlock(true);
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`testEnableAdsBlockError001 ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent((e.code == 801) ? '17100001' : e.code, 115650);
              }
              break;
            }

            case 'testLoadUrlError001': {
              try {
                this.controller.loadUrl('');
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`testLoadUrlError001 ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 115660);
              }
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .zoomAccess(false)
        .databaseAccess(this.databaseAccess)
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url);
          this.isPageEnd = 1;
        })
    }
  }
}