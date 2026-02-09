/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import { webview } from '@kit.ArkWeb';
import { BusinessError } from '@kit.BasicServicesKit';
import Utils from '../../test/Util';
import events_emitter from '@ohos.events.emitter';
import { JSON } from '@kit.ArkTS';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import testsuite from '../../test/List.test';
import { Hypium } from '@ohos/hypium';
import {waitForAssert, waitForExist} from '../../test/WaitTest';

class TestObj {
  constructor(){
  }

  test(testStr: string): string{
    console.log('Web Component str' + testStr);
    return testStr;
  }

  toString(): void{
    console.log('Web Component toString');
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

class WebObj {
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

class AsyncObj {
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
struct Index {
  controller: webview.WebviewController = new webview.WebviewController();
  controller1: webview.WebviewController = new webview.WebviewController();
  @State testObject: TestObj = new TestObj();
  @State webTestObj: WebObj = new WebObj();
  @State asyncTestObj: AsyncObj = new AsyncObj();
  @State webResult: string = '';
  @State name: string = ''
  @State str: string = ''
  @State emitKey: string = '';
  @State incognitoMode: boolean = true
  origin: string = 'file:///'
  @State src: string | Resource = $rawfile('index1.html')
  @State header: string = 'https'
  @State body: string = '://www.example.com'
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow(): void{
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 160130,
      priority: events_emitter.EventPriority.LOW
    };
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }

  onPageHide() {
    events_emitter.off(160130)
  }

  aboutToAppear(): void{
    let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
    abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    let abilityDelegatorArguments: abilityDelegatorRegistry.AbilityDelegatorArgs;
    abilityDelegatorArguments = abilityDelegatorRegistry.getArguments();
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData.data != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build(){
    Column() {
      Row() {
        Button('INCOGNITO').key('INCOGNITO').onClick(async (event: ClickEvent) => {
          await waitForExist(() => this.isPageEnd, this.str, 0);
          await waitForExist(() => this.isReceive, this.str, 0);
          this.isReceive = -1;
          switch (this.str) {
            case 'SUB_ACE_WEB_INCOGNITO_API_0006':
              try {
                webview.GeolocationPermissions.deleteAllGeolocation();
                Utils.emitEvent('true', 160140)
              } catch (error) {
                console.error(`ErrorCode: {(error as BusinessError).message}`);
              }
              break;
            case 'SUB_ACE_WEB_INCOGNITO_API_0007':
              try {
                webview.GeolocationPermissions.getAccessibleGeolocation(this.origin, (error, result) => {
                  if (error) {
                    console.error('getAccessibleGeolocationAsync  0007 error, ErrorCode: ' + error.code);
                    Utils.emitEvent(error.code + error.message, 160150)
                    return;
                  }
                  console.log('getAccessibleGeolocation 0007  result ' + result)
                })
              } catch (e) {
                console.error('getAccessibleGeolocation 0007 ErrorCode: ' + e.code);
              }
              break;
            case 'SUB_ACE_WEB_INCOGNITO_API_0008':
              this.incognitoMode = false
              this.isPageEnd = -1;
              this.controller.refresh()
              await waitForExist(() => this.isPageEnd, this.str, 0);
              try {
                  webview.GeolocationPermissions.getAccessibleGeolocation(this.origin, (error, result) => {
                    if (error) {
                      console.error('getAccessibleGeolocationAsync 0008, ErrorCode: ' + error.code);
                      Utils.emitEvent(error.code + error.message, 160160)
                      return;
                    }
                    console.log('getAccessibleGeolocation  0008 result ' + result)
                  })
              } catch (e) {
                console.error('getAccessibleGeolocation 0008 ErrorCode: ' + e.code);
              }
              break;
            case 'SUB_ACE_WEB_INCOGNITO_API_0009':
              this.incognitoMode = true
              this.isPageEnd = -1;
              this.controller.refresh()
              await waitForExist(() => this.isPageEnd, this.str, 0);
              try {
                  webview.GeolocationPermissions.getStoredGeolocation((error, result) => {
                    if (error) {
                      console.error('getStoredGeolocation 0009, ErrorCode: ' + (error as BusinessError).message);
                      return;
                    }
                    console.log('getStoredGeolocation  0009 result ' + result)
                    Utils.emitEvent(JSON.stringify(result), 160170)
                  })
              } catch (e) {
                console.error('getStoredGeolocation 0009 ErrorCode: ' + e.code);
              }
              break;
            case 'SUB_ACE_WEB_INCOGNITO_API_00010':
              this.incognitoMode = false
              this.isPageEnd = -1;
              this.controller.refresh()
              await waitForExist(() => this.isPageEnd, this.str, 0);
              try {
                  webview.GeolocationPermissions.getStoredGeolocation((error, result) => {
                    if (error) {
                      console.error('getStoredGeolocation 00010, ErrorCode: ' + (error as BusinessError).message);
                      return;
                    }
                    console.log('getStoredGeolocation  00010 result ' + result)
                    Utils.emitEvent(JSON.stringify(result), 160180)
                  })
              } catch (e) {
                console.error('getStoredGeolocation 00010 ErrorCode: ' + e.code);
              }
              break;
            case 'SUB_ACE_WEB_INCOGNITO_API_00011':
              this.incognitoMode = true
              this.src = this.header + this.body
              this.isPageEnd = -1;
              this.controller.refresh()
              await waitForExist(() => this.isPageEnd, this.str, 0);
                try {
                  let value = webview.WebCookieManager.fetchCookieSync(this.header + this.body);
                  console.log('fetchCookieSync cookie = ' + value);
                  Utils.emitEvent(value, 160190)
                } catch (error) {
                  console.error('fetchCookieSync  ErrorCode: ' + error.code);
                }
              break;
            case 'SUB_ACE_WEB_INCOGNITO_API_00012':
              this.incognitoMode = false
              this.src = this.header + this.body
              this.isPageEnd = -1;
              this.controller.refresh()
              await waitForExist(() => this.isPageEnd, this.str, 0);
                try {
                  let value = webview.WebCookieManager.fetchCookieSync(this.header + this.body);
                  console.log('fetchCookieSync cookie = ' + value);
                  Utils.emitEvent(value, 160200)
                } catch (error) {
                  console.error('fetchCookieSync  ErrorCode: ' + error.code);
                }

              break;
          }
        })
      }

      Web({ src: this.src, controller: this.controller, incognitoMode: this.incognitoMode })
        .javaScriptAccess(true)
        .onPageEnd((event) => {
          if (event) {
            this.isPageEnd = 0;
            console.log(' onPageEnd url:' + event.url);
          }
        })
    }
  }
}