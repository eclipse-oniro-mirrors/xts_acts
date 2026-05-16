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
 * TextPicker SelectedBackgroundStyle 属性测试用例
 *
 * 测试目标: 验证TextPicker组件的selectedBackgroundStyle属性功能
 * 测试覆盖:
 * 1. 完整PickerBackgroundStyle (color + borderRadius)
 * 2. 只设置color
 * 3. 只设置borderRadius（LengthMetrics类型）
 * 4. 只设置borderRadius（BorderRadiuses类型）
 * 5. 只设置borderRadius（LocalizedBorderRadiuses类型）
 * 6. 不同color格式 (枚举, 十六进制, 短格式, 带alpha)
 * 7. 不同borderRadius值 (0, 15, 30)
 * 8. 空对象 {}
 * 9. null 参数测试
 * 10. undefined 参数测试
 * 11. 默认值 (未设置selectedBackgroundStyle)
 *
 * 注意事项：
 * - selectedBackgroundStyle属性类型为PickerBackgroundStyle
 * - PickerBackgroundStyle包含color和borderRadius两个属性
 * - 默认值：{ color: $r('sys.color.comp_background_tertiary'), borderRadius: { value:24, unit:LengthUnit.VP } }
 * - borderRadius支持三种类型：LengthMetrics、BorderRadiuses、LocalizedBorderRadiuses
 * - API 20+ 版本支持
 * - 设置选中项的背景的颜色和边框圆角半径
 * - 多列模式时会同时设置所有列的选中项背景的颜色和圆角半径
 */

import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';

export default function TextPickerSelectedBackgroundStyleNullUndefinedTest() {
  describe('TextPickerSelectedBackgroundStyleNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textPickerUndefinedNull/TextPickerSelectedBackgroundStyleNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get TextPickerSelectedBackgroundStyleNullUndefinedTest state success ' + JSON.stringify(pages));
        if (!('TextPickerSelectedBackgroundStyleNullUndefined' == pages.name)) {
          console.info('get TextStyle state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info('push TextPickerSelectedBackgroundStyleNullUndefinedTest page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push TextPickerSelectedBackgroundStyleNullUndefinedTest page error ' + JSON.stringify(err));
      }
      done()
    });

    /**
     * @tc.name   textPickerSelectedBackgroundStyle_001
     * @tc.number SUB_ARKUI_TEXTPICKER_SELECTEDBACKGROUNDSTYLE_PARAM_010
     * @tc.desc   测试TextPicker的selectedBackgroundStyle属性 - 空对象{}
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textPickerSelectedBackgroundStyle_001', Level.LEVEL2, async () => {
      console.info('[textPickerSelectedBackgroundStyle_001] START');

      // 获取默认值组件的属性
      let strJsonDefault: string = getInspectorByKey('textPicker_selectedBackgroundStyle_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      // 获取空对象{}参数组件的属性
      let strJson: string = getInspectorByKey('textPicker_selectedBackgroundStyle_empty_object');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textPickerSelectedBackgroundStyle_001] default selectedBackgroundStyle value is: " + JSON.stringify(objDefault.$attrs.selectedBackgroundStyle));
      console.info("[textPickerSelectedBackgroundStyle_001] {} selectedBackgroundStyle value is: " + JSON.stringify(obj.$attrs.selectedBackgroundStyle));

      // 验证属性值存在
      expect(obj.$attrs.selectedBackgroundStyle.color).assertEqual(objDefault.$attrs.selectedBackgroundStyle.color);
      expect(obj.$attrs.selectedBackgroundStyle.borderRadius).assertEqual(objDefault.$attrs.selectedBackgroundStyle.borderRadius);

      console.info('[textPickerSelectedBackgroundStyle_001] END');
    });

    /**
     * @tc.name   textPickerSelectedBackgroundStyle_002
     * @tc.number SUB_ARKUI_TEXTPICKER_SELECTEDBACKGROUNDSTYLE_NULL_001
     * @tc.desc   测试TextPicker的selectedBackgroundStyle属性 - null参数应恢复为默认值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textPickerSelectedBackgroundStyle_002', Level.LEVEL2, async () => {
      console.info('[textPickerSelectedBackgroundStyle_002] START');

      // 获取默认值组件的属性
      let strJsonDefault: string = getInspectorByKey('textPicker_selectedBackgroundStyle_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      // 获取null参数组件的属性
      let strJson: string = getInspectorByKey('textPicker_selectedBackgroundStyle_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textPickerSelectedBackgroundStyle_002] default selectedBackgroundStyle value is: " + JSON.stringify(objDefault.$attrs.selectedBackgroundStyle));
      console.info("[textPickerSelectedBackgroundStyle_002] null selectedBackgroundStyle value is: " + JSON.stringify(obj.$attrs.selectedBackgroundStyle));

      // null 应该恢复为默认值，验证属性值存在
      expect(obj.$attrs.selectedBackgroundStyle.color).assertEqual(objDefault.$attrs.selectedBackgroundStyle.color);
      expect(obj.$attrs.selectedBackgroundStyle.borderRadius).assertEqual(objDefault.$attrs.selectedBackgroundStyle.borderRadius);

      console.info('[textPickerSelectedBackgroundStyle_002] END');
    });

    /**
     * @tc.name   textPickerSelectedBackgroundStyle_003
     * @tc.number SUB_ARKUI_TEXTPICKER_SELECTEDBACKGROUNDSTYLE_UNDEFINED_001
     * @tc.desc   测试TextPicker的selectedBackgroundStyle属性 - undefined参数应使用默认值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textPickerSelectedBackgroundStyle_003', Level.LEVEL2, async () => {
      console.info('[textPickerSelectedBackgroundStyle_003] START');

      // 获取默认值组件的属性
      let strJsonDefault: string = getInspectorByKey('textPicker_selectedBackgroundStyle_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      // 获取undefined参数组件的属性
      let strJson: string = getInspectorByKey('textPicker_selectedBackgroundStyle_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textPickerSelectedBackgroundStyle_003] default selectedBackgroundStyle value is: " + JSON.stringify(objDefault.$attrs.selectedBackgroundStyle));
      console.info("[textPickerSelectedBackgroundStyle_003] undefined selectedBackgroundStyle value is: " + JSON.stringify(obj.$attrs.selectedBackgroundStyle));

      // undefined 应该使用默认值，验证属性值存在
      expect(obj.$attrs.selectedBackgroundStyle.color).assertEqual(objDefault.$attrs.selectedBackgroundStyle.color);
      expect(obj.$attrs.selectedBackgroundStyle.borderRadius).assertEqual(objDefault.$attrs.selectedBackgroundStyle.borderRadius);

      console.info('[textPickerSelectedBackgroundStyle_003] END');
    });
  })
}
