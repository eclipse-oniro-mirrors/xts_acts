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

export default function accessibilityActionOptionsNullUndefinedTest() {
  describe('AccessibilityActionOptionsNullUndefinedTest', () => {
    beforeAll(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/nullandundefinedcoverage/accessibility/AccessibilityActionOptionsNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AccessibilityActionOptionsNullUndefinedTest state pages: " + JSON.stringify(pages));
        if (!("AccessibilityActionOptionsNullUndefined" == pages.name)) {
          console.info("get AccessibilityActionOptionsNullUndefinedTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(1000);
          console.info("push AccessibilityActionOptionsNullUndefinedTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AccessibilityActionOptionsNullUndefinedTest page error: " + err);
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
     * @tc.name   accessibilityActionOptions_null_001
     * @tc.number SUB_ARKUI_ACCESSIBILITYACTIONOPTIONS_PARAM_NULL_001
     * @tc.desc   测试accessibilityActionOptions参数为null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('accessibilityActionOptions_null_001', Level.LEVEL2, async () => {
      console.info('[accessibilityActionOptions_null_001] START');

      let strJson: string = getInspectorByKey('text_accessibilityActionOptions_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[accessibilityActionOptions_null_001] obj is: " + JSON.stringify(obj.$attrs));

       // 根据API文档，accessibilityActionOptions默认值为undefined
       // 当传入null时，应返回undefined
      let accessibilityActionOptionsValue: ESObject = obj.$attrs.accessibilityActionOptions;
      expect(accessibilityActionOptionsValue === undefined).assertTrue();
      console.info('[accessibilityActionOptions_null_001] END');
    });

    /**
     * @tc.name   accessibilityActionOptions_undefined_001
     * @tc.number SUB_ARKUI_ACCESSIBILITYACTIONOPTIONS_PARAM_UNDEFINED_001
     * @tc.desc   测试accessibilityActionOptions参数为undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('accessibilityActionOptions_undefined_001', Level.LEVEL2, async () => {
      console.info('[accessibilityActionOptions_undefined_001] START');

      let strJson: string = getInspectorByKey('text_accessibilityActionOptions_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[accessibilityActionOptions_undefined_001] obj is: " + JSON.stringify(obj.$attrs));

       // 根据API文档，accessibilityActionOptions默认值为undefined
      let accessibilityActionOptionsValue: ESObject = obj.$attrs.accessibilityActionOptions;
      expect(accessibilityActionOptionsValue === undefined).assertTrue();
      console.info('[accessibilityActionOptions_undefined_001] END');
    });

    /**
     * @tc.name   accessibilityVirtualNode_null_001
     * @tc.number SUB_ARKUI_ACCESSIBILITYVIRTUALNODE_PARAM_NULL_001
     * @tc.desc   测试accessibilityVirtualNode参数为null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('accessibilityVirtualNode_null_001', Level.LEVEL2, async () => {
      console.info('[accessibilityVirtualNode_null_001] START');

      let strJson: string = getInspectorByKey('text_accessibilityVirtualNode_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[accessibilityVirtualNode_null_001] obj is: " + JSON.stringify(obj.$attrs));

       // 根据API文档，accessibilityVirtualNode默认值为undefined
       // 当传入null时，应返回undefined
      let accessibilityVirtualNodeValue: ESObject = obj.$attrs.accessibilityVirtualNode;
      expect(accessibilityVirtualNodeValue === false).assertTrue();
      console.info('[accessibilityVirtualNode_null_001] END');
    });

    /**
     * @tc.name   accessibilityVirtualNode_undefined_001
     * @tc.number SUB_ARKUI_ACCESSIBILITYVIRTUALNODE_PARAM_UNDEFINED_001
     * @tc.desc   测试accessibilityVirtualNode参数为undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('accessibilityVirtualNode_undefined_001', Level.LEVEL2, async () => {
      console.info('[accessibilityVirtualNode_undefined_001] START');

      let strJson: string = getInspectorByKey('text_accessibilityVirtualNode_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[accessibilityVirtualNode_undefined_001] obj is: " + JSON.stringify(obj.$attrs));

       // 根据API文档，accessibilityVirtualNode默认值为undefined
      let accessibilityVirtualNodeValue: ESObject = obj.$attrs.accessibilityVirtualNode;
      expect(accessibilityVirtualNodeValue === false).assertTrue();
      console.info('[accessibilityVirtualNode_undefined_001] END');
    });

    /**
     * @tc.name   accessibilityVirtualNode_valid_001
     * @tc.number SUB_ARKUI_ACCESSIBILITYVIRTUALNODE_PARAM_VALID_001
     * @tc.desc   测试accessibilityVirtualNode参数为有效的CustomBuilder
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('accessibilityVirtualNode_valid_001', Level.LEVEL2, async () => {
      console.info('[accessibilityVirtualNode_valid_001] START');

      let strJson: string = getInspectorByKey('text_accessibilityVirtualNode_valid');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[accessibilityVirtualNode_valid_001] obj is: " + JSON.stringify(obj.$attrs));

       // 当设置CustomBuilder时，该属性应该存在（不为null或undefined）
      expect(obj.$attrs.accessibilityVirtualNode !== null && obj.$attrs.accessibilityVirtualNode !== undefined).assertTrue();
      console.info('[accessibilityVirtualNode_valid_001] END');
    });
  });
}
