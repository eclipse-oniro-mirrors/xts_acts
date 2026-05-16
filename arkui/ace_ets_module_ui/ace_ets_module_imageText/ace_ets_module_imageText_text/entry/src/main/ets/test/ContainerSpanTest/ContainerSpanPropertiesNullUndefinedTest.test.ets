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

import router from '@ohos.router';
import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import CommonFunc from '../../MainAbility/common/Common'

export default function ContainerSpanPropertiesNullUndefinedTest() {
  describe('ContainerSpanPropertiesNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ContainerSpanPropertiesNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ContainerSpan/ContainerSpanPropertiesNullUndefinedTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ContainerSpanPropertiesNullUndefinedTest state success " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        if (!("ContainerSpanPropertiesNullUndefinedTest" == pages.name)) {
          console.info("get ContainerSpanPropertiesNullUndefinedTest state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push ContainerSpanPropertiesNullUndefinedTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ContainerSpanPropertiesNullUndefinedTest page error: " + err);
      }
      done();
    });


    /**
     * @tc.name   containerSpanTextBackgroundStyle_null_0100
     * @tc.number SUB_ARKUI_CONTAINERSPAN_TEXTBACKGROUNDSTYLE_NULL_0100
     * @tc.desc   Test ContainerSpan textBackgroundStyle property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('containerSpanTextBackgroundStyle_null_0100', Level.LEVEL2, async () => {
      console.info('[containerSpanTextBackgroundStyle_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('ContainerSpan_textBackgroundStyle_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('ContainerSpan_textBackgroundStyle_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[containerSpanTextBackgroundStyle_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[containerSpanTextBackgroundStyle_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[containerSpanTextBackgroundStyle_null_0100] default textBackgroundStyle is: " + JSON.stringify(objCompare.$attrs.textBackgroundStyle));
      console.info("[containerSpanTextBackgroundStyle_null_0100] null textBackgroundStyle is: " + JSON.stringify(obj.$attrs.textBackgroundStyle));

      // null 应该恢复为默认值
      expect(JSON.stringify(obj.$attrs.textBackgroundStyle)).assertEqual(JSON.stringify(objCompare.$attrs.textBackgroundStyle));
      console.info('[containerSpanTextBackgroundStyle_null_0100] END');
    })

    /**
     * @tc.name   containerSpanTextBackgroundStyle_undefined_0100
     * @tc.number SUB_ARKUI_CONTAINERSPAN_TEXTBACKGROUNDSTYLE_UNDEFINED_0100
     * @tc.desc   Test ContainerSpan textBackgroundStyle property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc
.level  LEVEL2
     */
    it('containerSpanTextBackgroundStyle_undefined_0100', Level.LEVEL2, async () => {
      console.info('[containerSpanTextBackgroundStyle_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('ContainerSpan_textBackgroundStyle_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('ContainerSpan_textBackgroundStyle_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[containerSpanTextBackgroundStyle_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[containerSpanTextBackgroundStyle_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[containerSpanTextBackgroundStyle_undefined_0100] default textBackgroundStyle is: " + JSON.stringify(objCompare.$attrs.textBackgroundStyle));
      console.info("[containerSpanTextBackgroundStyle_undefined_0100] undefined textBackgroundStyle is: " + JSON.stringify(obj.$attrs.textBackgroundStyle));

      // undefined 应该恢复为默认值
      expect(JSON.stringify(obj.$attrs.textBackgroundStyle)).assertEqual(JSON.stringify(objCompare.$attrs.textBackgroundStyle));
      console.info('[containerSpanTextBackgroundStyle_undefined_0100] END');
    })

    /**
     * @tc.name   containerSpanAttributeModifier_null_0100
     * @tc.number SUB_ARKUI_CONTAINERSPAN_ATTRIBUTEMODIFIER_NULL_0100
     * @tc.desc   Test ContainerSpan attributeModifier property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('containerSpanAttributeModifier_null_0100', Level.LEVEL2, async () => {
      console.info('[containerSpanAttributeModifier_null_0100] START');

      let strJson: string = getInspectorByKey('ContainerSpan_attributeModifier_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[containerSpanAttributeModifier_null_0100] null obj is: " + JSON.stringify(obj.$attrs));

      // null 应该正常工作
      expect(obj.$type).assertEqual('Text');
      console.info('[containerSpanAttributeModifier_null_0100] END');
    })

    /**
     * @tc.name   containerSpanAttributeModifier_undefined_0100
     * @tc.number SUB_ARKUI_CONTAINERSPAN_ATTRIBUTEMODIFIER_UNDEFINED_0100
     * @tc.desc   Test ContainerSpan attributeModifier property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('containerSpanAttributeModifier_undefined_0100', Level.LEVEL2, async () => {
      console.info('[containerSpanAttributeModifier_undefined_0100] START');

      let strJson: string = getInspectorByKey('ContainerSpan_attributeModifier_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[containerSpanAttributeModifier_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));

      // undefined 应该正常工作
      expect(obj.$type).assertEqual('Text');
      console.info('[containerSpanAttributeModifier_undefined_0100] END');
    })
  })
}
