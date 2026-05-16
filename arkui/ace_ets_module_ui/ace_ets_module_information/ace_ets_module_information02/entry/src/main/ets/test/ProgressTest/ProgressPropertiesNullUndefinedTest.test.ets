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
import CommonFunc from '../../MainAbility/common/Common';

export default function ProgressPropertiesNullUndefinedTest() {
  describe('ProgressPropertiesNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Progress/ProgressPropertiesNullUndefinedTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ProgressPropertiesNullUndefinedTest state success " + JSON.stringify(pages));
        if (!("ProgressPropertiesNullUndefinedTest" == pages.name)) {
          console.info("get ProgressPropertiesNullUndefinedTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(4000);
          console.info("push ProgressPropertiesNullUndefinedTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ProgressPropertiesNullUndefinedTest page error " + err);
      }
      done()
    });

    /**
     * @tc.name   progressValue_null_0100
     * @tc.number SUB_ARKUI_PROGRESS_VALUE_NULL_0100
     * @tc.desc   Test Progress value property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('progressValue_null_0100', Level.LEVEL0, async () => {
      console.info('[progressValue_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Progress_value_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Progress_value_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[progressValue_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[progressValue_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[progressValue_null_0100] default value is: " + JSON.stringify(objCompare.$attrs.value));
      console.info("[progressValue_null_0100] null value is: " + JSON.stringify(obj.$attrs.value));

      // null 应该恢复为默认值
      expect(obj.$attrs.value).assertEqual(objCompare.$attrs.value);
      console.info('[progressValue_null_0100] END');
    })

    /**
     * @tc.name   progressValue_undefined_0100
     * @tc.number SUB_ARKUI_PROGRESS_VALUE_UNDEFINED_0100
     * @tc.desc   Test Progress value property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('progressValue_undefined_0100', Level.LEVEL0, async () => {
      console.info('[progressValue_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Progress_value_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Progress_value_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[progressValue_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[progressValue_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[progressValue_undefined_0100] default value is: " + JSON.stringify(objCompare.$attrs.value));
      console.info("[progressValue_undefined_0100] undefined value is: " + JSON.stringify(obj.$attrs.value));

      // undefined 应该恢复为默认值
      expect(obj.$attrs.value).assertEqual(objCompare.$attrs.value);
      console.info('[progressValue_undefined_0100] END');
    })

    /**
     * @tc.name   progressColor_null_0100
     * @tc.number SUB_ARKUI_PROGRESS_COLOR_NULL_0100
     * @tc.desc   Test Progress color property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('progressColor_null_0100', Level.LEVEL0, async () => {
      console.info('[progressColor_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Progress_color_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Progress_color_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[progressColor_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[progressColor_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[progressColor_null_0100] default color is: " + JSON.stringify(objCompare.$attrs.color));
      console.info("[progressColor_null_0100] null color is: " + JSON.stringify(obj.$attrs.color));

      // null 应该恢复为默认值
      expect(obj.$attrs.color).assertEqual(objCompare.$attrs.color);
      console.info('[progressColor_null_0100] END');
    })

    /**
     * @tc.name   progressColor_undefined_0100
     * @tc.number SUB_ARKUI_PROGRESS_COLOR_UNDEFINED_0100
     * @tc.desc   Test Progress color property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('progressColor_undefined_0100', Level.LEVEL0, async () => {
      console.info('[progressColor_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Progress_color_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Progress_color_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[progressColor_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[progressColor_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[progressColor_undefined_0100] default color is: " + JSON.stringify(objCompare.$attrs.color));
      console.info("[progressColor_undefined_0100] undefined color is: " + JSON.stringify(obj.$attrs.color));

      // undefined 应该恢复为默认值
      expect(obj.$attrs.color).assertEqual(objCompare.$attrs.color);
      console.info('[progressColor_undefined_0100] END');
    })

    /**
     * @tc.name   progressStyle_null_0100
     * @tc.number SUB_ARKUI_PROGRESS_STYLE_NULL_0100
     * @tc.desc   Test Progress style property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('progressStyle_null_0100', Level.LEVEL0, async () => {
      console.info('[progressStyle_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Progress_style_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Progress_style_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[progressStyle_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[progressStyle_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[progressStyle_null_0100] default style is: " + JSON.stringify(objCompare.$attrs.style));
      console.info("[progressStyle_null_0100] null style is: " + JSON.stringify(obj.$attrs.style));

      // null 应该恢复为默认值
      expect(JSON.stringify(obj.$attrs.style)).assertEqual(JSON.stringify(objCompare.$attrs.style));
      console.info('[progressStyle_null_0100] END');
    })

    /**
     * @tc.name   progressStyle_undefined_0100
     * @tc.number SUB_ARKUI_PROGRESS_STYLE_UNDEFINED_0100
     * @tc.desc   Test Progress style property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('progressStyle_undefined_0100', Level.LEVEL0, async () => {
      console.info('[progressStyle_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Progress_style_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Progress_style_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[progressStyle_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[progressStyle_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[progressStyle_undefined_0100] default style is: " + JSON.stringify(objCompare.$attrs.style));
      console.info("[progressStyle_undefined_0100] undefined style is: " + JSON.stringify(obj.$attrs.style));

      // undefined 应该恢复为默认值
      expect(JSON.stringify(obj.$attrs.style)).assertEqual(JSON.stringify(objCompare.$attrs.style));
      console.info('[progressStyle_undefined_0100] END');
    })

    /**
     * @tc.name   progressContentModifier_null_0100
     * @tc.number SUB_ARKUI_PROGRESS_CONTENTMODIFIER_NULL_0100
     * @tc.desc   Test Progress contentModifier property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('progressContentModifier_null_0100', Level.LEVEL0, async () => {
      console.info('[progressContentModifier_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Progress_contentModifier_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Progress_contentModifier_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[progressContentModifier_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[progressContentModifier_null_0100] null obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$type).assertEqual(objCompare.$type);
      console.info('[progressContentModifier_null_0100] END');
    })

    /**
     * @tc.name   progressContentModifier_undefined_0100
     * @tc.number SUB_ARKUI_PROGRESS_CONTENTMODIFIER_UNDEFINED_0100
     * @tc.desc   Test Progress contentModifier property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('progressContentModifier_undefined_0100', Level.LEVEL0, async () => {
      console.info('[progressContentModifier_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Progress_contentModifier_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Progress_contentModifier_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[progressContentModifier_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[progressContentModifier_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$type).assertEqual(objCompare.$type);
      console.info('[progressContentModifier_undefined_0100] END');
    })
  })
}
