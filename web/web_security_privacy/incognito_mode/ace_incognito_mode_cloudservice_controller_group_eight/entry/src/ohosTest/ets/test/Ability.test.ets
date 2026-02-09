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
import { waitForComponent } from './WaitTest';
let emitKey = ""

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
        console.info("get webviewBFCacheSuspendPlayer state success " + JSON.stringify(pages));
        if (!("Index" == pages.name)) {
          console.info("get index state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push index state success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push index page error:" + err);
      }
      await waitForComponent("INCOGNITO");
      done()
    })

    beforeEach(async (done: Function) => {
      done();
    });



    /**
     * @tc.name   testWebView_deleteAllGeolocation0002
     * @tc.number SUB_ACE_WEB_INCOGNITO_API_0006
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testWebView_deleteAllGeolocation0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("SUB_ACE_WEB_INCOGNITO_API_0006", 160130)
      Utils.registerBaseEvent("setRenderProcessMode", "true", 160140, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('INCOGNITO', 10, '');
    })

    /**
     * @tc.name   testWebView_getAccessibleGeolocation0001
     * @tc.number SUB_ACE_WEB_INCOGNITO_API_0007
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testWebView_getAccessibleGeolocation0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("SUB_ACE_WEB_INCOGNITO_API_0007", 160130)
      Utils.registerBaseEvent("deleteGeolocation", "17100011Invalid origin.The origin format must follow defined in RFC 6454.", 160150, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('INCOGNITO', 10, '');
    })

    /**
     * @tc.name   testWebView_getAccessibleGeolocation0002
     * @tc.number SUB_ACE_WEB_INCOGNITO_API_0008
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testWebView_getAccessibleGeolocation0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("SUB_ACE_WEB_INCOGNITO_API_0008", 160130)
      Utils.registerBaseEvent("deleteGeolocation", "17100011Invalid origin.The origin format must follow defined in RFC 6454.", 160160, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('INCOGNITO', 10, '');
    })

    /**
     * @tc.name   testWebView_getStoredGeolocation0001
     * @tc.number SUB_ACE_WEB_INCOGNITO_API_0009
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testWebView_getStoredGeolocation0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("SUB_ACE_WEB_INCOGNITO_API_0009", 160130)
      Utils.registerBaseEvent("deleteGeolocation", "[]", 160170, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('INCOGNITO', 10, '');
    })

    /**
     * @tc.name   testWebView_getStoredGeolocation0002
     * @tc.number SUB_ACE_WEB_INCOGNITO_API_00010
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testWebView_getStoredGeolocation0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("SUB_ACE_WEB_INCOGNITO_API_00010", 160130)
      Utils.registerBaseEvent("deleteGeolocation", "[]", 160180, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('INCOGNITO', 10, '');
    })


    /**
     * @tc.name   testWebView_fetchCookieSync0001
     * @tc.number SUB_ACE_WEB_INCOGNITO_API_00011
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testWebView_fetchCookieSync0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("SUB_ACE_WEB_INCOGNITO_API_00011", 160130)
      Utils.registerBaseEvent("deleteGeolocation", "", 160190, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('INCOGNITO', 10, '');
    })

    /**
     * @tc.name   testWebView_fetchCookieSync0002
     * @tc.number SUB_ACE_WEB_INCOGNITO_API_00012
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testWebView_fetchCookieSync0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("SUB_ACE_WEB_INCOGNITO_API_00012", 160130)
      Utils.registerBaseEvent("deleteGeolocation", "", 160200, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('INCOGNITO', 10, '');
    })

  })
}