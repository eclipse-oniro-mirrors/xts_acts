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

export default function adsBlockManagerSetAdsBlockRulesParam() {

  describe('adsBlockManagerSetAdsBlockRulesParamTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/adsBlockManagerSetAdsBlockRulesParam',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get adsBlockManagerSetAdsBlockRulesParam state success ' + JSON.stringify(pages));
        if (!('adsBlockManagerSetAdsBlockRulesParam' == pages.name)) {
          console.info('get adsBlockManagerSetAdsBlockRulesParam state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push adsBlockManagerSetAdsBlockRulesParam page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push adsBlockManagerSetAdsBlockRulesParam page error: ' + err);
      }
      console.log('driver waitForComponent start==>');
      await driver.waitForComponent(ON.id('adsBlockManagerSetAdsBlockRulesParamButton'), 10000);
      console.log('waitForComponent adsBlockManagerSetAdsBlockRulesParamButton==>');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPABILITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('adsBlockManagerSetAdsBlockRulesParam beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('adsBlockManagerSetAdsBlockRulesParam afterEach start');
      done();
    })

    /**
     * @tc.name   testSetAdsBlockRulesEmptyString001
     * @tc.number SUB_WEB_ADSBLOCKMANAGER_SETADSBLOCKRULES_EMPTYSTRING_0100
     * @tc.desc   test AdsBlockManager.setAdsBlockRules with empty string rulesFile parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetAdsBlockRulesEmptyString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetAdsBlockRulesEmptyString001', 180000);
      Utils.registerBaseEvent('testSetAdsBlockRulesEmptyString001', true, 180010, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('adsBlockManagerSetAdsBlockRulesParamButton', 10, '');
    })

    /**
     * @tc.name   testSetAdsBlockRulesNull001
     * @tc.number SUB_WEB_ADSBLOCKMANAGER_SETADSBLOCKRULES_NULL_0100
     * @tc.desc   test AdsBlockManager.setAdsBlockRules with null rulesFile parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetAdsBlockRulesNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetAdsBlockRulesNull001', 180000);
      Utils.registerBaseEvent('testSetAdsBlockRulesNull001', true, 180020, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('adsBlockManagerSetAdsBlockRulesParamButton', 10, '');
    })

    /**
     * @tc.name   testSetAdsBlockRulesUndefined001
     * @tc.number SUB_WEB_ADSBLOCKMANAGER_SETADSBLOCKRULES_UNDEFINED_0100
     * @tc.desc   test AdsBlockManager.setAdsBlockRules with undefined rulesFile parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetAdsBlockRulesUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetAdsBlockRulesUndefined001', 180000);
      Utils.registerBaseEvent('testSetAdsBlockRulesUndefined001', true, 180030, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('adsBlockManagerSetAdsBlockRulesParamButton', 10, '');
    })

    /**
     * @tc.name   testSetAdsBlockRulesReplaceFalse001
     * @tc.number SUB_WEB_ADSBLOCKMANAGER_SETADSBLOCKRULES_REPLACEFALSE_0100
     * @tc.desc   test AdsBlockManager.setAdsBlockRules with replace parameter set to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetAdsBlockRulesReplaceFalse001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetAdsBlockRulesReplaceFalse001', 180000);
      Utils.registerBaseEvent('testSetAdsBlockRulesReplaceFalse001', true, 180040, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('adsBlockManagerSetAdsBlockRulesParamButton', 10, '');
    })
  })
}
