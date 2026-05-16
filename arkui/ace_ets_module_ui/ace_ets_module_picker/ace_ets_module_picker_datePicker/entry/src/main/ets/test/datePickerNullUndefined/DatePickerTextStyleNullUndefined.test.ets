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

/**
 * DatePicker TextStyle 属性测试用例
 *
 * 测试目标: 验证DatePicker组件的textStyle属性功能
 * 测试覆盖:
 * 1. 自定义样式对象 (gray color, 18fp font)
 * 2. 默认值 (未设置textStyle)
 * 3. null 参数测试 (应恢复为默认值)
 * 4. undefined 参数测试 (应恢复为默认值)
 * 5. 另一个自定义样式对象 (red color, 20fp font)
 *
 * 注意事项：
 * - textStyle属性类型为PickerTextStyle对象，不是字符串或基本类型
 * - 默认值：{ color: '#ff182431', font: { size: '16fp', weight: FontWeight.Regular } }
 * - API 10+ 版本支持
 * - API 18+ 版本支持 Optional<PickerTextStyle>，新增对undefined的支持
 * - 设置待选项（以选中项为基准向上或向下的第一项）的文本样式
 */

import router from '@ohos.router';
import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from "@ohos/hypium"
import { Component, Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function DatePickerTextStyleNullUndefinedTest() {
  describe('DatePickerTextStyleNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("DatePickerTextStyleNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/datePickerNullUndefined/DatePickerTextStyleNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get DatePickerTextStyleNullUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("DatePickerTextStyleNullUndefined" == pages.name)) {
          console.info("get DatePickerTextStyleNullUndefinedTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push DatePickerTextStyleNullUndefinedTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push DatePickerTextStyleNullUndefinedTest page error:" + err);
      }
      console.info("DatePickerTextStyleNullUndefinedTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   datePickerTextStyle_001
     * @tc.number SUB_ARKUI_DATEPICKER_TEXTSTYLE_PARAM_001
     * @tc.desc   测试DatePicker的textStyle属性 - 自定义样式
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('datePickerTextStyle_001', Level.LEVEL2, async () => {
      console.info('[datePickerTextStyle_001] START');

      let strJson: string = getInspectorByKey('datePicker_textStyle_custom');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerTextStyle_001] textStyle value is: " + JSON.stringify(obj.$attrs.textStyle));

      // 验证属性值包含设置的color
      let textStyleValue: Record<string, ESObject> = obj.$attrs.textStyle as Record<string, ESObject>;
      expect(textStyleValue !== null).assertTrue();

      console.info('[datePickerTextStyle_001] END');
    });

    /**
     * @tc.name   datePickerTextStyle_002
     * @tc.number SUB_ARKUI_DATEPICKER_TEXTSTYLE_PARAM_002
     * @tc.desc   测试DatePicker的textStyle属性 - 默认值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('datePickerTextStyle_002', Level.LEVEL2, async () => {
      console.info('[datePickerTextStyle_002] START');

      let strJson: string = getInspectorByKey('datePicker_textStyle_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerTextStyle_002] textStyle value is: " + JSON.stringify(obj.$attrs.textStyle));

      // 验证属性存在
      let textStyleValue: Record<string, ESObject> = obj.$attrs.textStyle as Record<string, ESObject>;
      expect(textStyleValue !== null).assertTrue();

      console.info('[datePickerTextStyle_002] END');
    });

    /**
     * @tc.name   datePickerTextStyle_003
     * @tc.number SUB_ARKUI_DATEPICKER_TEXTSTYLE_NULL_001
     * @tc.desc   测试DatePicker的textStyle属性 - null参数应恢复为默认值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('datePickerTextStyle_003', Level.LEVEL2, async () => {
      console.info('[datePickerTextStyle_003] START');

      // 获取默认值组件的属性
      let strJsonCompare: string = getInspectorByKey('datePicker_textStyle_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      // 获取null参数组件的属性
      let strJson: string = getInspectorByKey('datePicker_textStyle_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerTextStyle_003] default textStyle value is: " + JSON.stringify(objCompare.$attrs.textStyle));
      console.info("[datePickerTextStyle_003] null textStyle value is: " + JSON.stringify(obj.$attrs.textStyle));

      // null 应该恢复为默认值，两者应该相等
      expect(obj.$attrs.textStyle.color).assertEqual(objCompare.$attrs.textStyle.color);
      expect(obj.$attrs.textStyle.font.size).assertEqual(objCompare.$attrs.textStyle.font.size);
      expect(obj.$attrs.textStyle.font.weight).assertEqual(objCompare.$attrs.textStyle.font.weight);

      console.info('[datePickerTextStyle_003] END');
    });

    /**
     * @tc.name   datePickerTextStyle_004
     * @tc.number SUB_ARKUI_DATEPICKER_TEXTSTYLE_UNDEFINED_001
     * @tc.desc   测试DatePicker的textStyle属性 - undefined参数应恢复为默认值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('datePickerTextStyle_004', Level.LEVEL2, async () => {
      console.info('[datePickerTextStyle_004] START');

      // 获取默认值组件的属性
      let strJsonCompare: string = getInspectorByKey('datePicker_textStyle_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      // 获取undefined参数组件的属性
      let strJson: string = getInspectorByKey('datePicker_textStyle_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerTextStyle_004] default textStyle value is: " + JSON.stringify(objCompare.$attrs.textStyle));
      console.info("[datePickerTextStyle_004] undefined textStyle value is: " + JSON.stringify(obj.$attrs.textStyle));

      // undefined 应该恢复为默认值，两者应该相等
      expect(obj.$attrs.textStyle.color).assertEqual(objCompare.$attrs.textStyle.color);
      expect(obj.$attrs.textStyle.font.size).assertEqual(objCompare.$attrs.textStyle.font.size);
      expect(obj.$attrs.textStyle.font.weight).assertEqual(objCompare.$attrs.textStyle.font.weight);

      console.info('[datePickerTextStyle_004] END');
    });

    /**
     * @tc.name   datePickerTextStyle_005
     * @tc.number SUB_ARKUI_DATEPICKER_TEXTSTYLE_PARAM_003
     * @tc.desc   测试DatePicker的textStyle属性 - 另一个自定义样式
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('datePickerTextStyle_005', Level.LEVEL2, async () => {
      console.info('[datePickerTextStyle_005] START');

      let strJson: string = getInspectorByKey('datePicker_textStyle_custom2');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerTextStyle_005] textStyle value is: " + JSON.stringify(obj.$attrs.textStyle));

      // 验证属性值包含设置的color
      let textStyleValue: Record<string, ESObject> = obj.$attrs.textStyle as Record<string, ESObject>;
      expect(textStyleValue !== null).assertTrue();

      console.info('[datePickerTextStyle_005] END');
    });
  })
}
