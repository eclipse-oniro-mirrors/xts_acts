/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils.test';
import events_emitter from '@ohos.events.emitter';
import { expect } from '@ohos/hypium';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webClearAllCookiesSyncCharacter() {

  describe('webClearAllCookiesSyncCharacterTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webClearAllCookiesSyncCharacter',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webClearAllCookiesSyncCharacter state success ' + JSON.stringify(pages));
        if (!('webClearAllCookiesSyncCharacter' == pages.name)) {
          console.info('get webClearAllCookiesSyncCharacter state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('push webClearAllCookiesSyncCharacter page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webClearAllCookiesSyncCharacter page error: ' + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      await Utils.sleep(2000);
      console.info('webClearAllCookiesSyncCharacter beforeEach start');
      done();
    })

    /*
     * @tc.number     : SUB_WEB_CLEARALLCOOKIESSYNC_CHARACTER_0100
     * @tc.name       : testClearAllCookiesSyncCharacter
     * @tc.desc       : test clearAllCookiesSync \n
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testClearAllCookiesSyncCharacter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitClearAllCookiesSyncCharacter', 10);
      Utils.registerBaseEvent('testClearAllCookiesSyncCharacter', 'success', 2025060424, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webClearAllCookiesSyncCharacterButton', 10, '');
    })
    /*
     * @tc.number     : SUB_WEB_CLEARALLCOOKIESSYNC_CHARACTER_0200
     * @tc.name       : testClearAllCookiesSyncCharacterIncognito
     * @tc.desc       : test clearAllCookiesSync incognito \n
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testClearAllCookiesSyncCharacterIncognito', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitClearAllCookiesSyncCharacterIncognito', 10);
      Utils.registerBaseEvent('testClearAllCookiesSyncCharacterIncognito', 'success', 2025060425, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webClearAllCookiesSyncCharacterButton', 10, '');
    })

  })
}
