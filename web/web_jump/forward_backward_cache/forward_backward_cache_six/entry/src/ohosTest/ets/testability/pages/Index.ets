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

  onPageShow(): void{
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    };
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
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
      }
    }
  }

  build(){
    Column() {
      Row() {
        Button('Options')
          .key('setBackForwardCacheOptions')
          .onClick((event: ClickEvent) => {
            switch (this.str) {
              case 'SUB_ACE_WEB_BFCACHE_SDK_0005':
                try {
                  let options = new webview.BackForwardCacheOptions();
                  options.size = -1;
                  options.timeToLive = 10;
                  this.controller.setBackForwardCacheOptions(options)
                  Utils.emitEvent('true', 200)
                } catch (e) {
                  console.log('err:' + e.code + e.message)
                }
                break;
              case 'SUB_ACE_WEB_BFCACHE_SDK_0006':
                try {
                  let options = new webview.BackForwardCacheOptions();
                  options.size = 0;
                  options.timeToLive = 10;
                  this.controller.setBackForwardCacheOptions(options)
                  Utils.emitEvent('true', 201)
                } catch (e) {
                  console.log('err:' + e.code + e.message)
                }
                break;
              case 'SUB_ACE_WEB_BFCACHE_SDK_0007':
                try {
                  let options = new webview.BackForwardCacheOptions();
                  options.size = 1.6;
                  options.timeToLive = 10;
                  this.controller.setBackForwardCacheOptions(options)
                  Utils.emitEvent('true', 202)
                } catch (e) {
                  console.log('err:' + e.code + e.message)
                }
                break;
              case 'SUB_ACE_WEB_BFCACHE_SDK_0008':
                try {
                  let options = new webview.BackForwardCacheOptions();
                  options.size = 1;
                  options.timeToLive = 10;
                  this.controller.setBackForwardCacheOptions(options)
                  Utils.emitEvent('true', 203)
                } catch (e) {
                  console.log('err:' + e.code + e.message)
                }
                break;
              case 'SUB_ACE_WEB_BFCACHE_SDK_0009':
                try {
                  let options = new webview.BackForwardCacheOptions();
                  options.size = 50;
                  options.timeToLive = 10;
                  this.controller.setBackForwardCacheOptions(options)
                  Utils.emitEvent('true', 204)
                } catch (e) {
                  console.log('err:' + e.code + e.message)
                }
                break;
              case 'SUB_ACE_WEB_BFCACHE_SDK_00010':
                try {
                  let options = new webview.BackForwardCacheOptions();
                  options.size = 51;
                  options.timeToLive = 10;
                  this.controller.setBackForwardCacheOptions(options)
                  Utils.emitEvent('true', 205)
                } catch (e) {
                  console.log('err:' + e.code + e.message)
                }
                break;
              case 'SUB_ACE_WEB_BFCACHE_SDK_00011':
                try {
                  let options = new webview.BackForwardCacheOptions();
                  options.size = 1;
                  options.timeToLive = 0;
                  this.controller.setBackForwardCacheOptions(options)
                  Utils.emitEvent('true', 206)
                } catch (e) {
                  console.log('err:' + e.code + e.message)
                }
                break;
              case 'SUB_ACE_WEB_BFCACHE_SDK_00012':
                try {
                  let options = new webview.BackForwardCacheOptions();
                  options.size = 1;
                  options.timeToLive = 600;
                  this.controller.setBackForwardCacheOptions(options)
                  Utils.emitEvent('true', 207)
                } catch (e) {
                  console.log('err:' + e.code + e.message)
                }
                break;
              case 'SUB_ACE_WEB_BFCACHE_SDK_00013':
                try {
                  let options = new webview.BackForwardCacheOptions();
                  options.size = 1;
                  options.timeToLive = -20;
                  this.controller.setBackForwardCacheOptions(options)
                  Utils.emitEvent('true', 208)
                } catch (e) {
                  console.log('err:' + e.code + e.message)
                }
                break;
              case 'SUB_ACE_WEB_BFCACHE_SDK_00014':
                try {
                  let options = new webview.BackForwardCacheOptions();
                  options.size = 1;
                  options.timeToLive = 90.5;
                  this.controller.setBackForwardCacheOptions(options)
                  Utils.emitEvent('true', 209)
                } catch (e) {
                  console.log('err:' + e.code + e.message)
                }
                break;
              case 'SUB_ACE_WEB_BFCACHE_SDK_00015':
                try {
                  let options = new webview.BackForwardCacheOptions();
                  options.size = 1;
                  options.timeToLive = 30;
                  this.controller1.setBackForwardCacheOptions(options)
                } catch (e) {
                  console.log('err:' + e.code + e.message)
                  Utils.emitEvent(e.code + e.message, 210)
                }
                break;
            }
          })
      }


      Web({ src: this.src, controller: this.controller, incognitoMode: this.incognitoMode })
        .javaScriptAccess(true)
    }
  }
}