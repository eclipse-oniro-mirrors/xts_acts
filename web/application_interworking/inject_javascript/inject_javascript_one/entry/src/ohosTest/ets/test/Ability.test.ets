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
import { Driver } from '@ohos.UiTest'
import Utils from './Utils';
import events_emitter from '@ohos.events.emitter';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function abilityTest() {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator()
  describe('ActsAbilityTest', async () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/Index',
      }
      try {
        await Utils.sleep(1000)
        router.clear();
        let pages = router.getState();
        console.info("get webviewBFCacheSuspendPlayer state success " + JSON.stringify(pages));
        if (!("Index" == pages.name)) {
          console.info("get index state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(1000);
          console.info("push index state success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push index page error:" + err);
      }
      done()
    })

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      await Utils.sleep(300);
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
      Utils.registerBaseEvent("registerJavaScriptProxy", "17100001undefined", 1001, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('001', 10, '');
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
      Utils.registerBaseEvent("registerJavaScriptProxy", "401undefined", 1002, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('002', 10, '');
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
      Utils.registerBaseEvent("registerJavaScriptProxy", "true", 1003, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('003', 10, '');
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
      Utils.registerBaseEvent("registerJavaScriptProxy", "true", 1004, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('004', 10, '');
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
      Utils.registerBaseEvent("registerJavaScriptProxy", "401undefined", 1005, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('005', 10, '');
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
      Utils.registerBaseEvent("registerJavaScriptProxy", "true", 1006, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('006', 10, '');
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
      Utils.registerBaseEvent("registerJavaScriptProxy", "true", 1007, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('007', 10, '');
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
      Utils.registerBaseEvent("registerJavaScriptProxy", "true", 1008, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('008', 10, '');
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
      Utils.registerBaseEvent("registerJavaScriptProxy", "true", 1009, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('009', 10, '');
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
      Utils.registerBaseEvent("registerJavaScriptProxy", "true", 1010, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected)
        });
      sendEventByKey('0010', 10, '');
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
      Utils.registerBaseEvent("registerJavaScriptProxy", "true", 1011, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('0011', 10, '');
    })
  })
}