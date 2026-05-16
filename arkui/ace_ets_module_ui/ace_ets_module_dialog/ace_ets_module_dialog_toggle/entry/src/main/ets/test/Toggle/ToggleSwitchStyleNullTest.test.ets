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

export default function ToggleSwitchStyleNullTest() {
  describe('ToggleSwitchStyleNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ToggleSwitchStyleNullTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Toggle/ToggleSwitchStyleNullTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ToggleSwitchStyleNullTest state success " + JSON.stringify(pages));
        if (!("ToggleSwitchStyleNullTest" == pages.name)) {
          console.info("get ToggleSwitchStyleNullTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push ToggleSwitchStyleNullTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ToggleSwitchStyleNullTest page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("ToggleSwitchStyleNullTest after each called");
    });

    /**
     * @tc.name   ToggleSwitchStyleNull_001
     * @tc.number SUB_ARKUI_API_ToggleSwitchStyle_NULL_001
     * @tc.desc   Test Toggle.switchStyle with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ToggleSwitchStyleNull_001', Level.LEVEL1, async (done: Function) => {
      console.info('[ToggleSwitchStyleNull_001] START');
      await Utils.sleep(1000);

      let driver = Driver.create();
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('btn_switchStyle_null'));
      await button.click();
      await Utils.sleep(5000);

      let strJson = getInspectorByKey('switchStyle_test_result');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let resultText: string = JSON.stringify(obj.$attrs.content);

      console.info("[ToggleSwitchStyleNull_001] result: " + resultText);
      expect(resultText).assertContain('FAILED');
      console.info('[ToggleSwitchStyleNull_001] END');
      done();
    });

    /**
     * @tc.name   ToggleSwitchStyleUndefined_001
     * @tc.number SUB_ARKUI_API_ToggleSwitchStyle_UNDEFINED_001
     * @tc.desc   Test Toggle.switchStyle with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ToggleSwitchStyleUndefined_001', Level.LEVEL1, async (done: Function) => {
      console.info('[ToggleSwitchStyleUndefined_001] START');
      await Utils.sleep(1000);

      let driver = Driver.create();
      await Utils.sleep(5000);
      let button = await driver.findComponent(ON.id('btn_switchStyle_undefined'));
      await button.click();
      await Utils.sleep(1000);

      let strJson = getInspectorByKey('switchStyle_test_result');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let resultText: string = JSON.stringify(obj.$attrs.content);

      console.info("[ToggleSwitchStyleUndefined_001] result: " + resultText);
      expect(resultText).assertContain('FAILED');
      console.info('[ToggleSwitchStyleUndefined_001] END');
      done();
    });
  });
}