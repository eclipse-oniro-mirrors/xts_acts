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

let emitKey = "";

export default function ActsWebViewTest2() {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator();

  describe('WebViewIncognitoModeTest_Geolocation', async () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/TestWebViewGeolocation',
      }
      try {
        await Utils.sleep(1000)
        router.clear();
        let pages = router.getState();
        console.info('get webviewBFCacheSuspendPlayer state success ' + JSON.stringify(pages));
        if (!('testWebView_Geolocation' == pages.name)) {
          console.info('get index state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(1000);
          console.info('push index state success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push index page error:' + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      await Utils.sleep(500);
      done();
    });

    afterEach(async (done: Function) => {
      await Utils.sleep(1000);
      console.info('web afterEach start:' + emitKey);
      try {
        let backData: events_emitter.EventData = {
          data: {
            'ACTION': ''
          }
        }
        let backEvent: events_emitter.InnerEvent = {
          eventId: 10,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('start send emitKey');
        events_emitter.emit(backEvent, backData);
      } catch (err) {
        console.info('emit emitKey  err: ' + JSON.stringify(err));
      }
      await Utils.sleep(1000);
      done();
    })

    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    });

    /**
     * @tc.number SUB_ACE_WEB_INCOGNITO_API_0017
     * @tc.name testWebView_getAccessibleGeolocation0003
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_ACE_WEB_INCOGNITO_API_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.registerBaseEvent('testWebView_getAccessibleGeolocation0003', 'Invalid origin', 5005, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });

      sendEventByKey('getAccessibleGeolocation1', 10, '');
    });


    /**
     * @tc.number SUB_ACE_WEB_INCOGNITO_API_0018
     * @tc.name testWebView_getAccessibleGeolocation0004
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_ACE_WEB_INCOGNITO_API_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.registerBaseEvent('testWebView_getAccessibleGeolocation0004', 'Invalid origin', 5006, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('getAccessibleGeolocation2', 10, '');
    });

    /**
     * @tc.number SUB_ACE_WEB_INCOGNITO_API_0019
     * @tc.name testWebView_getStoredGeolocation0003
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_ACE_WEB_INCOGNITO_API_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.registerBaseEvent('testWebView_getStoredGeolocation0003', 'No data', 5007, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });

      sendEventByKey('getStoredGeolocation1', 10, '');
    });

    /**
     * @tc.number SUB_ACE_WEB_INCOGNITO_API_0020
     * @tc.name testWebView_getStoredGeolocation0004
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_ACE_WEB_INCOGNITO_API_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.registerBaseEvent('testWebView_getStoredGeolocation0004', 'No data', 5008, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });

      sendEventByKey('getStoredGeolocation2', 10, '');
    });

  });
}