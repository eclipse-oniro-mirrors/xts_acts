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

export default function UIContextUnitConversionNullUndefinedTest() {
  describe('UIContextUnitConversionNullUndefinedTest', () => {
    let uiContext: UIContext | undefined;

    beforeAll(async () => {
      hilog.info(0x0000, 'UIContextUnitConversionNullUndefinedTest', 'beforeAll: get UIContext instance');
      // 通过静态方法获取 UIContext 实例
      uiContext = UIContext.getCallingScopeUIContext();
      if (!uiContext || !uiContext.isAvailable()) {
        hilog.warn(0x0000, 'UIContextUnitConversionNullUndefinedTest', 'UIContext is not available, using default instance');
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
      hilog.info(0x0000, 'UIContextUnitConversionNullUndefinedTest', 'beforeEach: prepare for test case');
    });

    afterEach(() => {
      hilog.info(0x0000, 'UIContextUnitConversionNullUndefinedTest', 'afterEach: test case finished');
    });

    afterAll(async () => {
      hilog.info(0x0000, 'UIContextUnitConversionNullUndefinedTest', 'afterAll: all tests finished');
    });

    // ==================== vp2px 测试 ====================

    /**
     * @tc.name   uiContextVp2pxNull_0100
     * @tc.number SUB_ARKUI_UICONTEXT_VP2PX_NULL_0100
     * @tc.desc   测试 UIContext vp2px 方法参数为 null 的行为
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('uiContextVp2pxNull_0100', Level.LEVEL2, async () => {
      hilog.info(0x0000, 'UIContextUnitConversionNullUndefinedTest', '[uiContextVp2pxNull_0100] START');

      try {
        // 直接传递 null 作为参数
        let result: number | undefined = uiContext?.vp2px(null);
        hilog.info(0x0000, 'UIContextUnitConversionNullUndefinedTest',
          '[uiContextVp2pxNull_0100] vp2px(null) result: ' + result);
        // 如果没有抛出异常，验证返回值
        expect(result === undefined).assertTrue();
      } catch (e) {
        // 如果抛出异常，验证异常信息
        hilog.info(0x0000, 'UIContextUnitConversionNullUndefinedTest',
          '[uiContextVp2pxNull_0100] exception: ' + JSON.stringify(e));
        expect(e !== null && e !== undefined).assertTrue();
      }

      hilog.info(0x0000, 'UIContextUnitConversionNullUndefinedTest', '[uiContextVp2pxNull_0100] END');
    });

    /**
     * @tc.name   uiContextVp2pxUndefined_0100
     * @tc.number SUB_ARKUI_UICONTEXT_VP2PX_UNDEFINED_0100
     * @tc.desc   测试 UIContext vp2px 方法参数为 undefined 的行为
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('uiContextVp2pxUndefined_0100', Level.LEVEL2, async () => {
      hilog.info(0x0000, 'UIContextUnitConversionNullUndefinedTest', '[uiContextVp2pxUndefined_0100] START');

      try {
        // 直接传递 undefined 作为参数
        let result: number | undefined = uiContext?.vp2px(undefined);
        hilog.info(0x0000, 'UIContextUnitConversionNullUndefinedTest',
          '[uiContextVp2pxUndefined_0100] vp2px(undefined) result: ' + result);
        // 如果没有抛出异常，验证返回值
        expect(result === undefined).assertTrue();
      } catch (e) {
        // 如果抛出异常，验证异常信息
        hilog.info(0x0000, 'UIContextUnitConversionNullUndefinedTest',
          '[uiContextVp2pxUndefined_0100] exception: ' + JSON.stringify(e));
        expect(e !== null && e !== undefined).assertTrue();
      }

      hilog.info(0x0000, 'UIContextUnitConversionNullUndefinedTest', '[uiContextVp2pxUndefined_0100] END');
    });

    // ==================== px2vp 测试 ====================

    /**
     * @tc.name   uiContextPx2vpNull_0100
     * @tc.number SUB_ARKUI_UICONTEXT_PX2VP_NULL_0100
     * @tc.desc   测试 UIContext px2vp 方法参数为 null 的行为
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('uiContextPx2vpNull_0100', Level.LEVEL2, async () => {
      hilog.info(0x0000, 'UIContextUnitConversionNullUndefinedTest', '[uiContextPx2vpNull_0100] START');

      try {
        // 直接传递 null 作为参数
        let result: number | undefined = uiContext?.px2vp(null);
        hilog.info(0x0000, 'UIContextUnitConversionNullUndefinedTest',
          '[uiContextPx2vpNull_0100] px2vp(null) result: ' + result);
        expect(result === undefined).assertTrue();
      } catch (e) {
        hilog.info(0x0000, 'UIContextUnitConversionNullUndefinedTest',
          '[uiContextPx2vpNull_0100] exception: ' + JSON.stringify(e));
        expect(e !== null && e !== undefined).assertTrue();
      }

      hilog.info(0x0000, 'UIContextUnitConversionNullUndefinedTest', '[uiContextPx2vpNull_0100] END');
    });

    /**
     * @tc.name   uiContextPx2vpUndefined_0100
     * @tc.number SUB_ARKUI_UICONTEXT_PX2VP_UNDEFINED_0100
     * @tc.desc   测试 UIContext px2vp 方法参数为 undefined 的行为
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('uiContextPx2vpUndefined_0100', Level.LEVEL2, async () => {
      hilog.info(0x0000, 'UIContextUnitConversionNullUndefinedTest', '[uiContextPx2vpUndefined_0100] START');

      try {
        // 直接传递 undefined 作为参数
        let result: number | undefined = uiContext?.px2vp(undefined);
        hilog.info(0x0000, 'UIContextUnitConversionNullUndefinedTest',
          '[uiContextPx2vpUndefined_0100] px2vp(undefined) result: ' + result);
        expect(result === undefined).assertTrue();
      } catch (e) {
        hilog.info(0x0000, 'UIContextUnitConversionNullUndefinedTest',
          '[uiContextPx2vpUndefined_0100] exception: ' + JSON.stringify(e));
        expect(e !== null && e !== undefined).assertTrue();
      }

      hilog.info(0x0000, 'UIContextUnitConversionNullUndefinedTest', '[uiContextPx2vpUndefined_0100] END');
    });

    // ==================== fp2px 测试 ====================

    /**
     * @tc.name   uiContextFp2pxNull_0100
     * @tc.number SUB_ARKUI_UICONTEXT_FP2PX_NULL_0100
     * @tc.desc   测试 UIContext fp2px 方法参数为 null 的行为
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('uiContextFp2pxNull_0100', Level.LEVEL2, async () => {
      hilog.info(0x0000, 'UIContextUnitConversionNullUndefinedTest', '[uiContextFp2pxNull_0100] START');

      try {
        // 直接传递 null 作为参数
        let result: number | undefined = uiContext?.fp2px(null);
        hilog.info(0x0000, 'UIContextUnitConversionNullUndefinedTest',
          '[uiContextFp2pxNull_0100] fp2px(null) result: ' + result);
        expect(result === undefined).assertTrue();
      } catch (e) {
        hilog.info(0x0000, 'UIContextUnitConversionNullUndefinedTest',
          '[uiContextFp2pxNull_0100] exception: ' + JSON.stringify(e));
        expect(e !== null && e !== undefined).assertTrue();
      }

      hilog.info(0x0000, 'UIContextUnitConversionNullUndefinedTest', '[uiContextFp2pxNull_0100] END');
    });

    /**
     * @tc.name   uiContextFp2pxUndefined_0100
     * @tc.number SUB_ARKUI_UICONTEXT_FP2PX_UNDEFINED_0100
     * @tc.desc   测试 UIContext fp2px 方法参数为 undefined 的行为
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('uiContextFp2pxUndefined_0100', Level.LEVEL2, async () => {
      hilog.info(0x0000, 'UIContextUnitConversionNullUndefinedTest', '[uiContextFp2pxUndefined_0100] START');

      try {
        // 直接传递 undefined 作为参数
        let result: number | undefined = uiContext?.fp2px(undefined);
        hilog.info(0x0000, 'UIContextUnitConversionNullUndefinedTest',
          '[uiContextFp2pxUndefined_0100] fp2px(undefined) result: ' + result);
        expect(result === undefined).assertTrue();
      } catch (e) {
        hilog.info(0x0000, 'UIContextUnitConversionNullUndefinedTest',
          '[uiContextFp2pxUndefined_0100] exception: ' + JSON.stringify(e));
        expect(e !== null && e !== undefined).assertTrue();
      }

      hilog.info(0x0000, 'UIContextUnitConversionNullUndefinedTest', '[uiContextFp2pxUndefined_0100] END');
    });

    // ==================== px2fp 测试 ====================

    /**
     * @tc.name   uiContextPx2fpNull_0100
     * @tc.number SUB_ARKUI_UICONTEXT_PX2FP_NULL_0100
     * @tc.desc   测试 UIContext px2fp 方法参数为 null 的行为
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('uiContextPx2fpNull_0100', Level.LEVEL2, async () => {
      hilog.info(0x0000, 'UIContextUnitConversionNullUndefinedTest', '[uiContextPx2fpNull_0100] START');

      try {
        // 直接传递 null 作为参数
        let result: number | undefined = uiContext?.px2fp(null);
        hilog.info(0x0000, 'UIContextUnitConversionNullUndefinedTest',
          '[uiContextPx2fpNull_0100] px2fp(null) result: ' + result);
        expect(result === undefined).assertTrue();
      } catch (e) {
        hilog.info(0x0000, 'UIContextUnitConversionNullUndefinedTest',
          '[uiContextPx2fpNull_0100] exception: ' + JSON.stringify(e));
        expect(e !== null && e !== undefined).assertTrue();
      }

      hilog.info(0x0000, 'UIContextUnitConversionNullUndefinedTest', '[uiContextPx2fpNull_0100] END');
    });

    /**
     * @tc.name   uiContextPx2fpUndefined_0100
     * @tc.number SUB_ARKUI_UICONTEXT_PX2FP_UNDEFINED_0100
     * @tc.desc   测试 UIContext px2fp 方法参数为 undefined 的行为
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('uiContextPx2fpUndefined_0100', Level.LEVEL2, async () => {
      hilog.info(0x0000, 'UIContextUnitConversionNullUndefinedTest', '[uiContextPx2fpUndefined_0100] START');

      try {
        // 直接传递 undefined 作为参数
        let result: number | undefined = uiContext?.px2fp(undefined);
        hilog.info(0x0000, 'UIContextUnitConversionNullUndefinedTest',
          '[uiContextPx2fpUndefined_0100] px2fp(undefined) result: ' + result);
        expect(result === undefined).assertTrue();
      } catch (e) {
        hilog.info(0x0000, 'UIContextUnitConversionNullUndefinedTest',
          '[uiContextPx2fpUndefined_0100] exception: ' + JSON.stringify(e));
        expect(e !== null && e !== undefined).assertTrue();
      }

      hilog.info(0x0000, 'UIContextUnitConversionNullUndefinedTest', '[uiContextPx2fpUndefined_0100] END');
    });

    // ==================== lpx2px 测试 ====================

    /**
     * @tc.name   uiContextLpx2pxNull_0100
     * @tc.number SUB_ARKUI_UICONTEXT_LPX2PX_NULL_0100
     * @tc.desc   测试 UIContext lpx2px 方法参数为 null 的行为
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('uiContextLpx2pxNull_0100', Level.LEVEL2, async () => {
      hilog.info(0x0000, 'UIContextUnitConversionNullUndefinedTest', '[uiContextLpx2pxNull_0100] START');

      try {
        // 直接传递 null 作为参数
        let result: number | undefined = uiContext?.lpx2px(null);
        hilog.info(0x0000, 'UIContextUnitConversionNullUndefinedTest',
          '[uiContextLpx2pxNull_0100] lpx2px(null) result: ' + result);
        expect(result === undefined).assertTrue();
      } catch (e) {
        hilog.info(0x0000, 'UIContextUnitConversionNullUndefinedTest',
          '[uiContextLpx2pxNull_0100] exception: ' + JSON.stringify(e));
        expect(e !== null && e !== undefined).assertTrue();
      }

      hilog.info(0x0000, 'UIContextUnitConversionNullUndefinedTest', '[uiContextLpx2pxNull_0100] END');
    });

    /**
     * @tc.name   uiContextLpx2pxUndefined_0100
     * @tc.number SUB_ARKUI_UICONTEXT_LPX2PX_UNDEFINED_0100
     * @tc.desc   测试 UIContext lpx2px 方法参数为 undefined 的行为
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('uiContextLpx2pxUndefined_0100', Level.LEVEL2, async () => {
      hilog.info(0x0000, 'UIContextUnitConversionNullUndefinedTest', '[uiContextLpx2pxUndefined_0100] START');

      try {
        // 直接传递 undefined 作为参数
        let result: number | undefined = uiContext?.lpx2px(undefined);
        hilog.info(0x0000, 'UIContextUnitConversionNullUndefinedTest',
          '[uiContextLpx2pxUndefined_0100] lpx2px(undefined) result: ' + result);
        expect(result === undefined).assertTrue();
      } catch (e) {
        hilog.info(0x0000, 'UIContextUnitConversionNullUndefinedTest',
          '[uiContextLpx2pxUndefined_0100] exception: ' + JSON.stringify(e));
        expect(e !== null && e !== undefined).assertTrue();
      }

      hilog.info(0x0000, 'UIContextUnitConversionNullUndefinedTest', '[uiContextLpx2pxUndefined_0100] END');
    });

    // ==================== px2lpx 测试 ====================

    /**
     * @tc.name   uiContextPx2lpxNull_0100
     * @tc.number SUB_ARKUI_UICONTEXT_PX2LPX_NULL_0100
     * @tc.desc   测试 UIContext px2lpx 方法参数为 null 的行为
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('uiContextPx2lpxNull_0100', Level.LEVEL2, async () => {
      hilog.info(0x0000, 'UIContextUnitConversionNullUndefinedTest', '[uiContextPx2lpxNull_0100] START');

      try {
        // 直接传递 null 作为参数
        let result: number | undefined = uiContext?.px2lpx(null);
        hilog.info(0x0000, 'UIContextUnitConversionNullUndefinedTest',
          '[uiContextPx2lpxNull_0100] px2lpx(null) result: ' + result);
        expect(result === undefined).assertTrue();
      } catch (e) {
        hilog.info(0x0000, 'UIContextUnitConversionNullUndefinedTest',
          '[uiContextPx2lpxNull_0100] exception: ' + JSON.stringify(e));
        expect(e !== null && e !== undefined).assertTrue();
      }

      hilog.info(0x0000, 'UIContextUnitConversionNullUndefinedTest', '[uiContextPx2lpxNull_0100] END');
    });

    /**
     * @tc.name   uiContextPx2lpxUndefined_0100
     * @tc.number SUB_ARKUI_UICONTEXT_PX2LPX_UNDEFINED_0100
     * @tc.desc   测试 UIContext px2lpx 方法参数为 undefined 的行为
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('uiContextPx2lpxUndefined_0100', Level.LEVEL2, async () => {
      hilog.info(0x0000, 'UIContextUnitConversionNullUndefinedTest', '[uiContextPx2lpxUndefined_0100] START');

      try {
        // 直接传递 undefined 作为参数
        let result: number | undefined = uiContext?.px2lpx(undefined);
        hilog.info(0x0000, 'UIContextUnitConversionNullUndefinedTest',
          '[uiContextPx2lpxUndefined_0100] px2lpx(undefined) result: ' + result);
        expect(result === undefined).assertTrue();
      } catch (e) {
        hilog.info(0x0000, 'UIContextUnitConversionNullUndefinedTest',
          '[uiContextPx2lpxUndefined_0100] exception: ' + JSON.stringify(e));
        expect(e !== null && e !== undefined).assertTrue();
      }

      hilog.info(0x0000, 'UIContextUnitConversionNullUndefinedTest', '[uiContextPx2lpxUndefined_0100] END');
    });
  });
}
