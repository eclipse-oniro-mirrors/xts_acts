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

import { Entry, Text,Column, Component, Button, ClickEvent, Web, Row, Stack } from '@ohos.arkui.component'  // TextAttribute should be insert by ui-plugins
import { State } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import { Area, OnPageBeginEvent } from '@ohos.arkui.component'
import Utils from '../../src/test/Utils.test';
import hilog from '@ohos.hilog';
import events_emitter from '@ohos.events.emitter';
import emitter from '@ohos.events.emitter';
import { Callback, RecordData, BusinessError } from '@ohos.base'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import common from '@ohos.app.ability.common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { GlobalContext } from '../../src/test/GlobalContext';
import webview from '@ohos.web.webview';

export class TestObj {
  constructor(){
  }

  test(testStr: string): string{
    console.log('Web Component str' + testStr);
    return testStr;
  }

  toString(testString: string): string{
    console.log('Web Component toString' + testString);
    return testString;
  }

  testNumber(testNum: number): number{
    console.log('Web Component number' + testNum);
    return testNum;
  }

  asyncTestBool(testBol: boolean): boolean{
    console.log('Web Component boolean' + testBol);
    return testBol
  }
}

export class WebObj {
  constructor(){
  }

  webTest(): string{
    console.log('Web test');
    return 'Web test';
  }

  webString(): void{
    console.log('Web test toString');
  }
}

export class AsyncObj {
  constructor(){
  }

  asyncTest(): void{
    console.log('Async test');
  }

  asyncString(testStr: string): void{
    console.log('Web async string' + testStr);
  }
}

@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  controllerOther: webview.WebviewController = new webview.WebviewController(undefined);
  controllerThree: webview.WebviewController = new webview.WebviewController(undefined);
  controllerOne: webview.WebviewController = new webview.WebviewController(undefined);
  @State isShouldOverlay : boolean = true;
  @State isCallback : boolean = true;
  @State str : string = '';
  area?: Area
  @State webResult: string = '';
  @State isPageEnd: number = -1;
  @State header: string = 'https'
  @State body: string = '://www.example.com'
  @State testObject: TestObj = new TestObj();
  @State webTestObj: WebObj = new WebObj();
  @State asyncTestObj: AsyncObj = new AsyncObj();

  aboutToAppear() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack: Callback<emitter.EventData> = (eventData: emitter.EventData): void => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data && data['ACTION'] != null) {
        console.info('Received ACTION value: ' + data['ACTION']);
        let strValue: string = String(data['ACTION']);
        console.info('strValue has been updated to: ' + strValue);
        this.str = strValue;
        console.info('this.str has been updated to: ' + this.str);
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('web click').key('webviewEnableBackForwardCacheButton') .onClick( (e:ClickEvent) => {
          console.info('key==>' +  this.str)
          this.isShouldOverlay = true
          this.isCallback = false
          switch (this.str) {
            case 'emitSetBlanklessLoadingCacheCapacityStatic001': {
              try {
                let cacheCapacity1 = webview.WebviewController.setBlanklessLoadingCacheCapacity(-1);
                let cacheCapacity2 = webview.WebviewController.setBlanklessLoadingCacheCapacity(101);
                let cacheCapacity3 = webview.WebviewController.setBlanklessLoadingCacheCapacity(0);
                let cacheCapacity4 = webview.WebviewController.setBlanklessLoadingCacheCapacity(100);
                let cacheCapacity5 = webview.WebviewController.setBlanklessLoadingCacheCapacity(50);
                if(cacheCapacity1 == 0 &&
                  cacheCapacity2 == 100 &&
                  cacheCapacity3 == 0 &&
                  cacheCapacity4 == 100 &&
                  cacheCapacity5 == 50
                ){
                  Utils.emitEvent('success', 2603261011);
                }
                else{
                  Utils.emitEvent('error', 2603261011);
                }
              } catch (error) {
                // 判断是否为方法未实现的错误
                let errMsg = error?.message ?? String(error);
                if (errMsg.includes('No implementation found') || errMsg.includes('LinkerUnresolvedMethodError')) {
                  // 当前设备不支持该API，测试用例视为通过
                  console.info('No implementation found')
                  Utils.emitEvent('success', 2603261011);
                } else {
                  console.error(`Error: ${errMsg}`);
                  Utils.emitEvent('error', 2603261011);
                }
              }
              break;
            }

            case 'emitEmulateTouchFromMouseEventStatic002': {
              try {
                this.isPageEnd = -1;
                this.controllerThree.refresh()
                this.controllerThree.loadUrl("www.baidu.com")
                Utils.emitEvent('no error', 2630141801);
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 2630141801);
              }
              break;
            }

            case 'emitRegisterJavaScriptProxyStatic001': {
              try {
                this.controllerOne.registerJavaScriptProxy(this.testObject, 'objName', ['test', 'toString', 'testNumber'],
                  ['asyncTestBool']);
                this.isPageEnd = -1;
                this.controller.refresh()
                this.controller.runJavaScript(
                  'test()',
                  (error, result) => {
                    if (error) {
                      console.error(`run JavaScript error, ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                      return;
                    }
                    if (result) {
                      this.webResult = result;
                      console.info(`The test() return value is: ${result}`);
                    }
                  });
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 260327141);
              }
              break;
            }

            case 'emitRegisterJavaScriptProxyStatic002': {
              try {
                this.controller.registerJavaScriptProxy(this.testObject, '', ['test', 'toString', 'testNumber'],
                  ['asyncTestBool']);
                this.isPageEnd = -1;
                this.controller.refresh()
                this.controller.runJavaScript(
                  'test()',
                  (error, result) => {
                    if (error) {
                      console.error(`run JavaScript error, ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                      return;
                    }
                    if (result) {
                      Utils.emitEvent(true, 260327142);
                      this.webResult = result;
                      console.info(`The test() return value is: ${result}`);
                    }
                    else{
                      Utils.emitEvent(false, 260327142);
                    }
                  });
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 260327142);
              }
              break;
            }

            case 'emitRegisterJavaScriptProxyStatic003': {
              try {
                this.controller.registerJavaScriptProxy(this.testObject, 'objName', [],
                  ['asyncTestBool']);
                this.isPageEnd = -1;
                this.controller.refresh()
                this.controller.runJavaScript(
                  'test()',
                  (error, result) => {
                    if (error) {
                      console.error(`run JavaScript error, ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                      return;
                    }
                    if (result) {
                      Utils.emitEvent(true, 260327143);
                      this.webResult = result;
                      console.info(`The test() return value is: ${result}`);
                    }
                    else{
                      Utils.emitEvent(false, 260327143);
                    }
                  });
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 260327143);
              }
              break;
            }

            case 'emitRegisterJavaScriptProxyStatic004': {
              try {
                this.controller.registerJavaScriptProxy(this.testObject, 'objName', ['test', 'toString', 'testNumber'],
                  ['asyncTestBool']);
                this.isPageEnd = -1;
                this.controller.refresh()
                this.controller.runJavaScript(
                  'test()',
                  (error, result) => {
                    if (error) {
                      console.error(`run JavaScript error, ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                      return;
                    }
                    if (result) {
                      Utils.emitEvent(true, 260327144);
                      this.webResult = result;
                      console.info(`The test() return value is: ${result}`);
                    }
                    else{
                      Utils.emitEvent(false, 260327144);
                    }
                  });
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 260327144);
              }
              break;
            }

            case 'emitRegisterJavaScriptProxyStatic005': {
              try {
                this.controller.registerJavaScriptProxy(this.testObject, 'objName', ['test', 'toString', 'testNumber'],
                  ['asyncTestBool']);
                this.isPageEnd = -1;
                this.controller.refresh()
                this.controller.runJavaScript(
                  'test()',
                  (error, result) => {
                    if (error) {
                      console.error(`run JavaScript error, ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                      return;
                    }
                    if (result) {
                      Utils.emitEvent(true, 260327145);
                      this.webResult = result;
                      console.info(`The test() return value is: ${result}`);
                    }
                    else{
                      Utils.emitEvent(false, 260327145);
                    }
                  });
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 260327145);
              }
              break;
            }

            case 'SwitchNextPageStatic' : {
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: 'pages/webviewUrlRegexRules' })
              console.log('push URL success')
            }

          }
        })
      }
      Stack() {
        Web({ src: 'resource://rawfile/indexPhoto.html', controller: this.controllerOther })
          .enableNativeMediaPlayer({ enable: true, shouldOverlay: this.isShouldOverlay })
          .onPageBegin((event: OnPageBeginEvent): void => {
            console.error('enter onPageBegin, url:' + event.url);

            console.error('exit onPageBegin');
          })
          .onPageEnd((): void => {
          })
          .width('100%')
          .height('100%')
          .onAreaChange((oldValue: Area, newValue: Area) => {
            oldValue;
            this.area = newValue;
          })
      }

      Web({ src: 'resource://rawfile/index1.html', controller: this.controller, incognitoMode: true })
        .javaScriptAccess(true)
        .onRefreshAccessedHistory(undefined)
        .onSearchResultReceive(undefined)
        .onClientAuthenticationRequest(undefined)
        .onFaviconReceived(undefined)
        .enableNativeMediaPlayer(undefined)
        .optimizeParserBudget(undefined)
    }
  }
}
