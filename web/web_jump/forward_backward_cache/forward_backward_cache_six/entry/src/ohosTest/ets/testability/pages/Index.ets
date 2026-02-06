/*
* Copyright (C) 2024-2025 HiHope Open Source Organization.
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
import Utils from '../../test/Util';
import events_emitter from '@ohos.events.emitter';
import { JSON } from '@kit.ArkTS';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import testsuite from '../../test/List.test';
import { Hypium } from '@ohos/hypium';
import { waitForExist } from '../../test/WaitTest.test';

class TestObj {
  constructor() {
  }

  test(testStr: string): string {
    console.log('Web Component str' + testStr);
    return testStr;
  }

  toString(): void {
    console.log('Web Component toString');
  }

  testNumber(testNum: number): number {
    console.log('Web Component number' + testNum);
    return testNum;
  }

  asyncTestBool(testBol: boolean): boolean {
    console.log('Web Component boolean' + testBol);
    return testBol
  }
}

class WebObj {
  constructor() {
  }

  webTest(): string {
    console.log('Web test');
    return 'Web test';
  }

  webString(): void {
    console.log('Web test toString');
  }
}

class AsyncObj {
  constructor() {
  }

  asyncTest(): void {
    console.log('Async test');
  }

  asyncString(testStr: string): void {
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
  @State isComplete: number = -1;
  @State isReceive: number = -1;

  onPageShow(): void {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 137650,
      priority: events_emitter.EventPriority.LOW,
    };
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }

  onPageHide() {
    events_emitter.off(137650)
  }

  aboutToAppear(): void {
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

  build() {
    Column() {
      Row() {
        Button('Options')
          .key('setBackForwardCacheOptions')
          .onClick(async (event: ClickEvent) => {
            await waitForExist(() => this.isComplete, this.str, 0);
            await waitForExist(() => this.isReceive, this.str, 0);
            this.isReceive = -1;
            console.info('key==>' + this.str)
            switch (this.str) {
              case 'SUB_ACE_WEB_BFCACHE_SDK_0005':
                try {
                  let options = new webview.BackForwardCacheOptions();
                  options.size = -1;
                  options.timeToLive = 10;
                  this.controller.setBackForwardCacheOptions(options)
                  Utils.emitEvent('true', 137660)
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
                  Utils.emitEvent('true', 137670)
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
                  Utils.emitEvent('true', 137680)
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
                  Utils.emitEvent('true', 137690)
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
                  Utils.emitEvent('true', 137700)
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
                  Utils.emitEvent('true', 137710)
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
                  Utils.emitEvent('true', 137720)
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
                  Utils.emitEvent('true', 137730)
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
                  Utils.emitEvent('true', 137740)
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
                  Utils.emitEvent('true', 137750)
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
                  Utils.emitEvent(e.code + e.message, 137760)
                }
                break;
            }
          })
      }


      Web({ src: this.src, controller: this.controller, incognitoMode: this.incognitoMode })
        .javaScriptAccess(true)
        .onPageEnd((event) => {
          console.log('web pageEnd==>' + event.url);
          this.isComplete = 0;
        })
    }
  }
}