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

import { beforeAll, beforeEach, expect, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import events_emitter from '@ohos.events.emitter';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const EVENT_ID_SET_EMIT_KEY = 200040;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
export default function webviewNetworkProxy() {

  describe('webviewNetworkProxyTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webviewNetworkProxy',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webviewNetworkProxy state success ' + JSON.stringify(pages));
        if (!('webviewNetworkProxy' == pages.name)) {
          console.info('get webviewNetworkProxy state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push webviewNetworkProxy page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webviewNetworkProxy page error: ' + err);
      }
      await driver.waitForComponent(ON.id("networkProxyButton"), 10000);
      console.log("waitForComponent networkProxyButton");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('webviewNetworkProxy beforeEach start');
      done();
    })
    /**
     * @tc.name   testGetProxyRulesEmpty
     * @tc.number SUB_WEB_NETWORKPROXY_GETPROXYRULES_EMPTY_0100
     * @tc.desc   test getProxyRules empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetProxyRulesEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitGetProxyRulesEmpty', EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("testGetProxyRulesEmpty", true, 2025102101,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, "networkProxyButton");
    })
    /**
     * @tc.name   testGetBypassRulesEmpty
     * @tc.number SUB_WEB_NETWORKPROXY_GETBYPASSRULES_EMPTY_0100
     * @tc.desc   test getBypassRules empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetBypassRulesEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitGetBypassRulesEmpty', EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("testGetBypassRulesEmpty", true, 2025102102,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, "networkProxyButton");
    })


    /**
     * @tc.name   testNetworkProxySchemeFilterMatchAllSchemes
     * @tc.number SUB_WEB_NETWORKPROXY_0100
     * @tc.desc   test ProxySchemeFilter MATCH_ALL_SCHEMES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkProxySchemeFilterMatchAllSchemes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('testNetworkProxySchemeFilterMatchAllSchemes', EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent('testNetworkProxySchemeFilterMatchAllSchemes', true, 200050, done);
      await Utils.waitAndClickComponent(driver, "networkProxyButton");
    })
    /**
     * @tc.name   testNetworkProxySchemeFilterMatchHttp
     * @tc.number SUB_WEB_NETWORKPROXY_0200
     * @tc.desc   test ProxySchemeFilter MATCH_HTTP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkProxySchemeFilterMatchHttp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testNetworkProxySchemeFilterMatchHttp', EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent('testNetworkProxySchemeFilterMatchHttp', true, 200060, done);
      await Utils.waitAndClickComponent(driver, "networkProxyButton");
    })
    /**
     * @tc.name   testNetworkProxySchemeFilterMatchHttps
     * @tc.number SUB_WEB_NETWORKPROXY_0300
     * @tc.desc   test ProxySchemeFilter MATCH_HTTPS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkProxySchemeFilterMatchHttps', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testNetworkProxySchemeFilterMatchHttps', EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent('testNetworkProxySchemeFilterMatchHttps', true, 200070, done);
      await Utils.waitAndClickComponent(driver, "networkProxyButton");
    })
    /**
     * @tc.name   testInsertProxyRule
     * @tc.number SUB_WEB_NETWORKPROXY_0400
     * @tc.desc   test insertProxyRule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInsertProxyRule', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testInsertProxyRule', EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent('testInsertProxyRule', true, 200080, done);
      await Utils.waitAndClickComponent(driver, "networkProxyButton");
    })
    /**
     * @tc.name   testInsertDirectRule
     * @tc.number SUB_WEB_NETWORKPROXY_0500
     * @tc.desc   test insertDirectRule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInsertDirectRule', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testInsertDirectRule', EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent('testInsertDirectRule', true, 200090, done);
      await Utils.waitAndClickComponent(driver, "networkProxyButton");
    })
    /**
     * @tc.name   testInsertBypassRule
     * @tc.number SUB_WEB_NETWORKPROXY_0600
     * @tc.desc   test insertBypassRule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInsertBypassRule', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testInsertBypassRule', EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent('testInsertBypassRule', true, 200100, done);
      await Utils.waitAndClickComponent(driver, "networkProxyButton");
    })
    /**
     * @tc.name   testBypassHostnamesWithoutPeriod
     * @tc.number SUB_WEB_NETWORKPROXY_0700
     * @tc.desc   test bypassHostnamesWithoutPeriod
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBypassHostnamesWithoutPeriod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testBypassHostnamesWithoutPeriod', EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent('testBypassHostnamesWithoutPeriod', true, 200110, done);
      await Utils.waitAndClickComponent(driver, "networkProxyButton");
    })
    /**
     * @tc.name   testClearImplicitRules
     * @tc.number SUB_WEB_NETWORKPROXY_0800
     * @tc.desc   test clearImplicitRules
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testClearImplicitRules', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testClearImplicitRules', EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent('testClearImplicitRules', true, 200120, done);
      await Utils.waitAndClickComponent(driver, "networkProxyButton");
    })
    /**
     * @tc.name   testEnableReverseBypass
     * @tc.number SUB_WEB_NETWORKPROXY_0900
     * @tc.desc   test enableReverseBypass
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEnableReverseBypass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testEnableReverseBypass', EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent('testEnableReverseBypass', true, 200130, done);
      await Utils.waitAndClickComponent(driver, "networkProxyButton");
    })
    /**
     * @tc.name   testGetBypassRules
     * @tc.number SUB_WEB_NETWORKPROXY_1000
     * @tc.desc   test getBypassRules
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetBypassRules', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testGetBypassRules', EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent('testGetBypassRules', true, 200140, done);
      await Utils.waitAndClickComponent(driver, "networkProxyButton");
    })
    /**
     * @tc.name   testGetProxyRules
     * @tc.number SUB_WEB_NETWORKPROXY_1100
     * @tc.desc   test getProxyRules
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetProxyRules', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testGetProxyRules', EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent('testGetProxyRules', true, 200150, done);
      await Utils.waitAndClickComponent(driver, "networkProxyButton");
    })
    /**
     * @tc.name   testIsReverseBypassEnabled
     * @tc.number SUB_WEB_NETWORKPROXY_1200
     * @tc.desc   test isReverseBypassEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsReverseBypassEnabled', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testIsReverseBypassEnabled', EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent('testIsReverseBypassEnabled', false, 200160, done);
      await Utils.waitAndClickComponent(driver, "networkProxyButton");
    })
    /**
     * @tc.name   testGetSchemeFilter
     * @tc.number SUB_WEB_NETWORKPROXY_1300
     * @tc.desc   test getSchemeFilter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetSchemeFilter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testGetSchemeFilter', EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent('testGetSchemeFilter', true, 200170, done);
      await Utils.waitAndClickComponent(driver, "networkProxyButton");
    })
    /**
     * @tc.name   testProxyGetUrl
     * @tc.number SUB_WEB_NETWORKPROXY_1300
     * @tc.desc   test getUrl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProxyGetUrl', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testProxyGetUrl', EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent('testProxyGetUrl', true, 200180, done);
      await Utils.waitAndClickComponent(driver, "networkProxyButton");
    })
    /**
     * @tc.name   testApplyProxyOverride
     * @tc.number SUB_WEB_NETWORKPROXY_1500
     * @tc.desc   test applyProxyOverride
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApplyProxyOverride', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testApplyProxyOverride', EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent('testApplyProxyOverride', true, 200190, done);
      await Utils.waitAndClickComponent(driver, "networkProxyButton");
    })
    /**
     * @tc.name   testRemoveProxyOverride
     * @tc.number SUB_WEB_NETWORKPROXY_1600
     * @tc.desc   test removeProxyOverride
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRemoveProxyOverride', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testRemoveProxyOverride', EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent('testRemoveProxyOverride', true, 200200, done);
      await Utils.waitAndClickComponent(driver, "networkProxyButton");
    })
  })
}