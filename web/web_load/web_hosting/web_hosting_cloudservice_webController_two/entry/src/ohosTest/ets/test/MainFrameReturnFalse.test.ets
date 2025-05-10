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

let emitKey = '';

export default function ActsWebViewTest4() {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator();

  describe('SUB_ACE_WEB_getRequestMethod', async () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/MainFrameReturnFalse',
      }
      try {
        await Utils.sleep(1000);
        router.clear();
        let pages = router.getState();
        console.info('get webviewBFCacheSuspendPlayer state success ' + JSON.stringify(pages));
        if (!('SUB_ACE_WEB_isMainFrame_return_false' == pages.name)) {
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
     * @tc.number SUB_ACE_WEB_LoadCommittedDetails_SDK_0200
     * @tc.name SUB_ACE_WEB_isMainFrame_return_false
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_ACE_WEB_LoadCommittedDetails_SDK_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.registerBaseEvent('SUB_ACE_WEB_isMainFrame_return_false', false, 5010, done,
        (backData: events_emitter.EventData, expected: Object) => {
          console.info('Received event data: ' + JSON.stringify(backData));
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      setTimeout(() => {
        sendEventByKey('runJavaScript', 10, '');
      }, 3000)
    });
  });
}