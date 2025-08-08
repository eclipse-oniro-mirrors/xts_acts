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

import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import Utils from '../../test/Utils';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import fs from '@ohos.file.fs';
import business_error from '@ohos.base';
import {waitForAssert, waitForExist} from '../../test/WaitTest';

class testObj {
  constructor() {
  }

  test(): string {
    return 'ArkUI Web Component';
  }

  toString(): void {
    console.log('Web Component toString');
  }
  asyncTest(): void {
    console.log('Web Component asyncTest');
  }
}

@Entry
@Component
struct Index {
  controller: webView.WebviewController = new webView.WebviewController();
  controllerNull: webView.WebviewController = new webView.WebviewController();
  responseWeb: WebResourceResponse = new WebResourceResponse()
  @State webResult: string = ' ';
  @State str: string = '';
  @State javaScriptAccess: boolean = true;
  @State searchNumber: number = 2;
  @State ports: webView.WebMessagePort[] = [];
  @State testObj: testObj = new testObj();
  @State errorCode: string = '0';
  @State isSslErrorHandlerComplete: number = 0;
  no_error: string = 'no error happened';

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
        Button('WebErrorCode click').key('ErrorCodeTestSuiteButton').onClick(async () => {
          console.info('key==>' + this.str);
          switch (this.str) {
            case 'testRegisterJavaScriptProxyFullParamsError001': {
              try {
                this.controllerNull.registerJavaScriptProxy(
                  this.testObj,
                  'objName',
                  ['test', 'toString'],
                  ['asyncTest'],
                  '{"javascriptProxyPermission": {"urlPermissionList": ' +
                    '[{"scheme": "e","host": "f", "port": "", "path": ""}],' +
                    '"methodList": [{"methodName": "test", "urlPermissionList": []}]}}'
                );
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                if (e.code == 801) {
                  Utils.emitEvent('17100001', 2025042206);
                } else {
                  let check = (v1: string, v2: string): boolean => {
                    return v1 == v2 ? true: false;
                  }
                  this.errorCode = String(e.code)
                  await waitForAssert(()=>this.errorCode, check, '17100001', 2025042206, this.str);
                }
              }
              break;
            }
            case 'testLoadUrlWithHeadersError001': {
              try {
                this.controllerNull.loadUrl('www.example.com', [{ headerKey: 'headerKey', headerValue: 'headerValue' }]);
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                if (e.code == 801) {
                  Utils.emitEvent('17100001', 2025042207);
                } else {
                  let check = (v1: string, v2: string): boolean => {
                    return v1 == v2 ? true: false;
                  }
                  this.errorCode = String(e.code)
                  await waitForAssert(()=>this.errorCode, check, '17100001', 2025042207, this.str);
                }
              }
              break;
            }
            case 'testLoadUrlWithHeadersError002': {
              try {
                this.controller.loadUrl('', [{ headerKey: 'headerKey', headerValue: 'headerValue' }]);
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                if (e.code == 801) {
                  Utils.emitEvent('17100002', 2025042208);
                } else {
                  let check = (v1: string, v2: string): boolean => {
                    return v1 == v2 ? true: false;
                  }
                  this.errorCode = String(e.code)
                  await waitForAssert(()=>this.errorCode, check, '17100002', 2025042208, this.str);
                }
              }
              break;
            }
            case 'testLoadUrlWithHeadersError003': {
              try {
                this.controller.loadUrl('file://', [{ headerKey: 'headerKey', headerValue: 'headerValue' }]);
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                if (e.code == 801) {
                  Utils.emitEvent('17100003', 2025042209);
                } else {
                  let check = (v1: string, v2: string): boolean => {
                    return v1 == v2 ? true: false;
                  }
                  this.errorCode = String(e.code)
                  await waitForAssert(()=>this.errorCode, check, '17100003', 2025042209, this.str);
                }
              }
              break;
            }
            case 'testSslErrorHandler001': {
              try {
                this.controller.loadUrl('https://expired.badssl.com');
                await waitForExist(()=>this.isSslErrorHandlerComplete, this.str, 1);
                let check = (v1:number, v2:number): boolean => {
                  return v1 == v2 ? true:false;
                }
                await waitForAssert(()=>this.isSslErrorHandlerComplete, check, 1, 2025042210, this.str);
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }

          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .zoomAccess(false)
        .onSslErrorEvent((event: SslErrorEvent) => {
          if (event) {
            console.log('onSslErrorEvent url: ' + event.url);
            console.log('onSslErrorEvent error: ' + event.error);
            console.log('onSslErrorEvent originalUrl: ' + event.originalUrl);
            console.log('onSslErrorEvent referrer: ' + event.referrer);
            console.log('onSslErrorEvent isFatalError: ' + event.isFatalError);
            console.log('onSslErrorEvent isMainFrame: ' + event.isMainFrame);
            console.log('onSslErrorEvent handler: ' + event.handler);
            if (event.handler) {
              this.isSslErrorHandlerComplete = 1;
            }
          }
        })
    }
  }
}
