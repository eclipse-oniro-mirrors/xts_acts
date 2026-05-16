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

export default function proxyConfigInsertBypassRuleParam() {

  describe('proxyConfigInsertBypassRuleParamTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/proxyConfigInsertBypassRuleParam',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get proxyConfigInsertBypassRuleParam state success ' + JSON.stringify(pages));
        if (!('proxyConfigInsertBypassRuleParam' == pages.name)) {
          console.info('get proxyConfigInsertBypassRuleParam state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push proxyConfigInsertBypassRuleParam page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push proxyConfigInsertBypassRuleParam page error: ' + err);
      }
      console.log('driver waitForComponent start==>');
      await driver.waitForComponent(ON.id('proxyConfigInsertBypassRuleParamButton'), 10000);
      console.log('waitForComponent proxyConfigInsertBypassRuleParamButton==>');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPABILITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('proxyConfigInsertBypassRuleParam beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('proxyConfigInsertBypassRuleParam afterEach start');
      done();
    })

    /**
     * @tc.name   testInsertBypassRuleEmptyString001
     * @tc.number SUB_WEB_PROXYCONFIG_INSERTBYPASSRULE_EMPTYSTRING_0100
     * @tc.desc   test ProxyConfig.insertBypassRule with empty string bypassRule parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInsertBypassRuleEmptyString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitInsertBypassRuleEmptyString001', 183000);
      Utils.registerBaseEvent('testInsertBypassRuleEmptyString001', 'success', 183010, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('proxyConfigInsertBypassRuleParamButton', 10, '');
    })

    /**
     * @tc.name   testInsertBypassRuleNull001
     * @tc.number SUB_WEB_PROXYCONFIG_INSERTBYPASSRULE_NULL_0100
     * @tc.desc   test ProxyConfig.insertBypassRule with null bypassRule parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInsertBypassRuleNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitInsertBypassRuleNull001', 183000);
      Utils.registerBaseEvent('testInsertBypassRuleNull001', '401', 183020, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('proxyConfigInsertBypassRuleParamButton', 10, '');
    })

    /**
     * @tc.name   testInsertBypassRuleUndefined001
     * @tc.number SUB_WEB_PROXYCONFIG_INSERTBYPASSRULE_UNDEFINED_0100
     * @tc.desc   test ProxyConfig.insertBypassRule with undefined bypassRule parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInsertBypassRuleUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitInsertBypassRuleUndefined001', 183000);
      Utils.registerBaseEvent('testInsertBypassRuleUndefined001', '401', 183030, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('proxyConfigInsertBypassRuleParamButton', 10, '');
    })
  })
}
