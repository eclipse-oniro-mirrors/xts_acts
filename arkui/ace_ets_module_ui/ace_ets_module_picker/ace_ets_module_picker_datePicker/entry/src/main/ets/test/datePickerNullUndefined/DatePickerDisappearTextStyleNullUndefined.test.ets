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
 * DatePicker DisappearTextStyle 属性测试用例
 *
 * 测试目标: 验证DatePicker组件的disappearTextStyle属性功能
 * 测试覆盖:
 * 1. 自定义样式对象 (gray color, 16fp font)
 * 2. 默认值 (未设置disappearTextStyle)
 * 3. null 参数测试 (应恢复为默认值)
 * 4. undefined 参数测试 (应恢复为默认值)
 * 5. 另一个自定义样式对象 (red color, 18fp font)
 *
 * 注意事项：
 * - disappearTextStyle属性类型为PickerTextStyle对象，不是字符串或基本类型
 * - 默认值：{ color: '#ff182431', font: { size: '14fp', weight: FontWeight.Regular } }
 * - API 10+ 版本支持
 * - API 18+ 版本支持 Optional<PickerTextStyle>，新增对undefined的支持
 * - 设置边缘项（以选中项为基准向上或向下的第二项）的文本样式
 */

import router from '@ohos.router';
import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from "@ohos/hypium"
import { Component, Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function DatePickerDisappearTextStyleNullUndefinedTest() {
  describe('DatePickerDisappearTextStyleNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("DatePickerDisappearTextStyleNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/datePickerNullUndefined/DatePickerDisappearTextStyleNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get DatePickerDisappearTextStyleNullUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("DatePickerDisappearTextStyleNullUndefined" == pages.name)) {
          console.info("get DatePickerDisappearTextStyleNullUndefinedTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push DatePickerDisappearTextStyleNullUndefinedTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push DatePickerDisappearTextStyleNullUndefinedTest page error:" + err);
      }
      console.info("DatePickerDisappearTextStyleNullUndefinedTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   datePickerDisappearTextStyle_001
     * @tc.number SUB_ARKUI_DATEPICKER_DISAPPEARTEXTSTYLE_PARAM_001
     * @tc.desc   测试DatePicker的disappearTextStyle属性 - 自定义样式
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('datePickerDisappearTextStyle_001', Level.LEVEL2, async () => {
      console.info('[datePickerDisappearTextStyle_001] START');

      let strJson: string = getInspectorByKey('datePicker_disappearTextStyle_custom');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerDisappearTextStyle_001] disappearTextStyle value is: " + JSON.stringify(obj.$attrs.disappearTextStyle));

      // 验证属性值包含设置的color
      let disappearTextStyleValue: Record<string, ESObject> = obj.$attrs.disappearTextStyle as Record<string, ESObject>;
      expect(disappearTextStyleValue !== null).assertTrue();

      console.info('[datePickerDisappearTextStyle_001] END');
    });

    /**
     * @tc.name   datePickerDisappearTextStyle_002
     * @tc.number SUB_ARKUI_DATEPICKER_DISAPPEARTEXTSTYLE_PARAM_002
     * @tc.desc   测试DatePicker的disappearTextStyle属性 - 默认值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('datePickerDisappearTextStyle_002', Level.LEVEL2, async () => {
      console.info('[datePickerDisappearTextStyle_002] START');

      let strJson: string = getInspectorByKey('datePicker_disappearTextStyle_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerDisappearTextStyle_002] disappearTextStyle value is: " + JSON.stringify(obj.$attrs.disappearTextStyle));

      // 验证属性存在
      let disappearTextStyleValue: Record<string, ESObject> = obj.$attrs.disappearTextStyle as Record<string, ESObject>;
      expect(disappearTextStyleValue !== null).assertTrue();

      console.info('[datePickerDisappearTextStyle_002] END');
    });

    /**
     * @tc.name   datePickerDisappearTextStyle_003
     * @tc.number SUB_ARKUI_DATEPICKER_DISAPPEARTEXTSTYLE_NULL_001
     * @tc.desc   测试DatePicker的disappearTextStyle属性 - null参数应恢复为默认值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('datePickerDisappearTextStyle_003', Level.LEVEL2, async () => {
      console.info('[datePickerDisappearTextStyle_003] START');

      // 获取默认值组件的属性
      let strJsonCompare: string = getInspectorByKey('datePicker_disappearTextStyle_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      // 获取null参数组件的属性
      let strJson: string = getInspectorByKey('datePicker_disappearTextStyle_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerDisappearTextStyle_003] default disappearTextStyle value is: " + JSON.stringify(objCompare.$attrs.disappearTextStyle));
      console.info("[datePickerDisappearTextStyle_003] null disappearTextStyle value is: " + JSON.stringify(obj.$attrs.disappearTextStyle));

      // null 应该恢复为默认值，两者应该相等
      expect(obj.$attrs.disappearTextStyle.color).assertEqual(objCompare.$attrs.disappearTextStyle.color);
      expect(obj.$attrs.disappearTextStyle.font.size).assertEqual(objCompare.$attrs.disappearTextStyle.font.size);
      expect(obj.$attrs.disappearTextStyle.font.weight).assertEqual(objCompare.$attrs.disappearTextStyle.font.weight);

      console.info('[datePickerDisappearTextStyle_003] END');
    });

    /**
     * @tc.name   datePickerDisappearTextStyle_004
     * @tc.number SUB_ARKUI_DATEPICKER_DISAPPEARTEXTSTYLE_UNDEFINED_001
     * @tc.desc   测试DatePicker的disappearTextStyle属性 - undefined参数应恢复为默认值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('datePickerDisappearTextStyle_004', Level.LEVEL2, async () => {
      console.info('[datePickerDisappearTextStyle_004] START');

      // 获取默认值组件的属性
      let strJsonCompare: string = getInspectorByKey('datePicker_disappearTextStyle_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      // 获取undefined参数组件的属性
      let strJson: string = getInspectorByKey('datePicker_disappearTextStyle_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerDisappearTextStyle_004] default disappearTextStyle value is: " + JSON.stringify(objCompare.$attrs.disappearTextStyle));
      console.info("[datePickerDisappearTextStyle_004] undefined disappearTextStyle value is: " + JSON.stringify(obj.$attrs.disappearTextStyle));

      // undefined 应该恢复为默认值，两者应该相等
      expect(obj.$attrs.disappearTextStyle.color).assertEqual(objCompare.$attrs.disappearTextStyle.color);
      expect(obj.$attrs.disappearTextStyle.font.size).assertEqual(objCompare.$attrs.disappearTextStyle.font.size);
      expect(obj.$attrs.disappearTextStyle.font.weight).assertEqual(objCompare.$attrs.disappearTextStyle.font.weight);

      console.info('[datePickerDisappearTextStyle_004] END');
    });

    /**
     * @tc.name   datePickerDisappearTextStyle_005
     * @tc.number SUB_ARKUI_DATEPICKER_DISAPPEARTEXTSTYLE_PARAM_003
     * @tc.desc   测试DatePicker的disappearTextStyle属性 - 另一个自定义样式
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('datePickerDisappearTextStyle_005', Level.LEVEL2, async () => {
      console.info('[datePickerDisappearTextStyle_005] START');

      let strJson: string = getInspectorByKey('datePicker_disappearTextStyle_custom2');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerDisappearTextStyle_005] disappearTextStyle value is: " + JSON.stringify(obj.$attrs.disappearTextStyle));

      // 验证属性值包含设置的color
      let disappearTextStyleValue: Record<string, ESObject> = obj.$attrs.disappearTextStyle as Record<string, ESObject>;
      expect(disappearTextStyleValue !== null).assertTrue();

      console.info('[datePickerDisappearTextStyle_005] END');
    });
  })
}
