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
 * TextPicker DisappearTextStyle 属性测试用例
 *
 * 测试目标: 验证TextPicker组件的disappearTextStyle属性功能
 * 测试覆盖:
 * 1. 完整PickerTextStyle (color + font)
 * 2. 只设置color
 * 3. 只设置font中的size
 * 4. 只设置font中的weight
 * 5. 不同color格式 (Color枚举, 十六进制, 带alpha)
 * 6. 不同weight类型 (FontWeight枚举, number)
 * 7. 不同size类型 (number, string)
 * 8. 空对象 {}
 * 9. null 参数测试
 * 10. undefined 参数测试
 * 11. 默认值 (未设置disappearTextStyle)
 *
 * 注意事项：
 * - disappearTextStyle属性类型为PickerTextStyle
 * - PickerTextStyle包含color和font两个属性
 * - 默认值：{ color: '#ff182431', font: { size: '14fp', weight: FontWeight.Regular } }
 * - API 10+ 版本支持
 * - API 18+ 支持Optional类型，undefined时使用默认值
 * - API 20+ 支持TextPickerTextStyle类型
 */

import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';

export default function TextPickerDisappearTextStyleNullUndefinedTest() {
  describe('TextPickerDisappearTextStyleNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textPickerUndefinedNull/TextPickerDisappearTextStyleNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get TextPickerDisappearTextStyleNullUndefinedTest state success ' + JSON.stringify(pages));
        if (!('TextPickerDisappearTextStyleNullUndefined' == pages.name)) {
          console.info('get TextStyle state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info('push TextPickerDisappearTextStyleNullUndefinedTest page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push TextPickerDisappearTextStyleNullUndefinedTest page error ' + JSON.stringify(err));
      }
      done()
    });

    /**
     * @tc.name   textPickerDisappearTextStyle_001
     * @tc.number SUB_ARKUI_TEXTPICKER_DISAPPEARTEXTSTYLE_PARAM_001
     * @tc.desc   测试TextPicker的disappearTextStyle属性 - 空对象{}
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textPickerDisappearTextStyle_001', Level.LEVEL2, async () => {
      console.info('[textPickerDisappearTextStyle_001] START');

      // 获取默认值组件的属性
      let strJsonDefault: string = getInspectorByKey('textPicker_disappearTextStyle_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      // 获取空对象{}参数组件的属性
      let strJson: string = getInspectorByKey('textPicker_disappearTextStyle_empty_object');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textPickerDisappearTextStyle_001] default disappearTextStyle value is: " + JSON.stringify(objDefault.$attrs.disappearTextStyle));
      console.info("[textPickerDisappearTextStyle_001] {} disappearTextStyle value is: " + JSON.stringify(obj.$attrs.disappearTextStyle));

      // 验证属性值相等
      expect(obj.$attrs.disappearTextStyle.color).assertEqual(objDefault.$attrs.disappearTextStyle.color);
      expect(obj.$attrs.disappearTextStyle.font.size).assertEqual(objDefault.$attrs.disappearTextStyle.font.size);
      expect(obj.$attrs.disappearTextStyle.font.weight).assertEqual(objDefault.$attrs.disappearTextStyle.font.weight);

      console.info('[textPickerDisappearTextStyle_001] END');
    });

    /**
     * @tc.name   textPickerDisappearTextStyle_002
     * @tc.number SUB_ARKUI_TEXTPICKER_DISAPPEARTEXTSTYLE_NULL_001
     * @tc.desc   测试TextPicker的disappearTextStyle属性 - null参数应恢复为默认值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textPickerDisappearTextStyle_002', Level.LEVEL2, async () => {
      console.info('[textPickerDisappearTextStyle_002] START');

      // 获取默认值组件的属性
      let strJsonDefault: string = getInspectorByKey('textPicker_disappearTextStyle_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      // 获取null参数组件的属性
      let strJson: string = getInspectorByKey('textPicker_disappearTextStyle_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textPickerDisappearTextStyle_002] default disappearTextStyle value is: " + JSON.stringify(objDefault.$attrs.disappearTextStyle));
      console.info("[textPickerDisappearTextStyle_002] null disappearTextStyle value is: " + JSON.stringify(obj.$attrs.disappearTextStyle));

      // null 应该恢复为默认值，验证属性值存在
      expect(obj.$attrs.disappearTextStyle.color).assertEqual(objDefault.$attrs.disappearTextStyle.color);
      expect(obj.$attrs.disappearTextStyle.font.size).assertEqual(objDefault.$attrs.disappearTextStyle.font.size);
      expect(obj.$attrs.disappearTextStyle.font.weight).assertEqual(objDefault.$attrs.disappearTextStyle.font.weight);

      console.info('[textPickerDisappearTextStyle_002] END');
    });

    /**
     * @tc.name   textPickerDisappearTextStyle_003
     * @tc.number SUB_ARKUI_TEXTPICKER_DISAPPEARTEXTSTYLE_UNDEFINED_001
     * @tc.desc   测试TextPicker的disappearTextStyle属性 - undefined参数应使用默认值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textPickerDisappearTextStyle_003', Level.LEVEL2, async () => {
      console.info('[textPickerDisappearTextStyle_003] START');

      // 获取默认值组件的属性
      let strJsonDefault: string = getInspectorByKey('textPicker_disappearTextStyle_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      // 获取undefined参数组件的属性
      let strJson: string = getInspectorByKey('textPicker_disappearTextStyle_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textPickerDisappearTextStyle_003] default disappearTextStyle value is: " + JSON.stringify(objDefault.$attrs.disappearTextStyle));
      console.info("[textPickerDisappearTextStyle_003] undefined disappearTextStyle value is: " + JSON.stringify(obj.$attrs.disappearTextStyle));

      // undefined 应该使用默认值，验证属性值存在
      expect(obj.$attrs.disappearTextStyle.color).assertEqual(objDefault.$attrs.disappearTextStyle.color);
      expect(obj.$attrs.disappearTextStyle.font.size).assertEqual(objDefault.$attrs.disappearTextStyle.font.size);
      expect(obj.$attrs.disappearTextStyle.font.weight).assertEqual(objDefault.$attrs.disappearTextStyle.font.weight);

      console.info('[textPickerDisappearTextStyle_003] END');
    });
  })
}
