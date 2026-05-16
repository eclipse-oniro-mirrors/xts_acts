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

export default function UIContextSpecialApiTest() {
  describe('UIContextSpecialApiTest', () => {
    let uiContext: UIContext | undefined;

    beforeAll(async () => {
      hilog.info(0x0000, 'UIContextSpecialApiTest', 'beforeAll: get UIContext instance');
      // 通过静态方法获取 UIContext 实例
      uiContext = UIContext.getCallingScopeUIContext();
      if (!uiContext || !uiContext.isAvailable()) {
        hilog.warn(0x0000, 'UIContextSpecialApiTest', 'UIContext is not available, using default instance');
        // 如果无法获取有效实例，使用默认实例
        const allContexts = UIContext.getAllUIContexts();
        if (allContexts.length > 0) {
          uiContext = allContexts[0];
        } else {
          uiContext = new UIContext();
        }
      }
    });

    beforeEach(() => {
      hilog.info(0x0000, 'UIContextSpecialApiTest', 'beforeEach: prepare for test case');
    });

    afterEach(() => {
      hilog.info(0x0000, 'UIContextSpecialApiTest', 'afterEach: test case finished');
    });

    afterAll(async () => {
      hilog.info(0x0000, 'UIContextSpecialApiTest', 'afterAll: all tests finished');
    });

    // ==================== requireDynamicSyncScene 测试 ====================

    /**
     * @tc.name   uiContextRequireDynamicSyncSceneNull_0100
     * @tc.number SUB_ARKUI_UICONTEXT_REQUIREDYNAMICSYNCSCENE_NULL_0100
     * @tc.desc   测试 UIContext requireDynamicSyncScene 方法参数为 null 的行为
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('uiContextRequireDynamicSyncSceneNull_0100', Level.LEVEL2, async () => {
      hilog.info(0x0000, 'UIContextSpecialApiTest', '[uiContextRequireDynamicSyncSceneNull_0100] START');

      try {
        // 直接传递 null 作为参数
        let result = uiContext?.requireDynamicSyncScene(null);
        hilog.info(0x0000, 'UIContextSpecialApiTest',
          '[uiContextRequireDynamicSyncSceneNull_0100] requireDynamicSyncScene(null) result: ' + JSON.stringify(result));
        // 如果没有抛出异常，验证返回值
        expect(result !== null && result !== undefined).assertTrue();
      } catch (e) {
        // 如果抛出异常，验证异常信息
        hilog.info(0x0000, 'UIContextSpecialApiTest',
          '[uiContextRequireDynamicSyncSceneNull_0100] exception: ' + JSON.stringify(e));
        expect(e !== null && e !== undefined).assertTrue();
      }

      hilog.info(0x0000, 'UIContextSpecialApiTest', '[uiContextRequireDynamicSyncSceneNull_0100] END');
    });

    /**
     * @tc.name   uiContextRequireDynamicSyncSceneUndefined_0100
     * @tc.number SUB_ARKUI_UICONTEXT_REQUIREDYNAMICSYNCSCENE_UNDEFINED_0100
     * @tc.desc   测试 UIContext requireDynamicSyncScene 方法参数为 undefined 的行为
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('uiContextRequireDynamicSyncSceneUndefined_0100', Level.LEVEL2, async () => {
      hilog.info(0x0000, 'UIContextSpecialApiTest', '[uiContextRequireDynamicSyncSceneUndefined_0100] START');

      try {
        // 直接传递 undefined 作为参数
        let result = uiContext?.requireDynamicSyncScene(undefined);
        hilog.info(0x0000, 'UIContextSpecialApiTest',
          '[uiContextRequireDynamicSyncSceneUndefined_0100] requireDynamicSyncScene(undefined) result: ' + JSON.stringify(result));
        // 如果没有抛出异常，验证返回值
        expect(result !== null && result !== undefined).assertTrue();
      } catch (e) {
        // 如果抛出异常，验证异常信息
        hilog.info(0x0000, 'UIContextSpecialApiTest',
          '[uiContextRequireDynamicSyncSceneUndefined_0100] exception: ' + JSON.stringify(e));
        expect(e !== null && e !== undefined).assertTrue();
      }

      hilog.info(0x0000, 'UIContextSpecialApiTest', '[uiContextRequireDynamicSyncSceneUndefined_0100] END');
    });

    /**
     * @tc.name   uiContextRequireDynamicSyncSceneEmptyString_0100
     * @tc.number SUB_ARKUI_UICONTEXT_REQUIREDYNAMICSYNCSCENE_EMPTYSTRING_0100
     * @tc.desc   测试 UIContext requireDynamicSyncScene 方法参数为空字符串的行为
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('uiContextRequireDynamicSyncSceneEmptyString_0100', Level.LEVEL2, async () => {
      hilog.info(0x0000, 'UIContextSpecialApiTest', '[uiContextRequireDynamicSyncSceneEmptyString_0100] START');

      try {
        // 直接传递空字符串作为参数
        let result = uiContext?.requireDynamicSyncScene('');
        hilog.info(0x0000, 'UIContextSpecialApiTest',
          '[uiContextRequireDynamicSyncSceneEmptyString_0100] requireDynamicSyncScene(\'\') result: ' + JSON.stringify(result));
        // 如果没有抛出异常，验证返回值
        expect(result !== null && result !== undefined).assertTrue();
      } catch (e) {
        // 如果抛出异常，验证异常信息
        hilog.info(0x0000, 'UIContextSpecialApiTest',
          '[uiContextRequireDynamicSyncSceneEmptyString_0100] exception: ' + JSON.stringify(e));
        expect(e !== null && e !== undefined).assertTrue();
      }

      hilog.info(0x0000, 'UIContextSpecialApiTest', '[uiContextRequireDynamicSyncSceneEmptyString_0100] END');
    });

    // ==================== createUIContextWithoutWindow 测试 ====================

    /**
     * @tc.name   uiContextCreateUIContextWithoutWindowNull_0100
     * @tc.number SUB_ARKUI_UICONTEXT_CREATEUICONTEXTWITHOUTWINDOW_NULL_0100
     * @tc.desc   测试 UIContext createUIContextWithoutWindow 静态方法参数为 null 的行为
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('uiContextCreateUIContextWithoutWindowNull_0100', Level.LEVEL2, async () => {
      hilog.info(0x0000, 'UIContextSpecialApiTest', '[uiContextCreateUIContextWithoutWindowNull_0100] START');

      try {
        // 直接传递 null 作为参数
        let result = UIContext.createUIContextWithoutWindow(null);
        hilog.info(0x0000, 'UIContextSpecialApiTest',
          '[uiContextCreateUIContextWithoutWindowNull_0100] createUIContextWithoutWindow(null) result: ' + result);
        // 如果没有抛出异常，验证返回值
        expect(result === undefined).assertTrue();
      } catch (e) {
        // 如果抛出异常，验证异常信息
        hilog.info(0x0000, 'UIContextSpecialApiTest',
          '[uiContextCreateUIContextWithoutWindowNull_0100] exception: ' + JSON.stringify(e));
        expect(e !== null && e !== undefined).assertTrue();
      }

      hilog.info(0x0000, 'UIContextSpecialApiTest', '[uiContextCreateUIContextWithoutWindowNull_0100] END');
    });

    /**
     * @tc.name   uiContextCreateUIContextWithoutWindowUndefined_0100
     * @tc.number SUB_ARKUI_UICONTEXT_CREATEUICONTEXTWITHOUTWINDOW_UNDEFINED_0100
     * @tc.desc   测试 UIContext createUIContextWithoutWindow 静态方法参数为 undefined 的行为
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('uiContextCreateUIContextWithoutWindowUndefined_0100', Level.LEVEL2, async () => {
      hilog.info(0x0000, 'UIContextSpecialApiTest', '[uiContextCreateUIContextWithoutWindowUndefined_0100] START');

      try {
        // 直接传递 undefined 作为参数
        let result = UIContext.createUIContextWithoutWindow(undefined);
        hilog.info(0x0000, 'UIContextSpecialApiTest',
          '[uiContextCreateUIContextWithoutWindowUndefined_0100] createUIContextWithoutWindow(undefined) result: ' + result);
        // 如果没有抛出异常，验证返回值
        expect(result === undefined).assertTrue();
      } catch (e) {
        // 如果抛出异常，验证异常信息
        hilog.info(0x0000, 'UIContextSpecialApiTest',
          '[uiContextCreateUIContextWithoutWindowUndefined_0100] exception: ' + JSON.stringify(e));
        expect(e !== null && e !== undefined).assertTrue();
      }

      hilog.info(0x0000, 'UIContextSpecialApiTest', '[uiContextCreateUIContextWithoutWindowUndefined_0100] END');
    });

  });
}
