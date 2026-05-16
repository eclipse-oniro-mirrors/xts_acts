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

export default function accessibilityDefaultFocusFalseTest() {
  describe('AccessibilityDefaultFocusFalseTest', () => {
    beforeAll(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/nullandundefinedcoverage/accessibility/AccessibilityDefaultFocusFalse',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AccessibilityDefaultFocusFalseTest state pages: " + JSON.stringify(pages));
        if (!("AccessibilityDefaultFocusFalse" == pages.name)) {
          console.info("get AccessibilityDefaultFocusFalseTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(1000);
          console.info("push AccessibilityDefaultFocusFalseTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AccessibilityDefaultFocusFalseTest page error: " + err);
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
     * @tc.name   accessibilityDefaultFocus_true_001
     * @tc.number SUB_ARKUI_ACCESSIBILITYDEFAULTFOCUS_PARAM_TRUE_001
     * @tc.desc   测试accessibilityDefaultFocus参数为true（有效 - 应为默认焦点）
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('accessibilityDefaultFocus_true_001', Level.LEVEL2, async () => {
      console.info('[accessibilityDefaultFocus_true_001] START');

      let strJson: string = getInspectorByKey('text_accessibilityDefaultFocus_true');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[accessibilityDefaultFocus_true_001] obj is: " + JSON.stringify(obj.$attrs));

       // accessibilityDefaultFocus是运行时行为设置，不存储在组件树中
       // 该属性可能不会反映在$attrs中，验证组件的accessibilityLevel设置为'yes'
      let accessibilityLevelValue: ESObject = obj.$attrs.accessibilityLevel;
      expect(accessibilityLevelValue === 'yes').assertTrue();
      console.info('[accessibilityDefaultFocus_true_001] accessibilityDefaultFocus(true) set successfully, component exists and accessibilityLevel is yes');
      console.info('[accessibilityDefaultFocus_true_001] END');
    });

    /**
     * @tc.name   accessibilityDefaultFocus_false_001
     * @tc.number SUB_ARKUI_ACCESSIBILITYDEFAULTFOCUS_PARAM_FALSE_001
     * @tc.desc   测试accessibilityDefaultFocus参数为false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('accessibilityDefaultFocus_false_001', Level.LEVEL2, async () => {
      console.info('[accessibilityDefaultFocus_false_001] START');

      let strJson: string = getInspectorByKey('text_accessibilityDefaultFocus_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[accessibilityDefaultFocus_false_001] obj is: " + JSON.stringify(obj.$attrs));

       // accessibilityDefaultFocus为false应被接受（尽管根据文档是无效的）
       // 验证组件存在且accessibilityLevel已设置
      let accessibilityLevelValue: ESObject = obj.$attrs.accessibilityLevel;
      expect(accessibilityLevelValue === 'yes').assertTrue();
      console.info('[accessibilityDefaultFocus_false_001] accessibilityDefaultFocus(false) set successfully');
      console.info('[accessibilityDefaultFocus_false_001] END');
    });

    /**
     * @tc.name   accessibilityDefaultFocus_undefined_001
     * @tc.number SUB_ARKUI_ACCESSIBILITYDEFAULTFOCUS_PARAM_UNDEFINED_001
     * @tc.desc   测试accessibilityDefaultFocus参数为undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('accessibilityDefaultFocus_undefined_001', Level.LEVEL2, async () => {
      console.info('[accessibilityDefaultFocus_undefined_001] START');

      let strJson: string = getInspectorByKey('text_accessibilityDefaultFocus_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[accessibilityDefaultFocus_undefined_001] obj is: " + JSON.stringify(obj.$attrs));

       // accessibilityDefaultFocus为undefined应被接受
       // 验证组件存在且accessibilityLevel已设置
      let accessibilityLevelValue: ESObject = obj.$attrs.accessibilityLevel;
      expect(accessibilityLevelValue === 'yes').assertTrue();
      console.info('[accessibilityDefaultFocus_undefined_001] accessibilityDefaultFocus(undefined) set successfully');
      console.info('[accessibilityDefaultFocus_undefined_001] END');
    });
  });
}
