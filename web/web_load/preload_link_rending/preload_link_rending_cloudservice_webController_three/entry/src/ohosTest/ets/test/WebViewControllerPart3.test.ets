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

const EVENT_ID_SET_EMIT_KEY = 201330;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webViewControllerPart3Test() {

  describe('WebViewControllerPart3', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewControllerPart3',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewControllerPart3 state success " + JSON.stringify(pages));
        if (!("WebViewControllerPart3" == pages.name)) {
          console.info("get WebViewControllerPart3 state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          console.info("push WebViewControllerPart3 page success");
        }
      } catch (err) {
        console.error("push WebViewControllerPart3 page error: " + err);
      }
      await driver.waitForComponent(ON.id("WebViewControllerTestButton"), 10000);
      console.log("waitForComponent WebViewControllerTestButton");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("WebViewControllerPart3 beforeEach start");
      done();
    })

    /**
     * @tc.name   testPrefetchPage001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_PREFETCHPAGE_0100
     * @tc.desc   test prefetchPage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPrefetchPage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testPrefetchPage001", EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testPrefetchPage001", true, 201340, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebViewControllerTestButton");
      if (await Utils.waitForExist(() => isReturn, 'testPrefetchPage001' + '_returnCheck', true, 3000)) {
        done();
      }
    })
  })
}