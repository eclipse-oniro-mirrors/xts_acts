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
import Utils from './Util';
import events_emitter from '@ohos.events.emitter';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import router from '@ohos.router';
import { waitForComponent } from './WaitTest';
import { Driver,ON } from '@ohos.UiTest'
let driver = Driver.create();
export default function ActsWebViewTest2() {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator();

  describe('WebViewIncognitoModeTest_Geolocation', async () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/TestWebViewGeolocation',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webviewBFCacheSuspendPlayer state success ' + JSON.stringify(pages));
        if (!('testWebView_Geolocation' == pages.name)) {
          console.info('get index state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push index state success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push index page error:' + err);
      }
      await waitForComponent("getAccessibleGeolocation1");
      done()
    });

    beforeEach(async (done: Function) => {
      done();
    });


    /**
     * @tc.name   SUB_ACE_WEB_INCOGNITO_API_0017
     * @tc.number SUB_ACE_WEB_INCOGNITO_API_0017
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_WEB_INCOGNITO_API_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,   async (done: Function) => {
      Utils.emitEvent("getAccessibleGeolocation1", 160260)
      Utils.registerBaseEvent('testWebView_getAccessibleGeolocation0003', 'Invalid origin.The origin format must follow defined in RFC 6454.', 160270, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      let component = await driver.findComponent(ON.id("getAccessibleGeolocation1"));
      await component.click();
    });


    /**
     * @tc.name   SUB_ACE_WEB_INCOGNITO_API_0018
     * @tc.number SUB_ACE_WEB_INCOGNITO_API_0018
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_WEB_INCOGNITO_API_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("getAccessibleGeolocation2", 160260)
      Utils.registerBaseEvent('testWebView_getAccessibleGeolocation0004', 'Invalid origin.The origin format must follow defined in RFC 6454.', 160280, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('getAccessibleGeolocation2', 10, '');
    });

    /**
     * @tc.name   SUB_ACE_WEB_INCOGNITO_API_0019
     * @tc.number SUB_ACE_WEB_INCOGNITO_API_0019
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_WEB_INCOGNITO_API_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("getStoredGeolocation1", 160260)
      Utils.registerBaseEvent('testWebView_getStoredGeolocation0003', 'No data', 160290, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });

      sendEventByKey('getStoredGeolocation1', 10, '');
    });

    /**
     * @tc.name   SUB_ACE_WEB_INCOGNITO_API_0020
     * @tc.number SUB_ACE_WEB_INCOGNITO_API_0020
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_WEB_INCOGNITO_API_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("getStoredGeolocation2", 160260)
      Utils.registerBaseEvent('testWebView_getStoredGeolocation0004', 'No data', 160300, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });

      sendEventByKey('getStoredGeolocation2', 10, '');
    });

  });
}