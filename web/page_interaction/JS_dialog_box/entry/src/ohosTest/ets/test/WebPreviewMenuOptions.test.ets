/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

const EVENT_ID_SET_SUITE_KEY = 177501;
let driver = Driver.create();

export default function WebPreviewMenuOptions() {

  describe('WebPreviewMenuOptionsTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebPreviewMenuOptions',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebPreviewMenuOptions state success " + JSON.stringify(pages));
        if (!("WebPreviewMenuOptions" == pages.name)) {
          console.info("get WebPreviewMenuOptions state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await driver.waitForComponent(ON.id("WebHapticFeedbackButton"), 10000);
          console.info("push WebPreviewMenuOptions page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebPreviewMenuOptions page error: " + err);
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
     * @tc.name   WebHapticFeedback001
     * @tc.number SUB_WEB_WEBHAPTICFEEDBACK_0100
     * @tc.desc   test WebHapticFeedback001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WebHapticFeedback001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebHapticFeedback001", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("bindSelectionMenuType01", 'HapticFeedbackMode.DISABLED', 177510, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, 'WebHapticFeedbackButton', "WebHapticFeedback001");
      await Utils.waitForExist(() => isReturn, "WebHapticFeedback001" + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   WebHapticFeedback002
     * @tc.number SUB_WEB_WEBHAPTICFEEDBACK_0200
     * @tc.desc   test WebHapticFeedback002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WebHapticFeedback002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebHapticFeedback002", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("WebHapticFeedback002", 'HapticFeedbackMode.ENABLED', 177520, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebHapticFeedbackButton", "WebHapticFeedback002");
      await Utils.waitForExist(() => isReturn, "WebHapticFeedback002" + '_returnCheck', true, 1000);
      done();
    })


    /**
     * @tc.name   WebHapticFeedback003
     * @tc.number SUB_WEB_WEBHAPTICFEEDBACK_0300
     * @tc.desc   test WebHapticFeedback003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WebHapticFeedback003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebHapticFeedback003", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("WebHapticFeedback003", 'HapticFeedbackMode.AUTO', 177530, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebHapticFeedbackButton", "WebHapticFeedback003");
      await Utils.waitForExist(() => isReturn, "WebHapticFeedback003" + '_returnCheck', true, 1000);
      done();
    })


  })
}
