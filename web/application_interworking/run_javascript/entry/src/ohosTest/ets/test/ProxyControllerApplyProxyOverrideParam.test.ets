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

export default function proxyControllerApplyProxyOverrideParam() {

  describe('proxyControllerApplyProxyOverrideParamTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/proxyControllerApplyProxyOverrideParam',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get proxyControllerApplyProxyOverrideParam state success ' + JSON.stringify(pages));
        if (!('proxyControllerApplyProxyOverrideParam' == pages.name)) {
          console.info('get proxyControllerApplyProxyOverrideParam state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push proxyControllerApplyProxyOverrideParam page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push proxyControllerApplyProxyOverrideParam page error: ' + err);
      }
      console.log('driver waitForComponent start==>');
      await driver.waitForComponent(ON.id('proxyControllerApplyProxyOverrideParamButton'), 10000);
      console.log('waitForComponent proxyControllerApplyProxyOverrideParamButton==>');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPABILITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('proxyControllerApplyProxyOverrideParam beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('proxyControllerApplyProxyOverrideParam afterEach start');
      done();
    })

    /**
     * @tc.name   testApplyProxyOverrideNull001
     * @tc.number SUB_WEB_PROXYCONTROLLER_APPLYPROXYOVERRIDE_NULL_0100
     * @tc.desc   test ProxyController.applyProxyOverride with null proxyConfig parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApplyProxyOverrideNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitApplyProxyOverrideNull001', 184000);
      Utils.registerBaseEvent('testApplyProxyOverrideNull001', 'success', 184010, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('proxyControllerApplyProxyOverrideParamButton', 10, '');
    })

    /**
     * @tc.name   testApplyProxyOverrideUndefined001
     * @tc.number SUB_WEB_PROXYCONTROLLER_APPLYPROXYOVERRIDE_UNDEFINED_0100
     * @tc.desc   test ProxyController.applyProxyOverride with undefined proxyConfig parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApplyProxyOverrideUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitApplyProxyOverrideUndefined001', 184000);
      Utils.registerBaseEvent('testApplyProxyOverrideUndefined001', 'success', 184020, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('proxyControllerApplyProxyOverrideParamButton', 10, '');
    })
  })
}
