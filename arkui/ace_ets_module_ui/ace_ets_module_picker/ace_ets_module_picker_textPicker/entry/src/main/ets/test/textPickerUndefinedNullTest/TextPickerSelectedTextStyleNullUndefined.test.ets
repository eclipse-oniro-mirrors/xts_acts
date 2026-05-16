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
 * TextPicker SelectedTextStyle 属性测试用例
 *
 * 测试目标: 验证TextPicker组件的selectedTextStyle属性功能
 * 测试覆盖:
 * 1. 完整PickerTextStyle (color + font)
 * 2. 只设置color
 * 3. 只设置font中的size
 * 4. 只设置font中的weight
 * 5. 不同color格式 (Color枚举, 十六进制, 带alpha)
 * 6. 不同weight类型 (FontWeight枚举, number, string)
 * 7. 不同size类型 (number, string)
 * 8. 空对象 {}
 * 9. null 参数测试
 * 10. undefined 参数测试
 * 11. 默认值 (未设置selectedTextStyle)
 *
 * 注意事项：
 * - selectedTextStyle属性类型为PickerTextStyle
 * - PickerTextStyle包含color和font两个属性
 * - 默认值：{ color: '#ff007dff', font: { size: '20fp', weight: FontWeight.Medium } }
 * - API 10+ 版本支持
 * - API 18+ 支持Optional类型，undefined时使用默认值
 * - API 20+ 支持TextPickerTextStyle类型
 * - Wearable设备上使用无效果
 */

import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';

export default function TextPickerSelectedTextStyleNullUndefinedTest() {
  describe('TextPickerSelectedTextStyleNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textPickerUndefinedNull/TextPickerSelectedTextStyleNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get TextPickerSelectedTextStyleNullUndefinedTest state success ' + JSON.stringify(pages));
        if (!('TextPickerSelectedTextStyleNullUndefined' == pages.name)) {
          console.info('get TextStyle state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info('push TextPickerSelectedTextStyleNullUndefinedTest page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push TextPickerSelectedTextStyleNullUndefinedTest page error ' + JSON.stringify(err));
      }
      done()
    });

    /**
     * @tc.name   textPickerSelectedTextStyle_001
     * @tc.number SUB_ARKUI_TEXTPICKER_SELECTEDTEXTSTYLE_PARAM_001
     * @tc.desc   测试TextPicker的selectedTextStyle属性 - 空对象{}
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textPickerSelectedTextStyle_001', Level.LEVEL2, async () => {
      console.info('[textPickerSelectedTextStyle_001] START');

      // 获取默认值组件的属性
      let strJsonDefault: string = getInspectorByKey('textPicker_selectedTextStyle_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      // 获取空对象{}参数组件的属性
      let strJson: string = getInspectorByKey('textPicker_selectedTextStyle_empty_object');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textPickerSelectedTextStyle_001] default selectedTextStyle value is: " + JSON.stringify(obj.$attrs.selectedTextStyle));
      console.info("[textPickerSelectedTextStyle_001] {} selectedTextStyle value is: " + JSON.stringify(obj.$attrs.selectedTextStyle));

      // 验证属性值存在
      expect(obj.$attrs.selectedTextStyle.color).assertEqual(objDefault.$attrs.selectedTextStyle.color);
      expect(obj.$attrs.selectedTextStyle.font.size).assertEqual(objDefault.$attrs.selectedTextStyle.font.size);
      expect(obj.$attrs.selectedTextStyle.font.weight).assertEqual(objDefault.$attrs.selectedTextStyle.font.weight);

      console.info('[textPickerSelectedTextStyle_001] END');
    });

    /**
     * @tc.name   textPickerSelectedTextStyle_002
     * @tc.number SUB_ARKUI_TEXTPICKER_SELECTEDTEXTSTYLE_NULL_001
     * @tc.desc   测试TextPicker的selectedTextStyle属性 - null参数应恢复为默认值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textPickerSelectedTextStyle_002', Level.LEVEL2, async () => {
      console.info('[textPickerSelectedTextStyle_002] START');

      // 获取默认值组件的属性
      let strJsonDefault: string = getInspectorByKey('textPicker_selectedTextStyle_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      // 获取null参数组件的属性
      let strJson: string = getInspectorByKey('textPicker_selectedTextStyle_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textPickerSelectedTextStyle_002] default selectedTextStyle value is: " + JSON.stringify(objDefault.$attrs.selectedTextStyle));
      console.info("[textPickerSelectedTextStyle_002] null selectedTextStyle value is: " + JSON.stringify(obj.$attrs.selectedTextStyle));

      // null 应该恢复为默认值，验证属性值存在
      expect(obj.$attrs.selectedTextStyle.color).assertEqual(objDefault.$attrs.selectedTextStyle.color);
      expect(obj.$attrs.selectedTextStyle.font.size).assertEqual(objDefault.$attrs.selectedTextStyle.font.size);
      expect(obj.$attrs.selectedTextStyle.font.weight).assertEqual(objDefault.$attrs.selectedTextStyle.font.weight);

      console.info('[textPickerSelectedTextStyle_002] END');
    });

    /**
     * @tc.name   textPickerSelectedTextStyle_003
     * @tc.number SUB_ARKUI_TEXTPICKER_SELECTEDTEXTSTYLE_UNDEFINED_001
     * @tc.desc   测试TextPicker的selectedTextStyle属性 - undefined参数应使用默认值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textPickerSelectedTextStyle_003', Level.LEVEL2, async () => {
      console.info('[textPickerSelectedTextStyle_003] START');

      // 获取默认值组件的属性
      let strJsonDefault: string = getInspectorByKey('textPicker_selectedTextStyle_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      // 获取undefined参数组件的属性
      let strJson: string = getInspectorByKey('textPicker_selectedTextStyle_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textPickerSelectedTextStyle_003] default selectedTextStyle value is: " + JSON.stringify(objDefault.$attrs.selectedTextStyle));
      console.info("[textPickerSelectedTextStyle_003] undefined selectedTextStyle value is: " + JSON.stringify(obj.$attrs.selectedTextStyle));

      // undefined 应该使用默认值，验证属性值存在
      expect(obj.$attrs.selectedTextStyle.color).assertEqual(objDefault.$attrs.selectedTextStyle.color);
      expect(obj.$attrs.selectedTextStyle.font.size).assertEqual(objDefault.$attrs.selectedTextStyle.font.size);
      expect(obj.$attrs.selectedTextStyle.font.weight).assertEqual(objDefault.$attrs.selectedTextStyle.font.weight);

      console.info('[textPickerSelectedTextStyle_003] END');
    });
  })
}
