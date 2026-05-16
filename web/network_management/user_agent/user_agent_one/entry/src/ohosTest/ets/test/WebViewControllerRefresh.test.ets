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

import { beforeAll, beforeEach, afterEach, describe, it, TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils.test';
import { Driver, ON } from '@kit.TestKit';
import events_emitter from '@ohos.events.emitter';
import { expect } from '@ohos/hypium';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webViewControllerRefresh() {

  describe('webViewControllerRefresh', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewControllerRefresh',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewControllerRefresh state success " + JSON.stringify(pages));
        if (!("WebViewControllerRefresh" == pages.name)) {
          console.info("get webViewControllerRefresh state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push webViewControllerRefresh page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewControllerRefresh page error: " + err);
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id("WebViewControllerRefreshButton"), 10000);
      console.log("waitForComponent WebViewControllerRefreshButton==>");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webViewControllerRefresh beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("webViewControllerRefresh afterEach start");
      done();
    })

    /**
     * @tc.name   testRefreshTrue
     * @tc.number SUB_ACE_WEB_WEBVIEWCONTROLLER_REFRESH_PARAM_0100
     * @tc.desc   test refresh with ignoreCache = true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRefreshTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitRefreshTrue', 174040);
      Utils.registerBaseEvent('testRefreshTrue', true, 174050, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebViewControllerRefreshButton', 10, '');
    })

    /**
     * @tc.name   testRefreshFalse
     * @tc.number SUB_ACE_WEB_WEBVIEWCONTROLLER_REFRESH_PARAM_0200
     * @tc.desc   test refresh with ignoreCache = false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRefreshFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitRefreshFalse', 174040);
      Utils.registerBaseEvent('testRefreshFalse', true, 174060, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebViewControllerRefreshButton', 10, '');
    })

    /**
     * @tc.name   testRefreshNull
     * @tc.number SUB_ACE_WEB_WEBVIEWCONTROLLER_REFRESH_ERROR_401_0100
     * @tc.desc   test refresh with ignoreCache = null - should throw error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRefreshNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitRefreshNull', 174040);
      Utils.registerBaseEvent('testRefreshNull', 'no_error', 174070, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebViewControllerRefreshButton', 10, '');
    })

    /**
     * @tc.name   testRefreshUndefined
     * @tc.number SUB_ACE_WEB_WEBVIEWCONTROLLER_REFRESH_ERROR_401_0200
     * @tc.desc   test refresh with ignoreCache = undefined - should throw error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRefreshUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitRefreshUndefined', 174040);
      Utils.registerBaseEvent('testRefreshUndefined', 'no_error', 174080, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebViewControllerRefreshButton', 10, '');
    })

    /**
     * @tc.name   testRefreshNoParam
     * @tc.number SUB_ACE_WEB_WEBVIEWCONTROLLER_REFRESH_PARAM_0500
     * @tc.desc   test refresh without parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRefreshNoParam', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitRefreshNoParam', 174040);
      Utils.registerBaseEvent('testRefreshNoParam', true, 174090, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebViewControllerRefreshButton', 10, '');
    })

    /**
     * @tc.name   testRefreshError17100001
     * @tc.number SUB_ACE_WEB_WEBVIEWCONTROLLER_REFRESH_ERROR_17100001_0100
     * @tc.desc   test refresh with error code 17100001 - WebviewController not associated with Web component
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRefreshError17100001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitRefreshError17100001', 174040);
      Utils.registerBaseEvent('testRefreshError17100001', '17100001', 174100, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebViewControllerRefreshButton', 10, '');
    })
  })
}
