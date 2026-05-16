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

export default function ToggleSwitchPointColorNullTest() {
  describe('ToggleSwitchPointColorNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ToggleSwitchPointColorNullTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Toggle/ToggleSwitchPointColorNullTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ToggleSwitchPointColorNullTest state success " + JSON.stringify(pages));
        if (!("ToggleSwitchPointColorNullTest" == pages.name)) {
          console.info("get ToggleSwitchPointColorNullTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push ToggleSwitchPointColorNullTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ToggleSwitchPointColorNullTest page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("ToggleSwitchPointColorNullTest after each called");
    });

    /**
     * @tc.name   ToggleSwitchPointColorNull_001
     * @tc.number SUB_ARKUI_API_ToggleSwitchPointColor_NULL_001
     * @tc.desc   Test Toggle.switchPointColor with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ToggleSwitchPointColorNull_001', Level.LEVEL1, async (done: Function) => {
      console.info('[ToggleSwitchPointColorNull_001] START');
      await Utils.sleep(1000);

      let driver = Driver.create();
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('btn_switchPointColor_null'));
      await button.click();
      await Utils.sleep(5000);

      let strJson = getInspectorByKey('switchPointColor_test_result');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let resultText: string = JSON.stringify(obj.$attrs.content);

      console.info("[ToggleSwitchPointColorNull_001] result: " + resultText);
      expect(resultText).assertContain('FAILED');
      console.info('[ToggleSwitchPointColorNull_001] END');
      done();
    });

    /**
     * @tc.name   ToggleSwitchPointColorUndefined_001
     * @tc.number SUB_ARKUI_API_ToggleSwitchPointColor_UNDEFINED_001
     * @tc.desc   Test Toggle.switchPointColor with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ToggleSwitchPointColorUndefined_001', Level.LEVEL1, async (done: Function) => {
      console.info('[ToggleSwitchPointColorUndefined_001] START');
      await Utils.sleep(1000);

      let driver = Driver.create();
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('btn_switchPointColor_undefined'));
      await button.click();
      await Utils.sleep(5000);

      let strJson = getInspectorByKey('switchPointColor_test_result');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let resultText: string = JSON.stringify(obj.$attrs.content);

      console.info("[ToggleSwitchPointColorUndefined_001] result: " + resultText);
      expect(resultText).assertContain('FAILED');
      console.info('[ToggleSwitchPointColorUndefined_001] END');
      done();
    });
  });
}