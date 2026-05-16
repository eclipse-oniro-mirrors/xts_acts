/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterEach, beforeAll, beforeEach, expect, describe, it, TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import { Driver, ON } from '@kit.TestKit';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPABILITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let driver = Driver.create();

export default function adsBlockManagerAddAdsBlockDisallowedListParam() {

  describe('adsBlockManagerAddAdsBlockDisallowedListParamTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/adsBlockManagerAddAdsBlockDisallowedListParam',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get adsBlockManagerAddAdsBlockDisallowedListParam state success ' + JSON.stringify(pages));
        if (!('adsBlockManagerAddAdsBlockDisallowedListParam' == pages.name)) {
          console.info('get adsBlockManagerAddAdsBlockDisallowedListParam state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push adsBlockManagerAddAdsBlockDisallowedListParam page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push adsBlockManagerAddAdsBlockDisallowedListParam page error: ' + err);
      }
      console.log('driver waitForComponent start==>');
      await driver.waitForComponent(ON.id('adsBlockManagerAddAdsBlockDisallowedListParamButton'), 10000);
      console.log('waitForComponent adsBlockManagerAddAdsBlockDisallowedListParamButton==>');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPABILITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('adsBlockManagerAddAdsBlockDisallowedListParam beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('adsBlockManagerAddAdsBlockDisallowedListParam afterEach start');
      done();
    })

    /**
     * @tc.name   testAddAdsBlockDisallowedListNull001
     * @tc.number SUB_WEB_ADSBLOCKMANAGER_ADDADSBLOCKDISALLOWEDLIST_NULL_0100
     * @tc.desc   test AdsBlockManager.addAdsBlockDisallowedList with null domainSuffixes parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddAdsBlockDisallowedListNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitAddAdsBlockDisallowedListNull001', 181000);
      Utils.registerBaseEvent('testAddAdsBlockDisallowedListNull001', true, 181010, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('adsBlockManagerAddAdsBlockDisallowedListParamButton', 10, '');
    })

    /**
     * @tc.name   testAddAdsBlockDisallowedListUndefined001
     * @tc.number SUB_WEB_ADSBLOCKMANAGER_ADDADSBLOCKDISALLOWEDLIST_UNDEFINED_0100
     * @tc.desc   test AdsBlockManager.addAdsBlockDisallowedList with undefined domainSuffixes parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddAdsBlockDisallowedListUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitAddAdsBlockDisallowedListUndefined001', 181000);
      Utils.registerBaseEvent('testAddAdsBlockDisallowedListUndefined001', true, 181020, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('adsBlockManagerAddAdsBlockDisallowedListParamButton', 10, '');
    })

    /**
     * @tc.name   testAddAdsBlockDisallowedListValidArray001
     * @tc.number SUB_WEB_ADSBLOCKMANAGER_ADDADSBLOCKDISALLOWEDLIST_VALIDARRAY_0100
     * @tc.desc   test AdsBlockManager.addAdsBlockDisallowedList with valid non-empty array parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddAdsBlockDisallowedListValidArray001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitAddAdsBlockDisallowedListValidArray001', 181000);
      Utils.registerBaseEvent('testAddAdsBlockDisallowedListValidArray001', true, 181030, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('adsBlockManagerAddAdsBlockDisallowedListParamButton', 10, '');
    })
  })
}
