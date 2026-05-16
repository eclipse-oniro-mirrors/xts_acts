/**
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

import { afterEach, beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import router from '@ohos.router';
import { waitForComponent } from './WaitTest.test';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webOnBeforeUnload() {
  describe('WebOnBeforeUnloadTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebOnBeforeUnload',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebOnBeforeUnload state success " + JSON.stringify(pages));
        if (!("WebOnBeforeUnload" == pages.name)) {
          console.info("get WebOnBeforeUnload state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebOnBeforeUnload page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebOnBeforeUnload page error: " + err);
      }
      await waitForComponent("webOnBeforeUnload");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("web beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebOnBeforeUnloadTest afterEach start");
      console.info("WebOnBeforeUnloadTest afterEach end");
      done();
    })

    /**
     * @tc.name   testOnBeforeUnload001
     * @tc.number SUB_WEB_ONBEFOREUNLOAD_0100
     * @tc.desc   test OnBeforeUnload when refresh
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnBeforeUnload001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitOnBeforeUnload001", 134000)
      Utils.registerEvent("testOnBeforeUnload001", "resource://rawfile/onBeforeUnloadTest.html", 134010, done);
      Utils.registerEvent("testOnBeforeUnload001", true, 134020, done);
      sendEventByKey('webOnBeforeUnload', 10, '');
    })

    /**
     * @tc.name   testOnBeforeUnload002
     * @tc.number SUB_WEB_ONBEFOREUNLOAD_0200
     * @tc.desc   test OnBeforeUnload when loadUrl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOnBeforeUnload002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitOnBeforeUnload002", 134000)
      Utils.registerEvent("testOnBeforeUnload002", "resource://rawfile/onBeforeUnloadTest.html", 134030, done);
      Utils.registerEvent("testOnBeforeUnload002", true, 134040, done);
      sendEventByKey('webOnBeforeUnload', 10, '');
    })
  })
}