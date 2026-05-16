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
import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Utils from '../../MainAbility/common/Utils';
import { Driver, ON } from '@ohos.UiTest';

export default function ToggleContentModifierNullTest() {
  describe('ToggleContentModifierNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ToggleContentModifierNullTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Toggle/ToggleContentModifierNullTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ToggleContentModifierNullTest state success " + JSON.stringify(pages));
        if (!("ToggleContentModifierNullTest" == pages.name)) {
          console.info("get ToggleContentModifierNullTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push ToggleContentModifierNullTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ToggleContentModifierNullTest page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("ToggleContentModifierNullTest after each called");
    });

    /**
     * @tc.name   ToggleContentModifierNull_001
     * @tc.number SUB_ARKUI_API_ToggleContentModifier_NULL_001
     * @tc.desc   Test Toggle.contentModifier with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ToggleContentModifierNull_001', Level.LEVEL1, async (done: Function) => {
      console.info('[ToggleContentModifierNull_001] START');
      await Utils.sleep(1000);

      let driver = Driver.create();
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('btn_contentModifier_null'));
      await button.click();
      await Utils.sleep(5000);

      let strJson = getInspectorByKey('contentModifier_test_result');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let resultText: string = JSON.stringify(obj.$attrs.content);

      console.info("[ToggleContentModifierNull_001] result: " + resultText);
      expect(resultText).assertContain('FAILED');
      console.info('[ToggleContentModifierNull_001] END');
      done();
    });

    /**
     * @tc.name   ToggleContentModifierUndefined_001
     * @tc.number SUB_ARKUI_API_ToggleContentModifier_UNDEFINED_001
     * @tc.desc   Test Toggle.contentModifier with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ToggleContentModifierUndefined_001', Level.LEVEL1, async (done: Function) => {
      console.info('[ToggleContentModifierUndefined_001] START');
      await Utils.sleep(1000);

      let driver = Driver.create();
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('btn_contentModifier_undefined'));
      await button.click();
      await Utils.sleep(5000);

      let strJson = getInspectorByKey('contentModifier_test_result');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let resultText: string = JSON.stringify(obj.$attrs.content);

      console.info("[ToggleContentModifierUndefined_001] result: " + resultText);
      expect(resultText).assertContain('FAILED');
      console.info('[ToggleContentModifierUndefined_001] END');
      done();
    });
  });
}
