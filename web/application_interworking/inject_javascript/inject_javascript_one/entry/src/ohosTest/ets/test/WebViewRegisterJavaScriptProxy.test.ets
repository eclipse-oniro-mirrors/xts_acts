/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect , TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import events_emitter from '@ohos.events.emitter';
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest.test';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const driver = Driver.create();

let emitKey = "";

export default function ActsAceRegisterJavaScriptProxy() {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator()
  describe('RegisterJavaScriptProxyUnitTest', async () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebviewRegisterJavaScriptProxy',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webviewBFCacheSuspendPlayer state success ' + JSON.stringify(pages));
        if (!("webviewRegisterJavaScriptProxy" == pages.name)) {
          console.info('get index state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push index state success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push index page error:' + err);
      }
      await driver.waitForComponent(ON.id("testWebView_registerJavaScriptProxy_0013"), 10000);
      done()
    });
    beforeEach(async (done: Function) => {
      done();
    });


    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    });

    /**
     * @tc.number SUB_ACE_WEB_registerJavaScriptProxy_SDK_0013
     * @tc.name testWebView_registerJavaScriptProxy_0013
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_registerJavaScriptProxy_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      Utils.emitEvent('0013', 172460)
      Utils.registerBaseEvent("testWebView_registerJavaScriptProxy_0013", '"Error: Jsb Permission Denied"', 172470, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('testWebView_registerJavaScriptProxy_0013', 10, '');
    });

    /**
     * @tc.number SUB_ACE_WEB_registerJavaScriptProxy_SDK_0014
     * @tc.name testWebView_registerJavaScriptProxy_0014
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_registerJavaScriptProxy_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      Utils.emitEvent('0014', 172460)
      Utils.registerBaseEvent("testWebView_registerJavaScriptProxy_0014", '"Error: Jsb Permission Denied"', 172480, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('testWebView_registerJavaScriptProxy_0014', 10, '');
    });

    /**
     * @tc.number SUB_ACE_WEB_registerJavaScriptProxy_SDK_0015
     * @tc.name testWebView_registerJavaScriptProxy_0015
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_registerJavaScriptProxy_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      Utils.emitEvent('0015', 172460)
      Utils.registerBaseEvent("testWebView_registerJavaScriptProxy_0015", '"Error: Jsb Permission Denied"', 172490, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('testWebView_registerJavaScriptProxy_0015', 10, '');
    });

    /**
     * @tc.number SUB_ACE_WEB_registerJavaScriptProxy_SDK_0016
     * @tc.name testWebView_registerJavaScriptProxy_0016
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testWebView_registerJavaScriptProxy_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      Utils.emitEvent('0016', 172460)
      Utils.registerBaseEvent("testWebView_registerJavaScriptProxy_0016", '"Error: Jsb Permission Denied"', 172500, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('testWebView_registerJavaScriptProxy_0016', 10, '');
    });

    /**
     * @tc.number SUB_ACE_WEB_registerJavaScriptProxy_SDK_0017
     * @tc.name testWebView_registerJavaScriptProxy_0017
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testWebView_registerJavaScriptProxy_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      Utils.emitEvent('0017', 172460)
      Utils.registerBaseEvent("testWebView_registerJavaScriptProxy_0017", '"success"', 172510, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('testWebView_registerJavaScriptProxy_0017', 10, '');
    });

    /**
     * @tc.number SUB_ACE_WEB_registerJavaScriptProxy_SDK_0018
     * @tc.name testWebView_registerJavaScriptProxy_0018
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_registerJavaScriptProxy_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      Utils.emitEvent('0018', 172460)
      Utils.registerBaseEvent("testWebView_registerJavaScriptProxy_0018", '"Error: Jsb Permission Denied"', 172520, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('testWebView_registerJavaScriptProxy_0018', 10, '');
    });

    /**
     * @tc.number SUB_ACE_WEB_registerJavaScriptProxy_SDK_0019
     * @tc.name testWebView_registerJavaScriptProxy_0019
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testWebView_registerJavaScriptProxy_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      Utils.emitEvent('0019', 172460)
      Utils.registerBaseEvent("testWebView_registerJavaScriptProxy_0019", '"success"', 172530, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('testWebView_registerJavaScriptProxy_0019', 10, '');
    });

    /**
     * @tc.number SUB_ACE_WEB_registerJavaScriptProxy_SDK_0020
     * @tc.name testWebView_registerJavaScriptProxy_0020
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testWebView_registerJavaScriptProxy_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      Utils.emitEvent('0020', 172460)
      Utils.registerBaseEvent("testWebView_registerJavaScriptProxy_0020", '"Error: Jsb Permission Denied"', 172540, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('testWebView_registerJavaScriptProxy_0020', 10, '');
    });


    /**
     * @tc.number SUB_ACE_WEB_registerJavaScriptProxy_SDK_0021
     * @tc.name testWebView_registerJavaScriptProxy_0021
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_registerJavaScriptProxy_0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      Utils.emitEvent('0021', 172460)
      Utils.registerBaseEvent("testWebView_registerJavaScriptProxy_0021", '"success"', 172550, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('testWebView_registerJavaScriptProxy_0021', 10, '');
    });

    /**
     * @tc.number SUB_ACE_WEB_registerJavaScriptProxy_SDK_0022
     * @tc.name testWebView_registerJavaScriptProxy_0022
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_registerJavaScriptProxy_0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      Utils.emitEvent('0022', 172460)
      Utils.registerBaseEvent("testWebView_registerJavaScriptProxy_0022", '"Error: Jsb Permission Denied"', 172560, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('testWebView_registerJavaScriptProxy_0022', 10, '');
    });

    /**
     * @tc.number SUB_ACE_WEB_registerJavaScriptProxy_SDK_0023
     * @tc.name testWebView_registerJavaScriptProxy_0023
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_registerJavaScriptProxy_0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      Utils.emitEvent('0023', 172460)
      Utils.registerBaseEvent("testWebView_registerJavaScriptProxy_0023", '"Error: Jsb Permission Denied"', 172570, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('testWebView_registerJavaScriptProxy_0023', 10, '');
    });

    /**
     * @tc.number SUB_ACE_WEB_registerJavaScriptProxy_SDK_0024
     * @tc.name testWebView_registerJavaScriptProxy_0024
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testWebView_registerJavaScriptProxy_0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      Utils.emitEvent('0024', 172460)
      Utils.registerBaseEvent("testWebView_registerJavaScriptProxy_0024", '"success"', 172580, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('testWebView_registerJavaScriptProxy_0024', 10, '');
    });

    /**
     * @tc.number SUB_ACE_WEB_registerJavaScriptProxy_SDK_0025
     * @tc.name testWebView_registerJavaScriptProxy_0025
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_registerJavaScriptProxy_0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      Utils.emitEvent('0025', 172460)
      Utils.registerBaseEvent("testWebView_registerJavaScriptProxy_0025", '"success"', 172590, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('testWebView_registerJavaScriptProxy_0025', 10, '');
    });

    /**
     * @tc.number SUB_ACE_WEB_registerJavaScriptProxy_SDK_0026
     * @tc.name testWebView_registerJavaScriptProxy_0026
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testWebView_registerJavaScriptProxy_0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      Utils.emitEvent('0026', 172460)
      Utils.registerBaseEvent("testWebView_registerJavaScriptProxy_0026", '"success"', 172600, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('testWebView_registerJavaScriptProxy_0026', 10, '');
    });
  });
}