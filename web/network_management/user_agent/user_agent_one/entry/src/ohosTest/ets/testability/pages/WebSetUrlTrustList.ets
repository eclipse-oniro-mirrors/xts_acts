/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

import Utils from '../../test/Utils.test';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import { waitForExist } from '../../test/WaitTest.test';
import { URL_EXAMPLE } from '../../test/Config.test';


@Entry
@Component
struct webSetUrlTrustList {
  controller: webView.WebviewController = new webView.WebviewController();
  responseWeb: WebResourceResponse = new WebResourceResponse();
  @State emitKey: string = '';
  @State message: Array<string> = [];
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;
  @State isSearchEnd: number = -1;
  @State searchTotalNumber: number = -1;
  urlWildcardList: string = '{\"UrlPermissionList\":' +
    '[{\"scheme\":\"https\", \"host\":\"*.example.com\", \"path\":\"*\"}]}';

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 174270,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(174270)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
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
        Button('webSetUrlTrustList click')
          .key('WebSetUrlTrustListButton')
          .onClick(async () => {
            await waitForExist(()=>this.isReceive, this.emitKey, 0, 1000);
            await waitForExist(()=>this.isPageEnd, this.emitKey, 0, 1000);
            console.info('key==>' + this.emitKey);
            this.isReceive = -1;
            this.isSearchEnd = -1;
            this.searchTotalNumber = -1;
            switch (this.emitKey) {
              case 'emitSetUrlTrustList': {
                try {
                  let urlTrustList: string = '{\"UrlPermissionList\":[{\"scheme\":\"http\", \"host\":\"www.example.com\", \"path\":\"test\"}]}'
                  this.controller.setUrlTrustList(urlTrustList, true, true);
                  Utils.emitEvent(true, 174280);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, 174280);
                }
                break;
              }
              case 'emitSetUrlTrustListFirstParamNull': {
                try {
                  this.controller.setUrlTrustList(null, true, true);
                  Utils.emitEvent(false, 174290);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 174290);
                  } else {
                    Utils.emitEvent(String(error.code), 174290);
                  }
                }
                break;
              }
              case 'emitSetUrlTrustListFirstParamUndefined': {
                try {
                  this.controller.setUrlTrustList(undefined, true, true);
                  Utils.emitEvent(false, 174300);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 174300);
                  } else {
                    Utils.emitEvent(String(error.code), 174300);
                  }
                }
                break;
              }
              case 'emitSetUrlTrustListFirstParamEmpty': {
                try {
                  this.controller.setUrlTrustList('', true, true);
                  this.isPageEnd = -1;
                  this.controller.loadUrl(URL_EXAMPLE);
                  await waitForExist(()=>this.isPageEnd, this.emitKey, 0, 1000);
                  this.controller.searchAllAsync('Example');
                  await waitForExist(()=>this.isSearchEnd, this.emitKey, 0, 1000);
                  if (this.searchTotalNumber > 0) {
                    Utils.emitEvent(true, 26032504);
                  } else {
                    Utils.emitEvent(false, 26032504);
                  }
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(error.code, 26032504);
                }
                break;
              }
              case 'emitSetUrlTrustListSecondParamNull': {
                try {
                  let urlTrustList: string = '{\"UrlPermissionList\":[{\"scheme\":\"http\", \"host\":\"www.example.com\", \"path\":\"test\"}]}'
                  this.controller.setUrlTrustList(urlTrustList, null, true);
                  Utils.emitEvent(false, 174310);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 174310);
                  } else {
                    Utils.emitEvent(String(error.code), 174310);
                  }
                }
                break;
              }
              case 'emitSetUrlTrustListSecondParamUndefined': {
                try {
                  let urlTrustList: string = '{\"UrlPermissionList\":[{\"scheme\":\"http\", \"host\":\"www.example.com\", \"path\":\"test\"}]}'

                  this.controller.setUrlTrustList(urlTrustList, undefined, true);
                  Utils.emitEvent(false, 174320);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 174320);
                  } else {
                    Utils.emitEvent(String(error.code), 174320);
                  }
                }
                break;
              }
              case 'emitSetUrlTrustListSecondParamaterFalse': {
                try {
                  this.controller.setUrlTrustList(this.urlWildcardList, false, true);
                  this.isPageEnd = -1;
                  this.controller.loadUrl('javascript:(\'<h1>hello world</h1>\')');
                  await waitForExist(()=>this.isPageEnd, this.emitKey, 0, 1000);
                  this.controller.searchAllAsync('返回');
                  await waitForExist(()=>this.isSearchEnd, this.emitKey, 0, 1000);
                  if (this.searchTotalNumber > 0) {
                    Utils.emitEvent(true, 26032505);
                  } else {
                    Utils.emitEvent(false, 26032505);
                  }
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(error.code, 26032505);
                }
                break;
              }
              case 'emitSetUrlTrustListThirdParamNull': {
                try {
                  let urlTrustList: string = '{\"UrlPermissionList\":[{\"scheme\":\"http\", \"host\":\"www.example.com\", \"path\":\"test\"}]}'

                  this.controller.setUrlTrustList(urlTrustList, true, null);
                  Utils.emitEvent(false, 174330);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 174330);
                  } else {
                    Utils.emitEvent(String(error.code), 174330);
                  }
                }
                break;
              }
              case 'emitSetUrlTrustListThirdParamUndefined': {
                try {
                  let urlTrustList: string = '{\"UrlPermissionList\":[{\"scheme\":\"http\", \"host\":\"www.example.com\", \"path\":\"test\"}]}'

                  this.controller.setUrlTrustList(urlTrustList, true, undefined);
                  Utils.emitEvent(false, 174340);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 174340);
                  } else {
                    Utils.emitEvent(String(error.code), 174340);
                  }
                }
                break;
              }
              case 'emitSetUrlTrustListThirdParamFalse': {
                try {
                  this.controller.setUrlTrustList(this.urlWildcardList, true, false);
                  this.isPageEnd = -1;
                  this.controller.loadUrl(URL_EXAMPLE);
                  await waitForExist(()=>this.isPageEnd, this.emitKey, 0, 1000);
                  this.controller.searchAllAsync('返回');
                  await waitForExist(()=>this.isSearchEnd, this.emitKey, 0, 1000);
                  if (this.searchTotalNumber > 0) {
                    Utils.emitEvent(true, 26032506);
                  } else {
                    Utils.emitEvent(false, 26032506);
                  }
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(error.code, 26032506);
                }
                break;
              }
              case 'emitSetUrlTrustListInitError': {
                try {
                  let urlTrustList: string = '{\"UrlPermissionList\":[{\"scheme\":\"http\", \"host\":\"www.example.com\", \"path\":\"test\"}]}'

                  let tempController = new webView.WebviewController();
                  tempController.setUrlTrustList(urlTrustList, true, true);
                  Utils.emitEvent(false, 174350);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (Number(error.code) == 17100001) {
                    Utils.emitEvent('17100001', 174350);
                  } else {
                    Utils.emitEvent(String(error.code), 174350);
                  }
                }
                break;
              }
              case 'emitSetUrlTrustListWhitelistUrlLoad': {
                try {
                  let urlTrustList: string = '{\"UrlPermissionList\":[{\"scheme\":\"http\", \"host\":\"www.example.com\", \"path\":\"test\"}]}'
                  console.log('==emitSetUrlTrustListWhitelistUrlLoad')
                  this.controller.setUrlTrustList(urlTrustList, true, true);
                  this.controller.loadUrl($rawfile('urlTrustList.html'));
                  Utils.emitEvent(true, 174370);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, 174370);
                }
                break;
              }

              case 'emitSetUrlTrustListWildList': {
                try {
                  let urlWildcardList: string = '{\"UrlPermissionList\":[{\"scheme\":\"http\", \"host\":\"*.example.com\", \"path\":\"*\"}]}'
                  console.log('==emitSetUrlTrustListWildList')
                  this.controller.setUrlTrustList(urlWildcardList, true, true);
                  this.controller.loadUrl($rawfile('urlTrustList.html'));
                  Utils.emitEvent(true, 174380);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, 174380);
                }
                break;
              }

              case 'emitSetUrlTrustListEmpty': {
                try {
                  this.controller.setUrlTrustList('');
                  this.controller.loadUrl($rawfile('urlTrustList.html'));
                  Utils.emitEvent(true, 174390);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, 174390);
                }
                break;
              }
            }
          })
      }
      Web({ src: $rawfile('urlTrustList.html'), controller: this.controller })
        .key('setUrlTrustListWComponent')
        .javaScriptAccess(true)
        .domStorageAccess(true)
        .onPageEnd(() => {
          console.info('onPageEnd is invoked');
          this.isPageEnd = 0;
        })
        .onErrorReceive((event) => {
          console.info('onErrorReceive is invoked');
        })
        .onSearchResultReceive(ret => {
        if (ret) {
          console.log('onSearchResultReceive nul numberOfMatches==>' + ret.numberOfMatches);
          this.isSearchEnd = 0;
          this.searchTotalNumber = ret.numberOfMatches;
        }
      })
    }
  }
}
