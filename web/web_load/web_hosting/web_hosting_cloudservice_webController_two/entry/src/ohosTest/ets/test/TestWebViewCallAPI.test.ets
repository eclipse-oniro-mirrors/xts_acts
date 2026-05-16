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
import { abilityDelegatorRegistry, Driver } from '@kit.TestKit';
import router from '@ohos.router';
import { waitForExist } from './WaitTest.test';

let emitKey = '';
const driver = Driver.create();
export default function ActsWebViewTest6() {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator();

  describe('testWebView_CallAPI', async () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/TestWebViewCallAPI',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webviewBFCacheSuspendPlayer state success ' + JSON.stringify(pages));
        if (!('testWebView_CallAPI' == pages.name)) {
          console.info('get index state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push index state success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push index page error:' + err);
      }
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
     * @tc.name   SUB_ACE_WEB_setUrl_0100
     * @tc.number SUB_ACE_WEB_setUrl_0100
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_WEB_setUrl_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("response", 147021);
      let isReturn = false;
      Utils.registerBaseEvent('testWebView_setUrl0100',
        "401BusinessError 401: Parameter error. The type of 'url' must be string.", 147090, () => {
          isReturn = true
        },
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.waitAndClickComponent('response',driver)
      await waitForExist(()=>isReturn, 'SUB_ACE_WEB_isMainFrame_return_false', true,1000);
      done();
    });
  });
}