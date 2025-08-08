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
import Utils from './Util';
import events_emitter from '@ohos.events.emitter';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

let emitKey = ""

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

    afterEach(async (done: Function) => {
      await Utils.sleep(600);
      console.info("web afterEach start:" + emitKey);
      try {
        let backData: events_emitter.EventData = {
          data: {
            "ACTION": emitKey
          }
        }
        let backEvent: events_emitter.InnerEvent = {
          eventId: 10,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("start send emitKey");
        events_emitter.emit(backEvent, backData);
      } catch (err) {
        console.info("emit emitKey  err: " + JSON.stringify(err));
      }
      await Utils.sleep(500);
      done();
    })

    afterAll(() => {
    })

    /**
     * @tc.number SUB_ACE_WEB_BFCACHE_SDK_0005
     * @tc.name testWebView_enableBackForwardCache0005
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testWebView_enableBackForwardCache0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.registerBaseEvent("setBackForwardCacheOptions", "true", 200, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent("SUB_ACE_WEB_BFCACHE_SDK_0005", 10)
      await Utils.sleep(500)
      sendEventByKey('setBackForwardCacheOptions', 10, '');
    })

    /**
     * @tc.number SUB_ACE_WEB_BFCACHE_SDK_0006
     * @tc.name testWebView_enableBackForwardCache0006
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testWebView_enableBackForwardCache0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.registerBaseEvent("setBackForwardCacheOptions", "true", 201, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent("SUB_ACE_WEB_BFCACHE_SDK_0006", 10)
      await Utils.sleep(500)
      sendEventByKey('setBackForwardCacheOptions', 10, '');
    })

    /**
     * @tc.number SUB_ACE_WEB_BFCACHE_SDK_0007
     * @tc.name testWebView_enableBackForwardCache0007
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testWebView_enableBackForwardCache0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.registerBaseEvent("setBackForwardCacheOptions", "true", 202, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent("SUB_ACE_WEB_BFCACHE_SDK_0007", 10)
      await Utils.sleep(500)
      sendEventByKey('setBackForwardCacheOptions', 10, '');
    })

    /**
     * @tc.number SUB_ACE_WEB_BFCACHE_SDK_0008
     * @tc.name testWebView_enableBackForwardCache0008
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testWebView_enableBackForwardCache0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.registerBaseEvent("setBackForwardCacheOptions", "true", 203, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent("SUB_ACE_WEB_BFCACHE_SDK_0008", 10)
      await Utils.sleep(500)
      sendEventByKey('setBackForwardCacheOptions', 10, '');
    })

    /**
     * @tc.number SUB_ACE_WEB_BFCACHE_SDK_0009
     * @tc.name testWebView_enableBackForwardCache0009
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testWebView_enableBackForwardCache0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.registerBaseEvent("setBackForwardCacheOptions", "true", 204, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent("SUB_ACE_WEB_BFCACHE_SDK_0009", 10)
      await Utils.sleep(500)
      sendEventByKey('setBackForwardCacheOptions', 10, '');
    })

    /**
     * @tc.number SUB_ACE_WEB_BFCACHE_SDK_00010
     * @tc.name testWebView_enableBackForwardCache00010
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testWebView_enableBackForwardCache00010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.registerBaseEvent("setBackForwardCacheOptions", "true", 205, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent("SUB_ACE_WEB_BFCACHE_SDK_00010", 10)
      await Utils.sleep(500)
      sendEventByKey('setBackForwardCacheOptions', 10, '');
    })

    /**
     * @tc.number SUB_ACE_WEB_BFCACHE_SDK_00011
     * @tc.name testWebView_enableBackForwardCache00011
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testWebView_enableBackForwardCache00011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.registerBaseEvent("setBackForwardCacheOptions", "true", 206, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent("SUB_ACE_WEB_BFCACHE_SDK_00011", 10)
      await Utils.sleep(500)
      sendEventByKey('setBackForwardCacheOptions', 10, '');
    })

    /**
     * @tc.number SUB_ACE_WEB_BFCACHE_SDK_00012
     * @tc.name testWebView_enableBackForwardCache00012
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testWebView_enableBackForwardCache00012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.registerBaseEvent("setBackForwardCacheOptions", "true", 207, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent("SUB_ACE_WEB_BFCACHE_SDK_00012", 10)
      await Utils.sleep(500)
      sendEventByKey('setBackForwardCacheOptions', 10, '');
    })

    /**
     * @tc.number SUB_ACE_WEB_BFCACHE_SDK_00013
     * @tc.name testWebView_enableBackForwardCache00013
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testWebView_enableBackForwardCache00013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.registerBaseEvent("setBackForwardCacheOptions", "true", 208, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent("SUB_ACE_WEB_BFCACHE_SDK_00013", 10)
      await Utils.sleep(500)
      sendEventByKey('setBackForwardCacheOptions', 10, '');
    })

    /**
     * @tc.number SUB_ACE_WEB_BFCACHE_SDK_00014
     * @tc.name testWebView_enableBackForwardCache00014
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testWebView_enableBackForwardCache00014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.registerBaseEvent("setBackForwardCacheOptions", "true", 209, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent("SUB_ACE_WEB_BFCACHE_SDK_00014", 10)
      await Utils.sleep(500)
      sendEventByKey('setBackForwardCacheOptions', 10, '');
    })

    /**
     * @tc.number SUB_ACE_WEB_BFCACHE_SDK_00015
     * @tc.name testWebView_enableBackForwardCache00016
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testWebView_enableBackForwardCache00016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.registerBaseEvent("setBackForwardCacheOptions",
        "17100001Init error. The WebviewController must be associated with a Web component", 210, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent("SUB_ACE_WEB_BFCACHE_SDK_00015", 10)
      await Utils.sleep(500)
      sendEventByKey('setBackForwardCacheOptions', 10, '');
    })


  })
}