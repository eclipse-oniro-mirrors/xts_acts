/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const driver: Driver = Driver.create();

export default function componentLifeCycleTestOne() {
  describe('componentLifeCycleTestOne', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/componentLifeCycleTestOne',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get componentLifeCycleTestOne state success ' + JSON.stringify(pages));
        if (!('componentLifeCycleTestOne' == pages.name)) {
          console.info('get componentLifeCycleTestOne state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push componentLifeCycleTestOne page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push componentLifeCycleTestOne page error: ' + err);
      }
      await driver.waitForComponent(ON.id("HttpAuthHandlerButton"), 10000);
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('componentLifeCycleTestOne beforeEach start');
      done();
    })

    /**
     * @tc.name   onRenderExited
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_004
     * @tc.desc   onRenderExited
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onRenderExited', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitOnRenderExited', 138100)
      Utils.registerEvent('onRenderExited', 2, 138110, done);
      await Utils.waitAndClickComponent(driver, 'HttpAuthHandlerButton', 'emitOnRenderExited');
    })

    /**
     * @tc.name   onInactive
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_007
     * @tc.desc   onInactive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onInactive', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitonInactive', 138100)
      Utils.registerEvent('onInactive', 'index', 138120, done);
      await Utils.waitAndClickComponent(driver, 'HttpAuthHandlerButton', 'emitonInactive');
    })

    /**
     * @tc.name   onActive
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_008
     * @tc.desc   onActive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onActive', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitonActive', 138100)
      Utils.registerEvent('onActive', 'index', 138130, done);
      await Utils.waitAndClickComponent(driver, 'HttpAuthHandlerButton', 'emitonActive');
    })

    /**
     * @tc.name   testOnActiveInitErr
     * @tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_2000
     * @tc.desc   test interface of onActive with not been associated with specific Web Components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnActiveInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitOnActiveInitErr', 138100)
      Utils.registerEvent('testOnActiveInitErr', '17100001', 138140, done);
      await Utils.waitAndClickComponent(driver, 'HttpAuthHandlerButton', 'emitOnActiveInitErr');
    })

    /**
     * @tc.name   testOnInactiveInitErr
     * @tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_2100
     * @tc.desc   test interface of onInactive with not been associated with specific Web Components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnInactiveInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitOnInactiveInitErr', 138100)
      Utils.registerEvent('testOnInactiveInitErr', '17100001', 138150, done);
      await Utils.waitAndClickComponent(driver, 'HttpAuthHandlerButton', 'emitOnInactiveInitErr');
    })

    /**
     * @tc.name   testOnInactive001
     * @tc.number SUB_WEB_ONINACTIVE_0100
     * @tc.desc   test onInactive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnInactive001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('testOnInactive001', 138100)
      Utils.registerEvent('testOnInactive001', true, 138160, done);
      await Utils.waitAndClickComponent(driver, 'HttpAuthHandlerButton', 'testOnInactive001');
    })

    /**
     * @tc.name   testOnActive001
     * @tc.number SUB_WEB_ONACTIVE_0100
     * @tc.desc   test onActive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnActive001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('testOnActive001', 138100)
      Utils.registerEvent('testOnActive001', 'resource://rawfile/webPart1index.html', 138170, done);
      await Utils.waitAndClickComponent(driver, 'HttpAuthHandlerButton', 'testOnActive001');
    })

    /**
     * @tc.name   testOnInactive002
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_ONINACTIVE_0100
     * @tc.desc   test onInactive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnInactive002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('testOnInactive002', 138100)
      Utils.registerEvent('testOnInactive002', 'second', 138180, done);
      await Utils.waitAndClickComponent(driver, 'HttpAuthHandlerButton', 'testOnInactive002');
    })

    /**
     * @tc.name   testOnActive002
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_ONACTIVE_0100
     * @tc.desc   test onActive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnActive002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('testOnActive002', 138100)
      Utils.registerEvent('testOnActive002', 'second', 138190, done);
      await Utils.waitAndClickComponent(driver, 'HttpAuthHandlerButton', 'testOnActive002');
    })

    /**
     * @tc.name   testOnControllerAttached001
     * @tc.number SUB_WEB_ONCONTROLLERATTACHED_0100
     * @tc.desc   test onControllerAttached
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnControllerAttached001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitOnControllerAttached', 138100)
      Utils.registerEvent('testOnControllerAttached001', true, 138200, done);
      await Utils.waitAndClickComponent(driver, 'HttpAuthHandlerButton', 'emitOnControllerAttached');
    })

    /**
     * @tc.name   testWebViewSetRenderProcessMode
     * @tc.number SUB_ACE_WEB_SETRENDERPROCESSMODE_API_0500
     * @tc.desc   test setRenderProcessMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSetRenderProcessMode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        Utils.emitEvent('emitSetRenderProcessMode', 138100)
        Utils.registerEvent('emitSetRenderProcessMode', true, 138210, done);
        await Utils.waitAndClickComponent(driver, 'HttpAuthHandlerButton', 'emitSetRenderProcessMode');
      })

    /**
     * @tc.name   testWebViewGetAndSetRenderProcessMode01
     * @tc.number SUB_ACE_WEB_GETAndSetRENDERPROCESSMODE_API_0001
     * @tc.desc   test getRenderProcessMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewGetAndSetRenderProcessMode01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        Utils.emitEvent('emitWebViewGetAndSetRenderProcessMode01', 138100);
        Utils.registerEvent('testWebViewGetAndSetRenderProcessMode01', 'success', 138220, done);
        await Utils.waitAndClickComponent(driver, 'HttpAuthHandlerButton', 'emitWebViewGetAndSetRenderProcessMode01');
      })
    /**
     * @tc.name   testWebViewGetAndSetRenderProcessMode02
     * @tc.number SUB_ACE_WEB_GETAndSetRENDERPROCESSMODE_API_0002
     * @tc.desc   test setRenderProcessMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewGetAndSetRenderProcessMode02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        Utils.emitEvent('emitWebViewGetAndSetRenderProcessMode02', 138100);
        Utils.registerEvent('testWebViewGetAndSetRenderProcessMode02', 'success', 138230, done);
        await Utils.waitAndClickComponent(driver, 'HttpAuthHandlerButton', 'emitWebViewGetAndSetRenderProcessMode02');
      })

    /**
     * @tc.name   testWebViewOnRenderProcessResponding
     * @tc.number SUB_ACE_WEB_OnRenderProcessResponding_API_0001
     * @tc.desc   OnRenderProcessResponding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewOnRenderProcessResponding', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        Utils.emitEvent('emitWebViewOnRenderProcessResponding', 138100);
        Utils.registerEvent('testWebViewOnRenderProcessResponding', true, 138240, done);
        await Utils.waitAndClickComponent(driver, 'HttpAuthHandlerButton', 'emitWebViewOnRenderProcessResponding');
      })

    /**
     * @tc.name   testWebViewNotRespondingReason_NAVIGATION_COMMIT_TIMEOUT
     * @tc.number SUB_ACE_WEB_NotRespondingReason_NAVIGATION_COMMIT_TIMEOUT_API_0002
     * @tc.desc   NotRespondingReason_NAVIGATION_COMMIT_TIMEOUT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewNotRespondingReason_NAVIGATION_COMMIT_TIMEOUT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        Utils.emitEvent('emitWebViewNotRespondingReason_NAVIGATION_COMMIT_TIMEOUT', 138100);
        Utils.registerEvent('testWebViewNotRespondingReason_NAVIGATION_COMMIT_TIMEOUT', true, 138250, done);
        await Utils.waitAndClickComponent(driver, 'HttpAuthHandlerButton',
          'emitWebViewNotRespondingReason_NAVIGATION_COMMIT_TIMEOUT');
      })
  })
}
