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

export default function ButtonDrawModifierNullUndefinedTest() {
  describe('ButtonDrawModifierNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ButtonDrawModifierNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/button/ButtonDrawModifierNullUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ButtonDrawModifierNullUndefinedTest state pages: " + JSON.stringify(pages));
        if (!("gestureEventTest" == pages.name)) {
          console.info("get ButtonDrawModifierNullUndefinedTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push ButtonDrawModifierNullUndefinedTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ButtonDrawModifierNullUndefinedTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   buttonDrawModifierNullUndefined_0100
     * @tc.number SUB_ARKUI_BUTTON_DRAWMODIFIER_NULL_0100
     * @tc.desc   Test Button drawModifier property with null, should be same as default (unset)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('buttonDrawModifierNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[buttonDrawModifierNullUndefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('button_drawModifier_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('button_drawModifier_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[buttonDrawModifierNullUndefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[buttonDrawModifierNullUndefined_0100] null obj is: " + JSON.stringify(obj.$attrs));

      // null 应该恢复为默认值
      expect(obj.$attrs.drawModifier).assertEqual(objCompare.$attrs.drawModifier);
      console.info('[buttonDrawModifierNullUndefined_0100] END');
    })

    /**
     * @tc.name   buttonDrawModifierNullUndefined_0200
     * @tc.number SUB_ARKUI_BUTTON_DRAWMODIFIER_UNDEFINED_0100
     * @tc.desc   Test Button drawModifier property with undefined, should be same as default (unset)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('buttonDrawModifierNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[buttonDrawModifierNullUndefined_0200] START');

      let strJsonCompare: string = getInspectorByKey('button_drawModifier_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('button_drawModifier_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[buttonDrawModifierNullUndefined_0200] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[buttonDrawModifierNullUndefined_0200] undefined obj is: " + JSON.stringify(obj.$attrs));

      // undefined 应该恢复为默认值
      expect(obj.$attrs.drawModifier).assertEqual(objCompare.$attrs.drawModifier);
      console.info('[buttonDrawModifierNullUndefined_0200] END');
    })

  })
}
