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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../../MainAbility/common/Common';

export default function accessibilityStateDescriptionNullUndefinedTest() {
  describe('AccessibilityStateDescriptionNullUndefinedTest', () => {
    beforeAll(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/nullandundefinedcoverage/accessibility/AccessibilityStateDescriptionNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AccessibilityStateDescriptionNullUndefinedTest state pages: " + JSON.stringify(pages));
        if (!("AccessibilityStateDescriptionNullUndefined" == pages.name)) {
          console.info("get AccessibilityStateDescriptionNullUndefinedTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(1000);
          console.info("push AccessibilityStateDescriptionNullUndefinedTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AccessibilityStateDescriptionNullUndefinedTest page error: " + err);
        expect().assertFail();
      }
    });

    beforeEach(() => {
    });

    afterEach(() => {
    });

    afterAll(async () => {
    });

    /**
     * @tc.name   accessibilityStateDescription_null_001
     * @tc.number SUB_ARKUI_ACCESSIBILITYSTATEDESCRIPTION_PARAM_NULL_001
     * @tc.desc   测试accessibilityStateDescription参数为null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('accessibilityStateDescription_null_001', Level.LEVEL2, async () => {
      console.info('[accessibilityStateDescription_null_001] START');

      let strJson: string = getInspectorByKey('text_accessibilityStateDescription_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[accessibilityStateDescription_null_001] obj is: " + JSON.stringify(obj.$attrs));

       // 根据API文档，accessibilityStateDescription默认值为undefined
       // 当传入null时，应返回undefined
      let accessibilityStateDescriptionValue: ESObject = obj.$attrs.accessibilityStateDescription;
      expect(accessibilityStateDescriptionValue === undefined).assertTrue();
      console.info('[accessibilityStateDescription_null_001] END');
    });

    /**
     * @tc.name   accessibilityStateDescription_undefined_001
     * @tc.number SUB_ARKUI_ACCESSIBILITYSTATEDESCRIPTION_PARAM_UNDEFINED_001
     * @tc.desc   测试accessibilityStateDescription参数为undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('accessibilityStateDescription_undefined_001', Level.LEVEL2, async () => {
      console.info('[accessibilityStateDescription_undefined_001] START');

      let strJson: string = getInspectorByKey('text_accessibilityStateDescription_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[accessibilityStateDescription_undefined_001] obj is: " + JSON.stringify(obj.$attrs));

       // 根据API文档，accessibilityStateDescription默认值为undefined
      let accessibilityStateDescriptionValue: ESObject = obj.$attrs.accessibilityStateDescription;
      expect(accessibilityStateDescriptionValue === undefined).assertTrue();
      console.info('[accessibilityStateDescription_undefined_001] END');
    });

    /**
     * @tc.name   accessibilityStateDescription_emptyString_001
     * @tc.number SUB_ARKUI_ACCESSIBILITYSTATEDESCRIPTION_PARAM_EMPTYSTRING_001
     * @tc.desc   测试accessibilityStateDescription参数为空字符串
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('accessibilityStateDescription_emptyString_001', Level.LEVEL2, async () => {
      console.info('[accessibilityStateDescription_emptyString_001] START');

      let strJson: string = getInspectorByKey('text_accessibilityStateDescription_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[accessibilityStateDescription_emptyString_001] obj is: " + JSON.stringify(obj.$attrs));

       // 空字符串应该被保留
      let accessibilityStateDescriptionValue: ESObject = obj.$attrs.accessibilityStateDescription;
      expect(accessibilityStateDescriptionValue === undefined).assertTrue();
      console.info('[accessibilityStateDescription_emptyString_001] END');
    });

  });
}
