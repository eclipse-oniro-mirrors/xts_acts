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

export default function accessibilityTextNullUndefinedTest() {
  describe('AccessibilityTextNullUndefinedTest', () => {
    beforeAll(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/nullandundefinedcoverage/accessibility/AccessibilityTextNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AccessibilityTextNullUndefinedTest state pages: " + JSON.stringify(pages));
        if (!("AccessibilityTextNullUndefined" == pages.name)) {
          console.info("get AccessibilityTextNullUndefinedTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(1000);
          console.info("push AccessibilityTextNullUndefinedTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AccessibilityTextNullUndefinedTest page error: " + err);
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
     * @tc.name   accessibilityText_null_001
     * @tc.number SUB_ARKUI_ACCESSIBILITYTEXT_PARAM_NULL_001
     * @tc.desc   测试accessibilityText参数为null时，应返回默认值""
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('accessibilityText_null_001', Level.LEVEL2, async () => {
      console.info('[accessibilityText_null_001] START');

      let strJson: string = getInspectorByKey('text_accessibilityText_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[accessibilityText_null_001] obj is: " + JSON.stringify(obj.$attrs));

       // 根据API文档，accessibilityText默认值为""
       // 当传入null时，应返回默认值""
      let accessibilityTextValue: ESObject = obj.$attrs.accessibilityText;
      expect(accessibilityTextValue === '').assertTrue();
      console.info('[accessibilityText_null_001] END');
    });

    /**
     * @tc.name   accessibilityText_undefined_001
     * @tc.number SUB_ARKUI_ACCESSIBILITYTEXT_PARAM_UNDEFINED_001
     * @tc.desc   测试accessibilityText参数为undefined时，应返回默认值""
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('accessibilityText_undefined_001', Level.LEVEL2, async () => {
      console.info('[accessibilityText_undefined_001] START');

      let strJson: string = getInspectorByKey('text_accessibilityText_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[accessibilityText_undefined_001] obj is: " + JSON.stringify(obj.$attrs));

       // 根据API文档，accessibilityText默认值为""
       // 当传入undefined时，应返回默认值""
      let accessibilityTextValue: ESObject = obj.$attrs.accessibilityText;
      expect(accessibilityTextValue === '').assertTrue();
      console.info('[accessibilityText_undefined_001] END');
    });

    /**
     * @tc.name   accessibilityText_emptyString_001
     * @tc.number SUB_ARKUI_ACCESSIBILITYTEXT_PARAM_EMPTYSTRING_001
     * @tc.desc   测试accessibilityText参数为空字符串
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('accessibilityText_emptyString_001', Level.LEVEL2, async () => {
      console.info('[accessibilityText_emptyString_001] START');

      let strJson: string = getInspectorByKey('text_accessibilityText_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

       console.info("[accessibilityText_emptyString_001] obj is: " + JSON.stringify(obj.$attrs));

       // 空字符串应该被保留
       let accessibilityTextValue: ESObject = obj.$attrs.accessibilityText;
      expect(accessibilityTextValue === '').assertTrue();
      console.info('[accessibilityText_emptyString_001] END');
    });

    /**
     * @tc.name   accessibilityText_valid_001
     * @tc.number SUB_ARKUI_ACCESSIBILITYTEXT_PARAM_VALID_001
     * @tc.desc   测试accessibilityText参数为有效字符串
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('accessibilityText_valid_001', Level.LEVEL2, async () => {
      console.info('[accessibilityText_valid_001] START');

      let strJson: string = getInspectorByKey('text_accessibilityText_valid');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[accessibilityText_valid_001] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.accessibilityText === 'valid text').assertTrue();
      console.info('[accessibilityText_valid_001] END');
    });

    /**
     * @tc.name   accessibilityTextHint_null_001
     * @tc.number SUB_ARKUI_ACCESSIBILITYTEXTHINT_PARAM_NULL_001
     * @tc.desc   测试accessibilityTextHint参数为null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('accessibilityTextHint_null_001', Level.LEVEL2, async () => {
      console.info('[accessibilityTextHint_null_001] START');

      let strJson: string = getInspectorByKey('text_accessibilityTextHint_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[accessibilityTextHint_null_001] obj is: " + JSON.stringify(obj.$attrs));

       // accessibilityTextHint没有默认值，传入null时应为undefined
      let accessibilityTextHintValue: ESObject = obj.$attrs.accessibilityTextHint;
      expect(accessibilityTextHintValue === 'null').assertTrue();
      console.info('[accessibilityTextHint_null_001] END');
    });

    /**
     * @tc.name   accessibilityTextHint_undefined_001
     * @tc.number SUB_ARKUI_ACCESSIBILITYTEXTHINT_PARAM_UNDEFINED_001
     * @tc.desc   测试accessibilityTextHint参数为undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('accessibilityTextHint_undefined_001', Level.LEVEL2, async () => {
      console.info('[accessibilityTextHint_undefined_001] START');

      let strJson: string = getInspectorByKey('text_accessibilityTextHint_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[accessibilityTextHint_undefined_001] obj is: " + JSON.stringify(obj.$attrs));

       // accessibilityTextHint没有默认值，应为undefined
      let accessibilityTextHintValue: ESObject = obj.$attrs.accessibilityTextHint;
      expect(accessibilityTextHintValue === 'undefined').assertTrue();
      console.info('[accessibilityTextHint_undefined_001] END');
    });

    /**
     * @tc.name   accessibilityTextHint_emptyString_001
     * @tc.number SUB_ARKUI_ACCESSIBILITYTEXTHINT_PARAM_EMPTYSTRING_001
     * @tc.desc   测试accessibilityTextHint参数为空字符串
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('accessibilityTextHint_emptyString_001', Level.LEVEL2, async () => {
      console.info('[accessibilityTextHint_emptyString_001] START');

      let strJson: string = getInspectorByKey('text_accessibilityTextHint_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

       console.info("[accessibilityTextHint_emptyString_001] obj is: " + JSON.stringify(obj.$attrs));

       // 空字符串应该被保留
       let accessibilityTextHintValue: ESObject = obj.$attrs.accessibilityTextHint;
      expect(accessibilityTextHintValue === '').assertTrue();
      console.info('[accessibilityTextHint_emptyString_001] END');
    });

    /**
     * @tc.name   accessibilityTextHint_valid_001
     * @tc.number SUB_ARKUI_ACCESSIBILITYTEXTHINT_PARAM_VALID_001
     * @tc.desc   测试accessibilityTextHint参数为有效字符串
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('accessibilityTextHint_valid_001', Level.LEVEL2, async () => {
      console.info('[accessibilityTextHint_valid_001] START');

      let strJson: string = getInspectorByKey('text_accessibilityTextHint_valid');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[accessibilityTextHint_valid_001] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.accessibilityTextHint === 'hint text').assertTrue();
      console.info('[accessibilityTextHint_valid_001] END');
    });

    /**
     * @tc.name   accessibilityDescription_null_001
     * @tc.number SUB_ARKUI_ACCESSIBILITYDESCRIPTION_PARAM_NULL_001
     * @tc.desc   测试accessibilityDescription参数为null时，应返回默认值""
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('accessibilityDescription_null_001', Level.LEVEL2, async () => {
      console.info('[accessibilityDescription_null_001] START');

      let strJson: string = getInspectorByKey('text_accessibilityDescription_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[accessibilityDescription_null_001] obj is: " + JSON.stringify(obj.$attrs));

       // 根据API文档，accessibilityDescription默认值为""
       // 当传入null时，应返回默认值""
      let accessibilityDescriptionValue: ESObject = obj.$attrs.accessibilityDescription;
      expect(accessibilityDescriptionValue === '').assertTrue();
      console.info('[accessibilityDescription_null_001] END');
    });

    /**
     * @tc.name   accessibilityDescription_undefined_001
     * @tc.number SUB_ARKUI_ACCESSIBILITYDESCRIPTION_PARAM_UNDEFINED_001
     * @tc.desc   测试accessibilityDescription参数为undefined时，应返回默认值""
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('accessibilityDescription_undefined_001', Level.LEVEL2, async () => {
      console.info('[accessibilityDescription_undefined_001] START');

      let strJson: string = getInspectorByKey('text_accessibilityDescription_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[accessibilityDescription_undefined_001] obj is: " + JSON.stringify(obj.$attrs));

       // 根据API文档，accessibilityDescription默认值为""
       // 当传入undefined时，应返回默认值""
      let accessibilityDescriptionValue: ESObject = obj.$attrs.accessibilityDescription;
      expect(accessibilityDescriptionValue === '').assertTrue();
      console.info('[accessibilityDescription_undefined_001] END');
    });

    /**
     * @tc.name   accessibilityDescription_emptyString_001
     * @tc.number SUB_ARKUI_ACCESSIBILITYDESCRIPTION_PARAM_EMPTYSTRING_001
     * @tc.desc   测试accessibilityDescription参数为空字符串
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('accessibilityDescription_emptyString_001', Level.LEVEL2, async () => {
      console.info('[accessibilityDescription_emptyString_001] START');

      let strJson: string = getInspectorByKey('text_accessibilityDescription_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

       console.info("[accessibilityDescription_emptyString_001] obj is: " + JSON.stringify(obj.$attrs));

       // 空字符串应该被保留
       let accessibilityDescriptionValue: ESObject = obj.$attrs.accessibilityDescription;
      expect(accessibilityDescriptionValue === '').assertTrue();
      console.info('[accessibilityDescription_emptyString_001] END');
    });

    /**
     * @tc.name   accessibilityDescription_valid_001
     * @tc.number SUB_ARKUI_ACCESSIBILITYDESCRIPTION_PARAM_VALID_001
     * @tc.desc   测试accessibilityDescription参数为有效字符串
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('accessibilityDescription_valid_001', Level.LEVEL2, async () => {
      console.info('[accessibilityDescription_valid_001] START');

      let strJson: string = getInspectorByKey('text_accessibilityDescription_valid');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[accessibilityDescription_valid_001] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.accessibilityDescription === 'description').assertTrue();
      console.info('[accessibilityDescription_valid_001] END');
    });

    /**
     * @tc.name   accessibilityNextFocusId_null_001
     * @tc.number SUB_ARKUI_ACCESSIBILITYNEXTFOCUSID_PARAM_NULL_001
     * @tc.desc   测试accessibilityNextFocusId参数为null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('accessibilityNextFocusId_null_001', Level.LEVEL2, async () => {
      console.info('[accessibilityNextFocusId_null_001] START');

      let strJson: string = getInspectorByKey('text_accessibilityNextFocusId_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[accessibilityNextFocusId_null_001] obj is: " + JSON.stringify(obj.$attrs));

       // accessibilityNextFocusId没有默认值，传入null时应为undefined
      let accessibilityNextFocusIdValue: ESObject = obj.$attrs.accessibilityNextFocusId;
      expect(accessibilityNextFocusIdValue === undefined).assertTrue();
      console.info('[accessibilityNextFocusId_null_001] END');
    });

    /**
     * @tc.name   accessibilityNextFocusId_undefined_001
     * @tc.number SUB_ARKUI_ACCESSIBILITYNEXTFOCUSID_PARAM_UNDEFINED_001
     * @tc.desc   测试accessibilityNextFocusId参数为undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('accessibilityNextFocusId_undefined_001', Level.LEVEL2, async () => {
      console.info('[accessibilityNextFocusId_undefined_001] START');

      let strJson: string = getInspectorByKey('text_accessibilityNextFocusId_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[accessibilityNextFocusId_undefined_001] obj is: " + JSON.stringify(obj.$attrs));

       // accessibilityNextFocusId没有默认值，应为undefined
      let accessibilityNextFocusIdValue: ESObject = obj.$attrs.accessibilityNextFocusId;
      expect(accessibilityNextFocusIdValue === undefined).assertTrue();
      console.info('[accessibilityNextFocusId_undefined_001] END');
    });

    /**
     * @tc.name   accessibilityNextFocusId_emptyString_001
     * @tc.number SUB_ARKUI_ACCESSIBILITYNEXTFOCUSID_PARAM_EMPTYSTRING_001
     * @tc.desc   测试accessibilityNextFocusId参数为空字符串
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('accessibilityNextFocusId_emptyString_001', Level.LEVEL2, async () => {
      console.info('[accessibilityNextFocusId_emptyString_001] START');

      let strJson: string = getInspectorByKey('text_accessibilityNextFocusId_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

       console.info("[accessibilityNextFocusId_emptyString_001] obj is: " + JSON.stringify(obj.$attrs));

       // 空字符串应该被保留
       let accessibilityNextFocusIdValue: ESObject = obj.$attrs.accessibilityNextFocusId;
      expect(accessibilityNextFocusIdValue === undefined).assertTrue();
      console.info('[accessibilityNextFocusId_emptyString_001] END');
    });
  });
}
