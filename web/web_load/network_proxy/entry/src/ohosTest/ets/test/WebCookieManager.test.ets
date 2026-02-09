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
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const EVENT_ID_SET_EMIT_KEY = 200010;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
export default function webCookieManager() {

  describe('WebCookieManagerTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webCookieManager',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webCookieManager state success " + JSON.stringify(pages));
        if (!("webCookieManager" == pages.name)) {
          console.info("get webCookieManager state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          console.info("push webCookieManager page success");
        }
      } catch (err) {
        console.error("push webCookieManager page error: " + err);
      }
      await driver.waitForComponent(ON.id("WebCookieManagerButton"), 10000);
      console.log("waitForComponent WebCookieManagerButton");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webCookieManager beforeEach start");
      done();
    })


    /**
     * @tc.name   testSaveCookieSync001
     * @tc.number SUB_WEB_SAVECOOKIESYNC_0100
     * @tc.desc   test saveCookieSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSaveCookieSync001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testSaveCookieSync001', EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent('testSaveCookieSync001', 'success', 200020, done);
      await Utils.waitAndClickComponent(driver, "WebCookieManagerButton");
    })

    /**
     * @tc.name   testRemoveAllCache001
     * @tc.number SUB_WEB_REMOVEALLCACHE_0100
     * @tc.desc   test removeAllCache
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRemoveAllCache001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testRemoveAllCache001', EVENT_ID_SET_EMIT_KEY)
      Utils.registerEvent('testRemoveAllCache001', 'success', 200030, done);
      await Utils.waitAndClickComponent(driver, "WebCookieManagerButton");
    })
  })
}