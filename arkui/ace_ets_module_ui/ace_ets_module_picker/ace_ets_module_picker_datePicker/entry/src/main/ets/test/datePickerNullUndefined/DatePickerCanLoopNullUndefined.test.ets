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
 * DatePicker CanLoop 属性测试用例
 *
 * 测试目标: 验证DatePicker组件的canLoop属性功能
 * 测试覆盖:
 * 1. canLoop = true (默认值)
 * 2. canLoop = false
 * 3. null 参数测试 (应恢复为默认值true)
 * 4. undefined 参数测试 (应恢复为默认值true)
 *
 * 注意事项：
 * - canLoop属性类型为Optional<boolean>，不是字符串，不需要测试空字符串''
 * - 默认值为 true
 * - API 20+ 版本支持，用于设置是否可循环滚动
 * - 当isLoop为true时，可循环滚动，年份随着月份的循环滚动进行联动加减
 * - 当isLoop为false时，不可循环滚动，到达顶部或底部时无法再滚动
 */

import router from '@ohos.router';
import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from "@ohos/hypium"
import { Component, Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function DatePickerCanLoopNullUndefinedTest() {
  describe('DatePickerCanLoopNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("DatePickerCanLoopNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/datePickerNullUndefined/DatePickerCanLoopNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get DatePickerCanLoopNullUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("DatePickerCanLoopNullUndefined" == pages.name)) {
          console.info("get DatePickerCanLoopNullUndefinedTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push DatePickerCanLoopNullUndefinedTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push DatePickerCanLoopNullUndefinedTest page error:" + err);
      }
      console.info("DatePickerCanLoopNullUndefinedTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   datePickerCanLoop_001
     * @tc.number SUB_ARKUI_DATEPICKER_CANLOOP_PARAM_001
     * @tc.desc   测试DatePicker的canLoop属性 - canLoop = true (默认值)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('datePickerCanLoop_001', Level.LEVEL2, async () => {
      console.info('[datePickerCanLoop_001] START');

      let strJson: string = getInspectorByKey('datePicker_canLoop_true');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerCanLoop_001] canLoop value is: " + JSON.stringify(obj.$attrs.canLoop));

      // 验证属性值为 true
      let canLoopValue: string = obj.$attrs.canLoop as string;
      expect(canLoopValue).assertEqual('true');

      console.info('[datePickerCanLoop_001] END');
    });

    /**
     * @tc.name   datePickerCanLoop_002
     * @tc.number SUB_ARKUI_DATEPICKER_CANLOOP_PARAM_002
     * @tc.desc   测试DatePicker的canLoop属性 - canLoop = false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('datePickerCanLoop_002', Level.LEVEL2, async () => {
      console.info('[datePickerCanLoop_002] START');

      let strJson: string = getInspectorByKey('datePicker_canLoop_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerCanLoop_002] canLoop value is: " + JSON.stringify(obj.$attrs.canLoop));

      // 验证属性值为 false
      let canLoopValue: string = obj.$attrs.canLoop as string;
      expect(canLoopValue).assertEqual('false');

      console.info('[datePickerCanLoop_002] END');
    });

    /**
     * @tc.name   datePickerCanLoop_003
     * @tc.number SUB_ARKUI_DATEPICKER_CANLOOP_NULL_001
     * @tc.desc   测试DatePicker的canLoop属性 - null参数应恢复为默认值true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('datePickerCanLoop_003', Level.LEVEL2, async () => {
      console.info('[datePickerCanLoop_003] START');

      // 获取默认值组件的属性
      let strJsonCompare: string = getInspectorByKey('datePicker_canLoop_true');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      // 获取null参数组件的属性
      let strJson: string = getInspectorByKey('datePicker_canLoop_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerCanLoop_003] default canLoop value is: " + JSON.stringify(objCompare.$attrs.canLoop));
      console.info("[datePickerCanLoop_003] null canLoop value is: " + JSON.stringify(obj.$attrs.canLoop));

      // null 应该恢复为默认值 true
      let canLoopValue: boolean = obj.$attrs.canLoop as boolean;
      let canLoopValueCompare: boolean = objCompare.$attrs.canLoop as boolean;
      expect(canLoopValue).assertEqual(canLoopValueCompare);

      console.info('[datePickerCanLoop_003] END');
    });

    /**
     * @tc.name   datePickerCanLoop_004
     * @tc.number SUB_ARKUI_DATEPICKER_CANLOOP_UNDEFINED_001
     * @tc.desc   测试DatePicker的canLoop属性 - undefined参数应恢复为默认值true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('datePickerCanLoop_004', Level.LEVEL2, async () => {
      console.info('[datePickerCanLoop_004] START');

      // 获取默认值组件的属性
      let strJsonCompare: string = getInspectorByKey('datePicker_canLoop_true');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      // 获取undefined参数组件的属性
      let strJson: string = getInspectorByKey('datePicker_canLoop_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerCanLoop_004] default canLoop value is: " + JSON.stringify(objCompare.$attrs.canLoop));
      console.info("[datePickerCanLoop_004] undefined canLoop value is: " + JSON.stringify(obj.$attrs.canLoop));

      // undefined 应该恢复为默认值 true
      let canLoopValue: boolean = obj.$attrs.canLoop as boolean;
      let canLoopValueCompare: boolean = objCompare.$attrs.canLoop as boolean;
      expect(canLoopValue).assertEqual(canLoopValueCompare);

      console.info('[datePickerCanLoop_004] END');
    });

    /**
     * @tc.name   datePickerCanLoop_005
     * @tc.number SUB_ARKUI_DATEPICKER_CANLOOP_PARAM_003
     * @tc.desc   测试DatePicker的canLoop属性 - 未设置canLoop属性时的默认值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('datePickerCanLoop_005', Level.LEVEL2, async () => {
      console.info('[datePickerCanLoop_005] START');

      let strJson: string = getInspectorByKey('datePicker_canLoop_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[datePickerCanLoop_005] default canLoop value is: " + JSON.stringify(obj.$attrs.canLoop));

      // 验证默认值为 true
      let canLoopValue: string = obj.$attrs.canLoop as string;
      expect(canLoopValue).assertEqual('true');

      console.info('[datePickerCanLoop_005] END');
    });
  })
}
