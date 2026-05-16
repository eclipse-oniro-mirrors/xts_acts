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
 * TextPicker GradientHeight 属性测试用例
 *
 * 测试目标: 验证TextPicker组件的gradientHeight属性功能
 * 测试覆盖:
 * 1. 百分比值 (50%)
 * 2. 数值 (36)
 * 3. 默认值 (未设置gradientHeight)
 * 4. null 参数测试 (应恢复为默认值)
 * 5. undefined 参数测试 (应恢复为默认值)
 * 6. 数值-10 (负数，应使用默认值)
 * 7. 数值-0 (零值，应使用默认值)
 *
 * 注意事项：
 * - gradientHeight属性类型为Dimension（支持百分比和数字+单位）
 * - API 12+ 版本支持
 * - 设置内容区上下边缘的渐隐高度
 * - 50%为TextPicker高度的一半
 * - 百分比值只支持0-100
 * - 负数和零值会使用默认值
 */

import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';

export default function TextPickerGradientHeightNullUndefinedTest() {
  describe('TextPickerGradientHeightNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textPickerUndefinedNull/TextPickerGradientHeightNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get TextPickerGradientHeightNullUndefinedTest state success ' + JSON.stringify(pages));
        if (!('TextPickerGradientHeightNullUndefined' == pages.name)) {
          console.info('get TextStyle state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info('push TextPickerGradientHeightNullUndefinedTest page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push TextPickerGradientHeightNullUndefinedTest page error ' + JSON.stringify(err));
      }
      done()
    });

    /**
     * @tc.name   textPickerGradientHeight_001
     * @tc.number SUB_ARKUI_TEXTPICKER_GRADIENTHEIGHT_NULL_001
     * @tc.desc   测试TextPicker的gradientHeight属性 - null参数应恢复为默认值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textPickerGradientHeight_001', Level.LEVEL0, async () => {
      console.info('[textPickerGradientHeight_001] START');

      // 获取默认值组件的属性
      let strJsonCompare: string = getInspectorByKey('textPicker_gradientHeight_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      // 获取null参数组件的属性
      let strJson: string = getInspectorByKey('textPicker_gradientHeight_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textPickerGradientHeight_001] default gradientHeight value is: " + JSON.stringify(objCompare.$attrs.gradientHeight));
      console.info("[textPickerGradientHeight_001] null gradientHeight value is: " + JSON.stringify(obj.$attrs.gradientHeight));

      // null 应该恢复为默认值，两者应该相等
      expect(obj.$attrs.gradientHeight).assertEqual(objCompare.$attrs.gradientHeight);

      console.info('[textPickerGradientHeight_001] END');
    });

    /**
     * @tc.name   textPickerGradientHeight_002
     * @tc.number SUB_ARKUI_TEXTPICKER_GRADIENTHEIGHT_UNDEFINED_001
     * @tc.desc   测试TextPicker的gradientHeight属性 - undefined参数应恢复为默认值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textPickerGradientHeight_002', Level.LEVEL0, async () => {
      console.info('[textPickerGradientHeight_002] START');

      // 获取默认值组件的属性
      let strJsonCompare: string = getInspectorByKey('textPicker_gradientHeight_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      // 获取undefined参数组件的属性
      let strJson: string = getInspectorByKey('textPicker_gradientHeight_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textPickerGradientHeight_002] default gradientHeight value is: " + JSON.stringify(objCompare.$attrs.gradientHeight));
      console.info("[textPickerGradientHeight_002] undefined gradientHeight value is: " + JSON.stringify(obj.$attrs.gradientHeight));

      // undefined 应该恢复为默认值，两者应该相等
      expect(obj.$attrs.gradientHeight).assertEqual(objCompare.$attrs.gradientHeight);

      console.info('[textPickerGradientHeight_002] END');
    });
  })
}
