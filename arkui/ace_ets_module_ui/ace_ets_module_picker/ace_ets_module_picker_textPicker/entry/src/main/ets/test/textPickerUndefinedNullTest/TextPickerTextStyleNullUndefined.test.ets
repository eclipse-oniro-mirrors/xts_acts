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
 * TextPicker TextStyle 属性测试用例
 *
 * 测试目标: 验证TextPicker组件的textStyle属性功能
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
 * 11. 默认值 (未设置textStyle)
 *
 * 注意事项：
 * - textStyle属性类型为PickerTextStyle
 * - PickerTextStyle包含color和font两个属性
 * - 默认值：{ color: '#ff182431', font: { size: '16fp', weight: FontWeight.Regular } }
 * - API 10+ 版本支持
 * - API 18+ 支持Optional类型，undefined时使用默认值
 * - API 20+ 支持TextPickerTextStyle类型
 */

import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';

export default function TextPickerTextStyleNullUndefinedTest() {
  describe('TextPickerTextStyleNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textPickerUndefinedNull/TextPickerTextStyleNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get TextPickerTextStyleNullUndefinedTest state success ' + JSON.stringify(pages));
        if (!('TextPickerTextStyleNullUndefined' == pages.name)) {
          console.info('get TextStyle state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info('push TextPickerTextStyleNullUndefinedTest page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push TextPickerTextStyleNullUndefinedTest page error ' + JSON.stringify(err));
      }
      done()
    });

    /**
     * @tc.name   textPickerTextStyle_001
     * @tc.number SUB_ARKUI_TEXTPICKER_TEXTSTYLE_NULL_001
     * @tc.desc   测试TextPicker的textStyle属性 - null参数应恢复为默认值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textPickerTextStyle_001', Level.LEVEL2, async () => {
      console.info('[textPickerTextStyle_001] START');

      // 获取默认值组件的属性
      let strJsonDefault: string = getInspectorByKey('textPicker_textStyle_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      // 获取null参数组件的属性
      let strJson: string = getInspectorByKey('textPicker_textStyle_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textPickerTextStyle_001] default textStyle value is: " + JSON.stringify(objDefault.$attrs.textStyle));
      console.info("[textPickerTextStyle_001] null textStyle value is: " + JSON.stringify(obj.$attrs.textStyle));

      // null 应该恢复为默认值，验证属性值存在
      expect(obj.$attrs.textStyle.color).assertEqual(objDefault.$attrs.textStyle.color);
      expect(obj.$attrs.textStyle.font.size).assertEqual(objDefault.$attrs.textStyle.font.size);
      expect(obj.$attrs.textStyle.font.weight).assertEqual(objDefault.$attrs.textStyle.font.weight);

      console.info('[textPickerTextStyle_001] END');
    });

    /**
     * @tc.name   textPickerTextStyle_002
     * @tc.number SUB_ARKUI_TEXTPICKER_TEXTSTYLE_UNDEFINED_001
     * @tc.desc   测试TextPicker的textStyle属性 - undefined参数应使用默认值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textPickerTextStyle_002', Level.LEVEL2, async () => {
      console.info('[textPickerTextStyle_002] START');

      // 获取默认值组件的属性
      let strJsonDefault: string = getInspectorByKey('textPicker_textStyle_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      // 获取undefined参数组件的属性
      let strJson: string = getInspectorByKey('textPicker_textStyle_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textPickerTextStyle_002] default textStyle value is: " + JSON.stringify(objDefault.$attrs.textStyle));
      console.info("[textPickerTextStyle_002] undefined textStyle value is: " + JSON.stringify(obj.$attrs.textStyle));

      // undefined 应该使用默认值，验证属性值存在
      expect(obj.$attrs.textStyle.color).assertEqual(objDefault.$attrs.textStyle.color);
      expect(obj.$attrs.textStyle.font.size).assertEqual(objDefault.$attrs.textStyle.font.size);
      expect(obj.$attrs.textStyle.font.weight).assertEqual(objDefault.$attrs.textStyle.font.weight);

      console.info('[textPickerTextStyle_002] END');
    });
  })
}
