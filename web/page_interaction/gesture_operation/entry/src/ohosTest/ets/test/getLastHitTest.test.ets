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
import { beforeAll, beforeEach, describe, it, expect, afterEach, TestType, Size, Level} from '@ohos/hypium';
import Utils from './Utils';
import router from '@ohos.router';
import webView from '@ohos.web.webview';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

const EVENT_ID_SET_SUITE_KEY = 181001;
const driver = Driver.create();

export default function HitTest() {

  describe('getLastHitTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/getLastHitTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get HitTest state success " + JSON.stringify(pages));
        if (!("HitTest" == pages.name)) {
          console.info("get HitTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await driver.waitForComponent(ON.id("webGetLastHitTest"), 10000);
          console.info("push HitTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push HitTest page error: " + err);
      }
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

    /**
     * @tc.name   getLastHitTest001
     * @tc.number getLastHitTest001
     * @tc.desc   test getLastHitTest001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getLastHitTest001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("getLastHitTest001", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("getLastHitTest001", true, 181010, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webGetLastHitTest", "getLastHitTest001");
      await Utils.waitForExist(() => isReturn, "webGetLastHitTest" + '_returnCheck', true, 1000);
      done();
    })

  })
}
