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
import {Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, PointerMatrix} from '@ohos.UiTest';
import Utils from '../Utils';

export default function waterFlowModifierNullUndefined() {
  describe('waterFlowModifierNullUndefined', () => {
    beforeEach(async (done: Function) => {
      console.info("waterFlowModifierNullUndefined beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/waterFlow/waterFlowModifierNullUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get waterFlowModifierNullUndefined state pages: " + JSON.stringify(pages));
        if (!("waterFlowModifierNullUndefined" == pages.name)) {
          console.info("get waterFlowModifierNullUndefined state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push waterFlowModifierNullUndefined success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push waterFlowModifierNullUndefined page error: " + err);
      }
      done();
    });

    /**
     * @tc.name   waterFlowModifierNullUndefined_0100
     * @tc.number waterFlowModifierNullUndefined_0100
     * @tc.desc   Test WaterFlowModifier applyNormalAttribute property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('waterFlowModifierNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[waterFlowModifierNullUndefined_0100] START');
      let driver = await Driver.create()
      await Utils.sleep(1000);
      let button1 = await driver.findComponent(ON.id('btn_waterFlowModifier_null'));
      await button1.click();
      await Utils.sleep(1500);
      expect(AppStorage.get('WaterFlowModifierNullUndefined')).assertEqual(null);
      AppStorage.delete('WaterFlowModifierNullUndefined')
      console.info('[waterFlowModifierNullUndefined_0100] END');
    })

    /**
     * @tc.name   waterFlowModifierNullUndefined_0200
     * @tc.number waterFlowModifierNullUndefined_0200
     * @tc.desc   Test WaterFlowModifier applyNormalAttribute property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('waterFlowModifierNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[waterFlowModifierNullUndefined_0200] START');
      let driver = await Driver.create()
      await Utils.sleep(1000);
      let button1 = await driver.findComponent(ON.id('btn_waterFlowModifier_undefined'));
      await button1.click();
      await Utils.sleep(1500);
      expect(AppStorage.get('WaterFlowModifierNullUndefined')).assertEqual(undefined);
      AppStorage.delete('WaterFlowModifierNullUndefined')
      console.info('[waterFlowModifierNullUndefined_0200] END');
    })

  })
}
