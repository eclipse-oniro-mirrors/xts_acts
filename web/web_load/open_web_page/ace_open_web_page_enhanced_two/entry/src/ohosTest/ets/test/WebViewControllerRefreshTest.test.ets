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

const EVENT_ID_SET_EMIT_KEY = 201160;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
export default function webViewControllerRefreshTest() {

  describe('WebViewControllerRefreshTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewControllerRefreshTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewControllerRefreshTest state success " + JSON.stringify(pages));
        if (!("WebViewControllerRefreshTest" == pages.name)) {
          console.info("get WebViewControllerRefreshTest state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          console.info("push WebViewControllerRefreshTest page success");
        }
      } catch (err) {
        console.error("push WebViewControllerRefreshTest page error: " + err);
      }
      await driver.waitForComponent(ON.id("WebViewControllerRefreshTestButton"), 10000);
      console.log("waitForComponent WebViewControllerRefreshTestButton");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("WebViewControllerRefreshTest beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_REFRESH_0200
    * @tc.name       : testRefresh002
    * @tc.desc       : test WebViewController.refresh
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testRefresh002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testRefresh002", EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testRefresh002", "second", 201170, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebViewControllerRefreshTestButton");
      if (await Utils.waitForExist(() => isReturn, 'testRefresh002' + '_returnCheck', true, 1000)) {
        done();
      }
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_REFRESH_0300
    * @tc.name       : testRefresh003
    * @tc.desc       : test WebViewController.refresh
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testRefresh003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testRefresh003", EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testRefresh003", true, 201180, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebViewControllerRefreshTestButton");
      if (await Utils.waitForExist(() => isReturn, 'testRefresh003' + '_returnCheck', true, 1000)) {
        done();
      }
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_REFRESH_0400
    * @tc.name       : testRefresh004
    * @tc.desc       : test WebViewController.refresh
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testRefresh004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testRefresh004", EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testRefresh004", 'second', 201190, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebViewControllerRefreshTestButton");
      if (await Utils.waitForExist(() => isReturn, 'testRefresh004' + '_returnCheck', true, 1000)) {
        done();
      }
    })
  })
}