/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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
import { describe, beforeEach, it, beforeAll, TestType, Size, Level } from "@ohos/hypium";
import Utils from './Utils.test';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const EVENT_ID_SET_EMIT_KEY = 111120;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

let emitKey = "";

export default function webViewWebViewErrorCode() {
  describe('ActsAceWebViewErrorCodeTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewErrorCode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewErrorCode state success " + JSON.stringify(pages));
        if (!("WebViewErrorCode" == pages.name)) {
          console.info("get webViewErrorCode state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push webViewErrorCode page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewErrorCode page error: " + err);
      }
      await driver.waitForComponent(ON.id("webViewOthersErrorCode"), 10000);
      console.log("waitForComponent webViewOthersErrorCode");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webViewOthersErrorCode beforeEach start");
      done();
    })

    /**
     * @tc.name   emitGetPageOffsetErrorCode
     * @tc.number SUB_ACE_BASIC_ETS_GETPAGEOFFSETERRORCODE_0100
     * @tc.desc   emitGetPageOffsetErrorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitGetPageOffsetErrorCode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitGetPageOffsetErrorCode";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("emitGetPageOffsetErrorCode", "801", 20250907, null);
      Utils.registerEvent("emitGetPageOffsetErrorCode", "Capability not supported", 20250908, done);
      await Utils.waitAndClickComponent(driver, "webViewOthersErrorCode");
    })

    /**
     * @tc.name   emitAvoidVisibleViewportBottomErrorCode
     * @tc.number SUB_ACE_BASIC_ETS_AVOIDVISIBLEVIEWPORTBOTTOMERRORCODE_0200
     * @tc.desc   emitAvoidVisibleViewportBottomErrorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitAvoidVisibleViewportBottomErrorCode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitAvoidVisibleViewportBottomErrorCode";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("emitAvoidVisibleViewportBottomErrorCode", "801", 20250910, null);
      Utils.registerEvent("emitAvoidVisibleViewportBottomErrorCode", "Capability not supported", 20250911, done);
      await Utils.waitAndClickComponent(driver, "webViewOthersErrorCode");
    })



  })
}