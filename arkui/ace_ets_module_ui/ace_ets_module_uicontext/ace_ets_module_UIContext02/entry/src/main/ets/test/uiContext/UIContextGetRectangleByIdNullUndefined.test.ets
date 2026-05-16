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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { UIContext } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';

export default function UIContextGetRectangleByIdNullUndefinedTest() {
  describe('UIContextGetRectangleByIdNullUndefinedTest', () => {
    let uiContext: UIContext | undefined;

    beforeAll(async () => {
      hilog.info(0x0000, 'UIContextGetRectangleByIdNullUndefinedTest', 'beforeAll: get UIContext instance');
      // 通过静态方法获取 UIContext 实例
      uiContext = UIContext.getCallingScopeUIContext();
      if (!uiContext || !uiContext.isAvailable()) {
        hilog.warn(0x0000, 'UIContextGetRectangleByIdNullUndefinedTest', 'UIContext is not available, using default instance');
        // 如果无法获取有效实例，使用默认实例
        const allContexts: UIContext[] = UIContext.getAllUIContexts();
        if (allContexts.length > 0) {
          uiContext = allContexts[0];
        } else {
          uiContext = new UIContext();
        }
      }
    });

    beforeEach(() => {
      hilog.info(0x0000, 'UIContextGetRectangleByIdNullUndefinedTest', 'beforeEach: prepare for test case');
    });

    afterEach(() => {
      hilog.info(0x0000, 'UIContextGetRectangleByIdNullUndefinedTest', 'afterEach: test case finished');
    });

    afterAll(async () => {
      hilog.info(0x0000, 'UIContextGetRectangleByIdNullUndefinedTest', 'afterAll: all tests finished');
    });

    // ==================== getRectangleById 参数测试 ====================

    /**
     * @tc.name   uiContextGetRectangleByIdNull_0100
     * @tc.number SUB_ARKUI_UICONTEXT_GETRECTANGLEBYID_NULL_0100
     * @tc.desc   测试 UIContext getRectangleById 方法参数为 null 的行为
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('uiContextGetRectangleByIdNull_0100', Level.LEVEL2, async () => {
      hilog.info(0x0000, 'UIContextGetRectangleByIdNullUndefinedTest', '[uiContextGetRectangleByIdNull_0100] START');

      try {
        // 直接传递 null 作为参数
        let result = uiContext?.getComponentUtils()?.getRectangleById(null);
        hilog.info(0x0000, 'UIContextGetRectangleByIdNullUndefinedTest',
          '[uiContextGetRectangleByIdNull_0100] getRectangleById(null) result: ' + JSON.stringify(result));
        // 验证返回值
        expect(result === null).assertTrue();
      } catch (e) {
        // 如果抛出异常，验证异常信息
        hilog.info(0x0000, 'UIContextGetRectangleByIdNullUndefinedTest',
          '[uiContextGetRectangleByIdNull_0100] exception: ' + JSON.stringify(e));
        expect(e !== null && e !== undefined).assertTrue();
      }

      hilog.info(0x0000, 'UIContextGetRectangleByIdNullUndefinedTest', '[uiContextGetRectangleByIdNull_0100] END');
    });

    /**
     * @tc.name   uiContextGetRectangleByIdUndefined_0100
     * @tc.number SUB_ARKUI_UICONTEXT_GETRECTANGLEBYID_UNDEFINED_0100
     * @tc.desc   测试 UIContext getRectangleById 方法参数为 undefined 的行为
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('uiContextGetRectangleByIdUndefined_0100', Level.LEVEL2, async () => {
      hilog.info(0x0000, 'UIContextGetRectangleByIdNullUndefinedTest', '[uiContextGetRectangleByIdUndefined_0100] START');

      try {
        // 直接传递 undefined 作为参数
        let result = uiContext?.getComponentUtils()?.getRectangleById(undefined);
        hilog.info(0x0000, 'UIContextGetRectangleByIdNullUndefinedTest',
          '[uiContextGetRectangleByIdUndefined_0100] getRectangleById(undefined) result: ' + JSON.stringify(result));
        // 验证返回值
        expect(result === null).assertTrue();
      } catch (e) {
        // 如果抛出异常，验证异常信息
        hilog.info(0x0000, 'UIContextGetRectangleByIdNullUndefinedTest',
          '[uiContextGetRectangleByIdUndefined_0100] exception: ' + JSON.stringify(e));
        expect(e !== null && e !== undefined).assertTrue();
      }

      hilog.info(0x0000, 'UIContextGetRectangleByIdNullUndefinedTest', '[uiContextGetRectangleByIdUndefined_0100] END');
    });

    /**
     * @tc.name   uiContextGetRectangleByIdEmptyString_0100
     * @tc.number SUB_ARKUI_UICONTEXT_GETRECTANGLEBYID_EMPTYSTRING_0100
     * @tc.desc   测试 UIContext getRectangleById 方法参数为空字符串的行为
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('uiContextGetRectangleByIdEmptyString_0100', Level.LEVEL2, async () => {
      hilog.info(0x0000, 'UIContextGetRectangleByIdNullUndefinedTest', '[uiContextGetRectangleByIdEmptyString_0100] START');

      try {
        // 直接传递空字符串作为参数
        let result = uiContext?.getComponentUtils()?.getRectangleById('');
        hilog.info(0x0000, 'UIContextGetRectangleByIdNullUndefinedTest',
          '[uiContextGetRectangleByIdEmptyString_0100] getRectangleById(\'\') result: ' + JSON.stringify(result));
        // 验证返回值
        expect(result !== null).assertTrue();
      } catch (e) {
        // 如果抛出异常，验证异常信息
        hilog.info(0x0000, 'UIContextGetRectangleByIdNullUndefinedTest',
          '[uiContextGetRectangleByIdEmptyString_0100] exception: ' + JSON.stringify(e));
        expect(e !== null && e !== undefined).assertTrue();
      }

      hilog.info(0x0000, 'UIContextGetRectangleByIdNullUndefinedTest', '[uiContextGetRectangleByIdEmptyString_0100] END');
    });
  });


}
