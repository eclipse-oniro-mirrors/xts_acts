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

export default function adsBlockManagerAddAdsBlockAllowedListParam() {

  describe('adsBlockManagerAddAdsBlockAllowedListParamTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/adsBlockManagerAddAdsBlockAllowedListParam',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get adsBlockManagerAddAdsBlockAllowedListParam state success ' + JSON.stringify(pages));
        if (!('adsBlockManagerAddAdsBlockAllowedListParam' == pages.name)) {
          console.info('get adsBlockManagerAddAdsBlockAllowedListParam state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push adsBlockManagerAddAdsBlockAllowedListParam page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push adsBlockManagerAddAdsBlockAllowedListParam page error: ' + err);
      }
      console.log('driver waitForComponent start==>');
      await driver.waitForComponent(ON.id('adsBlockManagerAddAdsBlockAllowedListParamButton'), 10000);
      console.log('waitForComponent adsBlockManagerAddAdsBlockAllowedListParamButton==>');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPABILITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('adsBlockManagerAddAdsBlockAllowedListParam beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('adsBlockManagerAddAdsBlockAllowedListParam afterEach start');
      done();
    })

    /**
     * @tc.name   testAddAdsBlockAllowedListNull001
     * @tc.number SUB_WEB_ADSBLOCKMANAGER_ADDADSBLOCKALLOWEDLIST_NULL_0100
     * @tc.desc   test AdsBlockManager.addAdsBlockAllowedList with null domainSuffixes parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddAdsBlockAllowedListNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitAddAdsBlockAllowedListNull001', 181100);
      Utils.registerBaseEvent('testAddAdsBlockAllowedListNull001', true, 181110, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.clickComponent('adsBlockManagerAddAdsBlockAllowedListParamButton');
    })

    /**
     * @tc.name   testAddAdsBlockAllowedListUndefined001
     * @tc.number SUB_WEB_ADSBLOCKMANAGER_ADDADSBLOCKALLOWEDLIST_UNDEFINED_0100
     * @tc.desc   test AdsBlockManager.addAdsBlockAllowedList with undefined domainSuffixes parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddAdsBlockAllowedListUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitAddAdsBlockAllowedListUndefined001', 181100);
      Utils.registerBaseEvent('testAddAdsBlockAllowedListUndefined001', true, 181120, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.clickComponent('adsBlockManagerAddAdsBlockAllowedListParamButton');
    })

    /**
     * @tc.name   testAddAdsBlockAllowedListEmptyArray001
     * @tc.number SUB_WEB_ADSBLOCKMANAGER_ADDADSBLOCKALLOWEDLIST_EMPTYARRAY_0100
     * @tc.desc   test AdsBlockManager.addAdsBlockAllowedList with empty array parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddAdsBlockAllowedListEmptyArray001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitAddAdsBlockAllowedListEmptyArray001', 181100);
      Utils.registerBaseEvent('testAddAdsBlockAllowedListEmptyArray001', true, 181130, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.clickComponent('adsBlockManagerAddAdsBlockAllowedListParamButton');
    })

    /**
     * @tc.name   testAddAdsBlockAllowedListValidArray001
     * @tc.number SUB_WEB_ADSBLOCKMANAGER_ADDADSBLOCKALLOWEDLIST_VALIDARRAY_0100
     * @tc.desc   test AdsBlockManager.addAdsBlockAllowedList with valid non-empty array parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddAdsBlockAllowedListValidArray001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitAddAdsBlockAllowedListValidArray001', 181100);
      Utils.registerBaseEvent('testAddAdsBlockAllowedListValidArray001', true, 181140, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.clickComponent('adsBlockManagerAddAdsBlockAllowedListParamButton');
    })
  })
}
