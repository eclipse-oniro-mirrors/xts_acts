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
import json from '@ohos.util.json';
import { waitForExist } from './WaitTest.test';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

const driver = Driver.create();
export default function webViewControllerRemoveCacheTest() {

  describe('WebViewControllerRemoveCacheTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewControllerRemoveCacheTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewControllerRemoveCacheTest state success " + JSON.stringify(pages));
        if (!("WebViewControllerRemoveCacheTest" == pages.name)) {
          console.info("get WebViewControllerRemoveCacheTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebViewControllerRemoveCacheTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewControllerRemoveCacheTest page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("WebViewControllerRemoveCacheTest beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_REMOVECACHE_0100
    * @tc.name       : testRemoveCache001
    * @tc.desc       : test removeCache true
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testRemoveCache001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testRemoveCache001", 148411)
      let isReturn = false;
      Utils.registerEvent("testRemoveCache001", true, 148450, ()=>{isReturn = true});
      Utils.waitAndClickComponent('WebViewControllerRemoveCacheTestButton',driver)
      await waitForExist(() => isReturn, "testRemoveCache001", true, 1000);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_REMOVECACHE_0200
    * @tc.name       : testRemoveCache002
    * @tc.desc       : test removeCache false
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testRemoveCache002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testRemoveCache002", 148411)
      Utils.registerEvent("testRemoveCache002", true, 148460, ()=>{isReturn = true});
      let isReturn = false;
      Utils.waitAndClickComponent('WebViewControllerRemoveCacheTestButton',driver)
      await waitForExist(() => isReturn, "testRemoveCache002", true, 1000);
      done();
    })
  })
}
