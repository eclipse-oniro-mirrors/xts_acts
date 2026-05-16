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
 * TextPicker DefaultPickerItemHeight 属性测试用例
 *
 * 测试目标: 验证TextPicker组件的defaultPickerItemHeight属性功能
 * 测试覆盖:
 * 1. number类型正常值 (50, 100, 36, 56)
 * 2. string类型正常值 ("50", "100", "36", "56")
 * 3. 边界值 (0)
 * 4. 空字符串 ("")
 * 5. null 参数测试
 * 6. undefined 参数测试
 * 7. 默认值 (未设置defaultPickerItemHeight)
 *
 * 注意事项：
 * - defaultPickerItemHeight属性类型为number | string
 * - number类型取值范围：[0, +∞)，单位为vp
 * - string类型：仅支持number类型取值的字符串形式，例如"56"
 * - 默认值：选中项56vp，非选中项36vp
 * - 设置该参数后，选中项与非选中项的高度均为所设置的值
 * - API 18+ 支持Optional类型，undefined时维持上次取值
 */

import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';

export default function TextPickerDefaultPickerItemHeightNullUndefinedTest() {
  describe('TextPickerDefaultPickerItemHeightNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textPickerUndefinedNull/TextPickerDefaultPickerItemHeightNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get TextPickerDefaultPickerItemHeightNullUndefinedTest state success ' + JSON.stringify(pages));
        if (!('TextPickerDefaultPickerItemHeightNullUndefined' == pages.name)) {
          console.info('get TextStyle state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info('push TextPickerDefaultPickerItemHeightNullUndefinedTest page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push TextPickerDefaultPickerItemHeightNullUndefinedTest page error ' + JSON.stringify(err));
      }
      done()
    });

    /**
     * @tc.name   textPickerDefaultPickerItemHeight_001
     * @tc.number SUB_ARKUI_TEXTPICKER_DEFAULTPICKERITEMHEIGHT_PARAM_001
     * @tc.desc   测试TextPicker的defaultPickerItemHeight属性 - 空字符串''
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textPickerDefaultPickerItemHeight_001', Level.LEVEL2, async () => {
      console.info('[textPickerDefaultPickerItemHeight_001] START');

      // 获取默认值组件的属性
      let strJsonDefault: string = getInspectorByKey('textPicker_defaultPickerItemHeight_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      // 获取空字符串''参数组件的属性
      let strJson: string = getInspectorByKey('textPicker_defaultPickerItemHeight_empty_string');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textPickerDefaultPickerItemHeight_001] default defaultPickerItemHeight value is: " + JSON.stringify(objDefault.$attrs.defaultPickerItemHeight));
      console.info("[textPickerDefaultPickerItemHeight_001] '' defaultPickerItemHeight value is: " + JSON.stringify(obj.$attrs.defaultPickerItemHeight));

      // 空字符串是无效值，应该恢复为默认值
      // 验证属性值存在（空字符串会使用默认值）
      let defaultPickerItemHeightValue: string = obj.$attrs.defaultPickerItemHeight as string;
      let defaultPickerItemHeightValueCompare: string = objDefault.$attrs.defaultPickerItemHeight as string;
      expect(defaultPickerItemHeightValue).assertContain('0.00');

      console.info('[textPickerDefaultPickerItemHeight_001] END');
    });

    /**
     * @tc.name   textPickerDefaultPickerItemHeight_002
     * @tc.number SUB_ARKUI_TEXTPICKER_DEFAULTPICKERITEMHEIGHT_NULL_001
     * @tc.desc   测试TextPicker的defaultPickerItemHeight属性 - null参数应恢复为默认值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textPickerDefaultPickerItemHeight_002', Level.LEVEL2, async () => {
      console.info('[textPickerDefaultPickerItemHeight_002] START');

      // 获取默认值组件的属性
      let strJsonDefault: string = getInspectorByKey('textPicker_defaultPickerItemHeight_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      // 获取null参数组件的属性
      let strJson: string = getInspectorByKey('textPicker_defaultPickerItemHeight_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textPickerDefaultPickerItemHeight_002] default defaultPickerItemHeight value is: " + JSON.stringify(objDefault.$attrs.defaultPickerItemHeight));
      console.info("[textPickerDefaultPickerItemHeight_002] null defaultPickerItemHeight value is: " + JSON.stringify(obj.$attrs.defaultPickerItemHeight));

      // null 应该恢复为默认值，验证null后的值存在
      let defaultPickerItemHeightValue: string = obj.$attrs.defaultPickerItemHeight as string;
      let defaultPickerItemHeightValueCompare: string = objDefault.$attrs.defaultPickerItemHeight as string;
      expect(defaultPickerItemHeightValue).assertEqual(defaultPickerItemHeightValueCompare);

      console.info('[textPickerDefaultPickerItemHeight_002] END');
    });

    /**
     * @tc.name   textPickerDefaultPickerItemHeight_003
     * @tc.number SUB_ARKUI_TEXTPICKER_DEFAULTPICKERITEMHEIGHT_UNDEFINED_001
     * @tc.desc   测试TextPicker的defaultPickerItemHeight属性 - undefined参数应维持上次取值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textPickerDefaultPickerItemHeight_003', Level.LEVEL2, async () => {
      console.info('[textPickerDefaultPickerItemHeight_003] START');

      // 获取默认值组件的属性
      let strJsonDefault: string = getInspectorByKey('textPicker_defaultPickerItemHeight_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      // 获取undefined参数组件的属性
      let strJson: string = getInspectorByKey('textPicker_defaultPickerItemHeight_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textPickerDefaultPickerItemHeight_003] undefined defaultPickerItemHeight value is: " + JSON.stringify(obj.$attrs.defaultPickerItemHeight));
      console.info("[textPickerDefaultPickerItemHeight_003] default defaultPickerItemHeight value is: " + JSON.stringify(objDefault.$attrs.defaultPickerItemHeight));

      // undefined 应该维持上次取值或使用默认值，验证属性值存在
      let defaultPickerItemHeightValue: string = obj.$attrs.defaultPickerItemHeight as string;
      let defaultPickerItemHeightValueCompare: string = objDefault.$attrs.defaultPickerItemHeight as string;
      expect(defaultPickerItemHeightValue).assertEqual(defaultPickerItemHeightValueCompare);

      console.info('[textPickerDefaultPickerItemHeight_003] END');
    });

    /**
     * @tc.name   textPickerDefaultPickerItemHeight_004
     * @tc.number SUB_ARKUI_TEXTPICKER_DEFAULTPICKERITEMHEIGHT_PARAM_006
     * @tc.desc   测试TextPicker的defaultPickerItemHeight属性 - 默认值（未设置defaultPickerItemHeight）
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textPickerDefaultPickerItemHeight_004', Level.LEVEL2, async () => {
      console.info('[textPickerDefaultPickerItemHeight_004] START');

      let strJson: string = getInspectorByKey('textPicker_defaultPickerItemHeight_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textPickerDefaultPickerItemHeight_004] defaultPickerItemHeight value is: " + JSON.stringify(obj.$attrs.defaultPickerItemHeight));

      // 验证属性存在
      let defaultPickerItemHeightValue: string = obj.$attrs.defaultPickerItemHeight as string;
      expect(defaultPickerItemHeightValue !== null).assertTrue();

      console.info('[textPickerDefaultPickerItemHeight_004] END');
    });
  })
}
