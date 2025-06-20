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
  @State isReceive: number = -1;
  no_error: string = 'no error happened';

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 14,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(14)
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


  build() {
    Column() {
      Row() {
        Button('WebErrorCode click').key('WebviewRegisterJavaScriptProxyErrorCodeButton').onClick(async () => {
          console.info('key==>' + this.str);
          await waitForExist(()=>this.isReceive, this.str, 0);
          switch (this.str) {
            case 'emitWebviewRegisterJavaScriptProxyObjectNull': {
              try {
                this.controller.registerJavaScriptProxy(
                  null,
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
                  Utils.emitEvent('401', 2025051301);
                } else {
                  this.errorCode = String(e.code);
                  console.log('errorCode===>' + this.errorCode);
                  Utils.emitEvent(this.errorCode, 2025051301);
                }
              }
              break;
            }
            case 'emitWebviewRegisterJavaScriptProxyObjectUndefined': {
              try {
                this.controller.registerJavaScriptProxy(
                  undefined,
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
                  Utils.emitEvent('401', 2025051302);
                } else {
                  this.errorCode = String(e.code);
                  console.log('errorCode===>' + this.errorCode);
                  Utils.emitEvent(this.errorCode, 2025051302);
                }
              }
              break;
            }
            case 'emitWebviewRegisterJavaScriptProxyNameNull': {
              try {
                this.controller.registerJavaScriptProxy(
                  this.testObj,
                  null,
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
                  Utils.emitEvent('401', 2025051303);
                } else {
                  this.errorCode = String(e.code);
                  console.log('errorCode===>' + this.errorCode);
                  Utils.emitEvent(this.errorCode, 2025051303);
                }
              }
              break;
            }
            case 'emitWebviewRegisterJavaScriptProxyNameUndefined': {
              try {
                this.controller.registerJavaScriptProxy(
                  this.testObj,
                  undefined,
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
                  Utils.emitEvent('401', 2025051304);
                } else {
                  this.errorCode = String(e.code);
                  console.log('errorCode===>' + this.errorCode);
                  Utils.emitEvent(this.errorCode, 2025051304);
                }
              }
              break;
            }
            case 'emitWebviewRegisterJavaScriptProxyMethodListNull': {
              try {
                this.controller.registerJavaScriptProxy(
                  this.testObj,
                  'objName',
                  null,
                  ['asyncTest'],
                  '{"javascriptProxyPermission": {"urlPermissionList": ' +
                    '[{"scheme": "e","host": "f", "port": "", "path": ""}],' +
                    '"methodList": [{"methodName": "test", "urlPermissionList": []}]}}'
                );
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                if (e.code == 801) {
                  Utils.emitEvent('401', 2025051305);
                } else {
                  this.errorCode = String(e.code);
                  console.log('errorCode===>' + this.errorCode);
                  Utils.emitEvent(this.errorCode, 2025051305);
                }
              }
              break;
            }
            case 'emitWebviewRegisterJavaScriptProxyMethodListUndefined': {
              try {
                this.controller.registerJavaScriptProxy(
                  this.testObj,
                  'objName',
                  undefined,
                  ['asyncTest'],
                  '{"javascriptProxyPermission": {"urlPermissionList": ' +
                    '[{"scheme": "e","host": "f", "port": "", "path": ""}],' +
                    '"methodList": [{"methodName": "test", "urlPermissionList": []}]}}'
                );
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                if (e.code == 801) {
                  Utils.emitEvent('401', 2025051306);
                } else {
                  this.errorCode = String(e.code);
                  console.log('errorCode===>' + this.errorCode);
                  Utils.emitEvent(this.errorCode, 2025051306);
                }
              }
              break;
            }
            case 'emitWebviewRegisterJavaScriptProxyAsyncMethodListNull': {
              try {
                this.controller.registerJavaScriptProxy(
                  this.testObj,
                  'objName',
                  ['test', 'toString'],
                  null,
                  '{"javascriptProxyPermission": {"urlPermissionList": ' +
                    '[{"scheme": "e","host": "f", "port": "", "path": ""}],' +
                    '"methodList": [{"methodName": "test", "urlPermissionList": []}]}}'
                );
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                if (e.code == 801) {
                  Utils.emitEvent('401', 2025051307);
                } else {
                  this.errorCode = String(e.code);
                  console.log('errorCode===>' + this.errorCode);
                  Utils.emitEvent(this.errorCode, 2025051307);
                }
              }
              break;
            }
            case 'emitWebviewRegisterJavaScriptProxyAsyncMethodListUndefined': {
              try {
                this.controller.registerJavaScriptProxy(
                  this.testObj,
                  'objName',
                  ['test', 'toString'],
                  undefined,
                  '{"javascriptProxyPermission": {"urlPermissionList": ' +
                    '[{"scheme": "e","host": "f", "port": "", "path": ""}],' +
                    '"methodList": [{"methodName": "test", "urlPermissionList": []}]}}'
                );
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                if (e.code == 801) {
                  Utils.emitEvent('401', 2025051308);
                } else {
                  this.errorCode = String(e.code);
                  console.log('errorCode===>' + this.errorCode);
                  Utils.emitEvent(this.errorCode, 2025051308);
                }
              }
              break;
            }
            case 'emitWebviewRegisterJavaScriptProxyPermissionNull': {
              try {
                this.controller.registerJavaScriptProxy(
                  this.testObj,
                  'objName',
                  ['test', 'toString'],
                  ['asyncTest'],
                  null
                );
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                if (e.code == 801) {
                  Utils.emitEvent('401', 2025051309);
                } else {
                  this.errorCode = String(e.code);
                  console.log('errorCode===>' + this.errorCode);
                  Utils.emitEvent(this.errorCode, 2025051309);
                }
              }
              break;
            }
            case 'emitWebviewRegisterJavaScriptProxyPermissionUndefined': {
              try {
                this.controller.registerJavaScriptProxy(
                  this.testObj,
                  'objName',
                  ['test', 'toString'],
                  ['asyncTest'],
                  undefined
                );
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                if (e.code == 801) {
                  Utils.emitEvent('401', 2025051310);
                } else {
                  this.errorCode = String(e.code);
                  console.log('errorCode===>' + this.errorCode);
                  Utils.emitEvent(this.errorCode, 2025051310);
                }
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
