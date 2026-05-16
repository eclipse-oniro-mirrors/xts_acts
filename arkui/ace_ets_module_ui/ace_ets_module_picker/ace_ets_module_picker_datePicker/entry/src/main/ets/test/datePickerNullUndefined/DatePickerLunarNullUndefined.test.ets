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
 * DatePicker Lunar 属性测试用例
 *
 * 测试目标: 验证DatePicker组件的lunar属性功能
 * 测试覆盖:
 * 1. lunar = false (默认值)
 * 2. lunar = true
 * 3. null 参数测试 (应恢复为默认值false)
 * 4. undefined 参数测试 (应恢复为默认值false)
 *
 * 注意事项：
 * - lunar属性类型为boolean，不是字符串，不需要测试空字符串''
 * - 默认值为 false
 * - API 18+ 版本支持 Optional<boolean>，新增对undefined的支持
 */

import router from '@ohos.router';
import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from "@ohos/hypium"
import { Component, Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function DatePickerLunarNullUndefinedTest() {
  describe('DatePickerLunarNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("DatePickerLunarNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/datePickerNullUndefined/DatePickerLunarNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get DatePickerLunarNullUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("DatePickerLunarNullUndefined" == pages.name)) {
          console.info("get DatePickerLunarNullUndefinedTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push DatePickerLunarNullUndefinedTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push DatePickerLunarNullUndefinedTest page error:" + err);
      }
      console.info("DatePickerLunarNullUndefinedTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   datePickerLunar_001
     * @tc.number SUB_ARKUI_DATEPICKER_LUNAR_PARAM_001
     * @tc.desc   测试DatePicker的lunar属性 - lunar = false (默认值)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('datePickerLunar_001', Level.LEVEL2, async () => {
      console.info('[datePickerLunar_001] START');

      let strJson: string = getInspectorByKey('datePicker_lunar_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerLunar_001] lunar value is: " + JSON.stringify(obj.$attrs.lunar));

      // 验证属性值为 false
      let lunarValue: string = obj.$attrs.lunar as string;
      expect(lunarValue).assertEqual('false');

      console.info('[datePickerLunar_001] END');
    });

    /**
     * @tc.name   datePickerLunar_002
     * @tc.number SUB_ARKUI_DATEPICKER_LUNAR_PARAM_002
     * @tc.desc   测试DatePicker的lunar属性 - lunar = true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('datePickerLunar_002', Level.LEVEL2, async () => {
      console.info('[datePickerLunar_002] START');

      let strJson: string = getInspectorByKey('datePicker_lunar_true');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerLunar_002] lunar value is: " + JSON.stringify(obj.$attrs.lunar));

      // 验证属性值为 true
      let lunarValue: string = obj.$attrs.lunar as string;
      expect(lunarValue).assertEqual('true');

      console.info('[datePickerLunar_002] END');
    });

    /**
     * @tc.name   datePickerLunar_003
     * @tc.number SUB_ARKUI_DATEPICKER_LUNAR_NULL_001
     * @tc.desc   测试DatePicker的lunar属性 - null参数应恢复为默认值false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('datePickerLunar_003', Level.LEVEL2, async () => {
      console.info('[datePickerLunar_003] START');

      // 获取默认值组件的属性
      let strJsonCompare: string = getInspectorByKey('datePicker_lunar_false');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      // 获取null参数组件的属性
      let strJson: string = getInspectorByKey('datePicker_lunar_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerLunar_003] default lunar value is: " + JSON.stringify(objCompare.$attrs.lunar));
      console.info("[datePickerLunar_003] null lunar value is: " + JSON.stringify(obj.$attrs.lunar));

      // null 应该恢复为默认值 false
      let lunarValue: boolean = obj.$attrs.lunar as boolean;
      let lunarValueCompare: boolean = objCompare.$attrs.lunar as boolean;
      expect(lunarValue).assertEqual(lunarValueCompare);

      console.info('[datePickerLunar_003] END');
    });

    /**
     * @tc.name   datePickerLunar_004
     * @tc.number SUB_ARKUI_DATEPICKER_LUNAR_UNDEFINED_001
     * @tc.desc   测试DatePicker的lunar属性 - undefined参数应恢复为默认值false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('datePickerLunar_004', Level.LEVEL2, async () => {
      console.info('[datePickerLunar_004] START');

      // 获取默认值组件的属性
      let strJsonCompare: string = getInspectorByKey('datePicker_lunar_false');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      // 获取undefined参数组件的属性
      let strJson: string = getInspectorByKey('datePicker_lunar_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerLunar_004] default lunar value is: " + JSON.stringify(objCompare.$attrs.lunar));
      console.info("[datePickerLunar_004] undefined lunar value is: " + JSON.stringify(obj.$attrs.lunar));

      // undefined 应该恢复为默认值 false
      let lunarValue: boolean = obj.$attrs.lunar as boolean;
      let lunarValueCompare: boolean = objCompare.$attrs.lunar as boolean;
      expect(lunarValue).assertEqual(lunarValueCompare);

      console.info('[datePickerLunar_004] END');
    });

    /**
     * @tc.name   datePickerLunar_005
     * @tc.number SUB_ARKUI_DATEPICKER_LUNAR_PARAM_003
     * @tc.desc   测试DatePicker的lunar属性 - 未设置lunar属性时的默认值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('datePickerLunar_005', Level.LEVEL2, async () => {
      console.info('[datePickerLunar_005] START');

      let strJson: string = getInspectorByKey('datePicker_lunar_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerLunar_005] default lunar value is: " + JSON.stringify(obj.$attrs.lunar));

      // 验证默认值为 false
      let lunarValue: string = obj.$attrs.lunar as string;
      expect(lunarValue).assertEqual('false');

      console.info('[datePickerLunar_005] END');
    });
  })
}
