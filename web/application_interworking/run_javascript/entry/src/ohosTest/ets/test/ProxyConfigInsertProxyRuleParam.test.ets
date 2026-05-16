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

export default function proxyConfigInsertProxyRuleParam() {

  describe('proxyConfigInsertProxyRuleParamTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/proxyConfigInsertProxyRuleParam',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get proxyConfigInsertProxyRuleParam state success ' + JSON.stringify(pages));
        if (!('proxyConfigInsertProxyRuleParam' == pages.name)) {
          console.info('get proxyConfigInsertProxyRuleParam state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push proxyConfigInsertProxyRuleParam page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push proxyConfigInsertProxyRuleParam page error: ' + err);
      }
      console.log('driver waitForComponent start==>');
      await driver.waitForComponent(ON.id('proxyConfigInsertProxyRuleParamButton'), 10000);
      console.log('waitForComponent proxyConfigInsertProxyRuleParamButton==>');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPABILITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('proxyConfigInsertProxyRuleParam beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('proxyConfigInsertProxyRuleParam afterEach start');
      done();
    })

    /**
     * @tc.name   testProxyConfigInsertProxyRuleEmptyString001
     * @tc.number SUB_WEB_PROXYCONFIG_INSERTPROXYRULE_EMPTYSTRING_0100
     * @tc.desc   test ProxyConfig.insertProxyRule with empty string proxyRule parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProxyConfigInsertProxyRuleEmptyString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitProxyConfigInsertProxyRuleEmptyString001', 174600);
      Utils.registerBaseEvent('testProxyConfigInsertProxyRuleEmptyString001', 'success', 174610, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('proxyConfigInsertProxyRuleParamButton', 10, '');
    })

    /**
     * @tc.name   testProxyConfigInsertProxyRuleNull001
     * @tc.number SUB_WEB_PROXYCONFIG_INSERTPROXYRULE_NULL_0100
     * @tc.desc   test ProxyConfig.insertProxyRule with null proxyRule parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProxyConfigInsertProxyRuleNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitProxyConfigInsertProxyRuleNull001', 174600);
      Utils.registerBaseEvent('testProxyConfigInsertProxyRuleNull001', '401', 174620, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('proxyConfigInsertProxyRuleParamButton', 10, '');
    })

    /**
     * @tc.name   testProxyConfigInsertProxyRuleUndefined001
     * @tc.number SUB_WEB_PROXYCONFIG_INSERTPROXYRULE_UNDEFINED_0100
     * @tc.desc   test ProxyConfig.insertProxyRule with undefined proxyRule parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProxyConfigInsertProxyRuleUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitProxyConfigInsertProxyRuleUndefined001', 174600);
      Utils.registerBaseEvent('testProxyConfigInsertProxyRuleUndefined001', '401', 174630, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('proxyConfigInsertProxyRuleParamButton', 10, '');
    })
  })
}
