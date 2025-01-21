/**
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function RichEditorMenuPolicyJsunit() {
  describe('RichEditorMenuPolicyJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorMenuPolicyJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorEnhance01/RichEditorMenuPolicy',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorMenuPolicyJsunit state pages:" + JSON.stringify(pages));
        if (!("RichEditorMenuPolicyJsunit" == pages.name)) {
          console.info("get RichEditorMenuPolicyJsunit pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          let driver = Driver.create();
          await driver.delayMs(2000)
          console.info("push RichEditorMenuPolicyJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorMenuPolicyJsunit page error:" + err);
      }
      console.info("RichEditorMenuPolicyJsunit beforeEach end");
      done();
    });

    afterEach(async () => {
      let driver = Driver.create();
      await driver.delayMs(1000)
      console.info("RichEditorMenuPolicyJsunit after each called");
    });

    /**
     * @tc.number RichEditorMenuPolicyJsunit_0100
     * @tc.name   RichEditorMenuPolicyJsunit_0100
     * @tc.desc   Test MenuPolicy is HIDE.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('RichEditorMenuPolicyJsunit_0100', 0, async (done: Function) => {
      console.info('[RichEditorMenuPolicyJsunit_0100] START');
      let driver = Driver.create();
      await driver.delayMs(1000)

      let DeButtonCon = await driver.findComponent(ON.id("RichEditorMenuPolicy_DEFAULT"));
      await DeButtonCon.click()
      await driver.delayMs(2000)

      let RichEditorMenuPolicyCon = await driver.findComponent(ON.id("RichEditorMenuPolicyCon"));
      await RichEditorMenuPolicyCon.click()
      await driver.delayMs(2000)

      await RichEditorMenuPolicyCon.longClick();
      await driver.delayMs(2000)
      let RichEditorPopCon = await driver.findComponent(ON.text("全选", MatchPattern.CONTAINS));
      expect(RichEditorPopCon == null).assertTrue()

      console.info('[RichEditorMenuPolicyJsunit_0100] END');
      done();
    });

    /**
     * @tc.number RichEditorMenuPolicyJsunit_0200
     * @tc.name   RichEditorMenuPolicyJsunit_0200
     * @tc.desc   Test MenuPolicy is SHOW.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('RichEditorMenuPolicyJsunit_0200', 0, async (done: Function) => {
      console.info('[RichEditorMenuPolicyJsunit_0200] START');
      let driver = Driver.create();
      await driver.delayMs(1000)

      let DeButtonCon = await driver.findComponent(ON.id("RichEditorMenuPolicy_DEFAULT"));
      await DeButtonCon.click()
      await driver.delayMs(2000)

      let NeButtonCon = await driver.findComponent(ON.id("RichEditorMenuPolicy_HIDE"));
      await NeButtonCon.click()
      await driver.delayMs(2000)

      let RichEditorMenuPolicyCon = await driver.findComponent(ON.id("RichEditorMenuPolicyCon"));
      await driver.delayMs(2000)

      await RichEditorMenuPolicyCon.longClick();
      await driver.delayMs(2000)
      let RichEditorCon = await driver.findComponent(ON.text("剪切", MatchPattern.CONTAINS));
      expect(RichEditorCon != null).assertTrue()

      console.info('[RichEditorMenuPolicyJsunit_0200] END');
      done();
    });
  })
}