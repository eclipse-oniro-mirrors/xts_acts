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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect , TestType, Size, Level } from '@ohos/hypium';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { Driver, ON } from '@ohos.UiTest'
import Utils from './Utils';
import events_emitter from '@ohos.events.emitter';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest.test';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const driver = Driver.create();

export default function abilityTest() {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator()
  describe('ActsAbilityTest', async () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/Index',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webviewBFCacheSuspendPlayer state success ' + JSON.stringify(pages));
        if (!("Index" == pages.name)) {
          console.info('get index state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push index state success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push index page error:' + err);
      }
      await driver.waitForComponent(ON.id("001"), 10000);
      done()
    })

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      done();
    });

    /**
     * @tc.number SUB_ACE_WEB_registerJavaScriptProxy_SDK_0001
     * @tc.name testWebView_registerJavaScriptProxy_0001
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testWebView_registerJavaScriptProxy_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("Web", 172000);
      Utils.registerBaseEvent("registerJavaScriptProxy", "17100001undefined", 172010, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, '001');
    })

    /**
     * @tc.number SUB_ACE_WEB_registerJavaScriptProxy_SDK_0002
     * @tc.name testWebView_registerJavaScriptProxy_0002
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testWebView_registerJavaScriptProxy_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("name null", 172000);
      Utils.registerBaseEvent("registerJavaScriptProxy", "401undefined", 172020, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, '002');
    })

    /**
     * @tc.number SUB_ACE_WEB_registerJavaScriptProxy_SDK_0003
     * @tc.name testWebView_registerJavaScriptProxy_0003
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testWebView_registerJavaScriptProxy_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("TestObj", 172000);
      Utils.registerBaseEvent("registerJavaScriptProxy", "true", 172030, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, '003');
    })

    /**
     * @tc.number SUB_ACE_WEB_registerJavaScriptProxy_SDK_0004
     * @tc.name testWebView_registerJavaScriptProxy_0004
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it("testWebView_registerJavaScriptProxy_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("100", 172000);
      Utils.registerBaseEvent("registerJavaScriptProxy", "true", 172040, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, '004');
    })

    /**
     * @tc.number SUB_ACE_WEB_registerJavaScriptProxy_SDK_0005
     * @tc.name testWebView_registerJavaScriptProxy_0005
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it("testWebView_registerJavaScriptProxy_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("method null", 172000);
      Utils.registerBaseEvent("registerJavaScriptProxy", "401undefined", 172050, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, '005');
    })

    /**
     * @tc.number SUB_ACE_WEB_registerJavaScriptProxy_SDK_0006
     * @tc.name testWebView_registerJavaScriptProxy_0006
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testWebView_registerJavaScriptProxy_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("normal_006", 172000);
      Utils.registerBaseEvent("registerJavaScriptProxy", "true", 172060, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, '006');
    })

    /**
     * @tc.number SUB_ACE_WEB_registerJavaScriptProxy_SDK_0007
     * @tc.name testWebView_registerJavaScriptProxy_0007
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testWebView_registerJavaScriptProxy_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("lost", 172000);
      Utils.registerBaseEvent("registerJavaScriptProxy", "true", 172070, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, '007');
    })

    /**
     * @tc.number SUB_ACE_WEB_registerJavaScriptProxy_SDK_0008
     * @tc.name testWebView_registerJavaScriptProxy_0008
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testWebView_registerJavaScriptProxy_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("methods", 172000);
      Utils.registerBaseEvent("registerJavaScriptProxy", "true", 172080, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, '008');
    })

    /**
     * @tc.number SUB_ACE_WEB_registerJavaScriptProxy_SDK_0009
     * @tc.name testWebView_registerJavaScriptProxy_0009
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testWebView_registerJavaScriptProxy_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("normal_009", 172000);
      Utils.registerBaseEvent("registerJavaScriptProxy", "true", 172090, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, '009');
    })

    /**
     * @tc.number SUB_ACE_WEB_registerJavaScriptProxy_SDK_00010
     * @tc.name testWebView_registerJavaScriptProxy_00010
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it("testWebView_registerJavaScriptProxy_00010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("normal_010", 172000);
      Utils.registerBaseEvent("registerJavaScriptProxy", "true", 172100, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected)
        });
      await Utils.waitAndClickComponent(driver, '0010');
    })

    /**
     * @tc.number SUB_ACE_WEB_registerJavaScriptProxy_SDK_00011
     * @tc.name testWebView_registerJavaScriptProxy_00011
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it("testWebView_registerJavaScriptProxy_00011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("method", 172000);
      Utils.registerBaseEvent("registerJavaScriptProxy", "true", 172110, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, '0011');
    })
  })
}