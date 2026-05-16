/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import Utils from '../Utils';

export default function CommonModifierNullUndefinedTest() {
  describe('CommonModifierNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("CommonModifierNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/button/CommonModifierNullUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get CommonModifierNullUndefinedTest state pages: " + JSON.stringify(pages));
        if (!("gestureEventTest" == pages.name)) {
          console.info("get CommonModifierNullUndefinedTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push CommonModifierNullUndefinedTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CommonModifierNullUndefinedTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   CommonModifierNullUndefinedTest_0100
     * @tc.number CommonModifierNullUndefinedTest_0100
     * @tc.desc   Test drawModifier property with null, should be same as default (unset)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('CommonModifierNullUndefinedTest_0100', Level.LEVEL0, async () => {
      console.info('[CommonModifierNullUndefinedTest_0100] START');
      let driver = await Driver.create()
      await Utils.sleep(1000);
      let button1 = await driver.findComponent(ON.id('btn_commonModifier_null'));
      await button1.click();
      await Utils.sleep(1000);
      expect(AppStorage.get('CommonAttributeNullUndefined')).assertEqual(null);
      AppStorage.delete('CommonAttributeNullUndefined')
      console.info('[CommonModifierNullUndefinedTest_0100] END');
    })

    /**
     * @tc.name   CommonModifierNullUndefinedTest_0200
     * @tc.number CommonModifierNullUndefinedTest_0200
     * @tc.desc   Test drawModifier property with undefined, should be same as default (unset)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('CommonModifierNullUndefinedTest_0200', Level.LEVEL0, async () => {
      console.info('[CommonModifierNullUndefinedTest_0200] START');
      let driver = await Driver.create()
      await Utils.sleep(1000);
      let button1 = await driver.findComponent(ON.id('btn_commonModifier_undefined'));
      await button1.click();
      await Utils.sleep(1000);
      expect(AppStorage.get('CommonAttributeNullUndefined')).assertEqual(undefined);
      AppStorage.delete('CommonAttributeNullUndefined')
      console.info('[CommonModifierNullUndefinedTest_0200] END');
    })

  })
}
