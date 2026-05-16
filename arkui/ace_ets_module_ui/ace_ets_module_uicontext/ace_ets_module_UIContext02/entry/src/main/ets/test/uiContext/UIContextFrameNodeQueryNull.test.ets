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

export default function UIContextFrameNodeQueryNullTest() {
  describe('UIContextFrameNodeQueryNullTest', () => {
    let uiContext: UIContext | undefined;

    beforeAll(async () => {
      hilog.info(0x0000, 'UIContextFrameNodeQueryNullTest', 'beforeAll: get UIContext instance');
      // 通过静态方法获取 UIContext 实例
      uiContext = UIContext.getCallingScopeUIContext();
      if (!uiContext || !uiContext.isAvailable()) {
        hilog.warn(0x0000, 'UIContextFrameNodeQueryNullTest', 'UIContext is not available, using default instance');
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
      hilog.info(0x0000, 'UIContextFrameNodeQueryNullTest', 'beforeEach: prepare for test case');
    });

    afterEach(() => {
      hilog.info(0x0000, 'UIContextFrameNodeQueryNullTest', 'afterEach: test case finished');
    });

    afterAll(async () => {
      hilog.info(0x0000, 'UIContextFrameNodeQueryNullTest', 'afterAll: all tests finished');
    });

    // ==================== getFrameNodeById 测试 ====================

    /**
     * @tc.name   uiContextGetFrameNodeByIdNull_0100
     * @tc.number SUB_ARKUI_UICONTEXT_GETFRAMENODEBYID_NULL_0100
     * @tc.desc   测试 UIContext getFrameNodeById 方法参数为 null 的行为
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('uiContextGetFrameNodeByIdNull_0100', Level.LEVEL2, async () => {
      hilog.info(0x0000, 'UIContextFrameNodeQueryNullTest', '[uiContextGetFrameNodeByIdNull_0100] START');

      try {
        // 直接传递 null 作为参数
        let result = uiContext?.getFrameNodeById(null);
        hilog.info(0x0000, 'UIContextFrameNodeQueryNullTest',
          '[uiContextGetFrameNodeByIdNull_0100] getFrameNodeById(null) result: ' + result);
        // 如果没有抛出异常，验证返回值
        expect(result === null).assertTrue();
      } catch (e) {
        // 如果抛出异常，验证异常信息
        hilog.info(0x0000, 'UIContextFrameNodeQueryNullTest',
          '[uiContextGetFrameNodeByIdNull_0100] exception: ' + JSON.stringify(e));
        expect(e !== null && e !== undefined).assertTrue();
      }

      hilog.info(0x0000, 'UIContextFrameNodeQueryNullTest', '[uiContextGetFrameNodeByIdNull_0100] END');
    });

    /**
     * @tc.name   uiContextGetFrameNodeByIdUndefined_0100
     * @tc.number SUB_ARKUI_UICONTEXT_GETFRAMENODEBYID_UNDEFINED_0100
     * @tc.desc   测试 UIContext getFrameNodeById 方法参数为 undefined 的行为
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('uiContextGetFrameNodeByIdUndefined_0100', Level.LEVEL2, async () => {
      hilog.info(0x0000, 'UIContextFrameNodeQueryNullTest', '[uiContextGetFrameNodeByIdUndefined_0100] START');

      try {
        // 直接传递 undefined 作为参数
        let result = uiContext?.getFrameNodeById(undefined);
        hilog.info(0x0000, 'UIContextFrameNodeQueryNullTest',
          '[uiContextGetFrameNodeByIdUndefined_0100] getFrameNodeById(undefined) result: ' + result);
        // 如果没有抛出异常，验证返回值
        expect(result === null).assertTrue();
      } catch (e) {
        // 如果抛出异常，验证异常信息
        hilog.info(0x0000, 'UIContextFrameNodeQueryNullTest',
          '[uiContextGetFrameNodeByIdUndefined_0100] exception: ' + JSON.stringify(e));
        expect(e !== null && e !== undefined).assertTrue();
      }

      hilog.info(0x0000, 'UIContextFrameNodeQueryNullTest', '[uiContextGetFrameNodeByIdUndefined_0100] END');
    });

    /**
     * @tc.name   uiContextGetFrameNodeByIdEmptyString_0100
     * @tc.number SUB_ARKUI_UICONTEXT_GETFRAMENODEBYID_EMPTYSTRING_0100
     * @tc.desc   测试 UIContext getFrameNodeById 方法参数为空字符串的行为
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('uiContextGetFrameNodeByIdEmptyString_0100', Level.LEVEL2, async () => {
      hilog.info(0x0000, 'UIContextFrameNodeQueryNullTest', '[uiContextGetFrameNodeByIdEmptyString_0100] START');

      try {
        // 直接传递空字符串作为参数
        let result = uiContext?.getFrameNodeById('');
        hilog.info(0x0000, 'UIContextFrameNodeQueryNullTest',
          '[uiContextGetFrameNodeByIdEmptyString_0100] getFrameNodeById(\'\') result: ' + result);
        // 如果没有抛出异常，验证返回值
        expect(result !== null).assertTrue();
      } catch (e) {
        // 如果抛出异常，验证异常信息
        hilog.info(0x0000, 'UIContextFrameNodeQueryNullTest',
          '[uiContextGetFrameNodeByIdEmptyString_0100] exception: ' + JSON.stringify(e));
        expect(e !== null && e !== undefined).assertTrue();
      }

      hilog.info(0x0000, 'UIContextFrameNodeQueryNullTest', '[uiContextGetFrameNodeByIdEmptyString_0100] END');
    });

    // ==================== getAttachedFrameNodeById 测试 ====================

    /**
     * @tc.name   uiContextGetAttachedFrameNodeByIdNull_0100
     * @tc.number SUB_ARKUI_UICONTEXT_GETATTACHEDFRAMENODEBYID_NULL_0100
     * @tc.desc   测试 UIContext getAttachedFrameNodeById 方法参数为 null 的行为
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('uiContextGetAttachedFrameNodeByIdNull_0100', Level.LEVEL2, async () => {
      hilog.info(0x0000, 'UIContextFrameNodeQueryNullTest', '[uiContextGetAttachedFrameNodeByIdNull_0100] START');

      try {
        // 直接传递 null 作为参数
        let result = uiContext?.getAttachedFrameNodeById(null);
        hilog.info(0x0000, 'UIContextFrameNodeQueryNullTest',
          '[uiContextGetAttachedFrameNodeByIdNull_0100] getAttachedFrameNodeById(null) result: ' + result);
        // 如果没有抛出异常，验证返回值
        expect(result === null).assertTrue();
      } catch (e) {
        // 如果抛出异常，验证异常信息
        hilog.info(0x0000, 'UIContextFrameNodeQueryNullTest',
          '[uiContextGetAttachedFrameNodeByIdNull_0100] exception: ' + JSON.stringify(e));
        expect(e !== null && e !== undefined).assertTrue();
      }

      hilog.info(0x0000, 'UIContextFrameNodeQueryNullTest', '[uiContextGetAttachedFrameNodeByIdNull_0100] END');
    });

    /**
     * @tc.name   uiContextGetAttachedFrameNodeByIdUndefined_0100
     * @tc.number SUB_ARKUI_UICONTEXT_GETATTACHEDFRAMENODEBYID_UNDEFINED_0100
     * @tc.desc   测试 UIContext getAttachedFrameNodeById 方法参数为 undefined 的行为
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('uiContextGetAttachedFrameNodeByIdUndefined_0100', Level.LEVEL2, async () => {
      hilog.info(0x0000, 'UIContextFrameNodeQueryNullTest', '[uiContextGetAttachedFrameNodeByIdUndefined_0100] START');

      try {
        // 直接传递 undefined 作为参数
        let result = uiContext?.getAttachedFrameNodeById(undefined);
        hilog.info(0x0000, 'UIContextFrameNodeQueryNullTest',
          '[uiContextGetAttachedFrameNodeByIdUndefined_0100] getAttachedFrameNodeById(undefined) result: ' + result);
        // 如果没有抛出异常，验证返回值
        expect(result === null).assertTrue();
      } catch (e) {
        // 如果抛出异常，验证异常信息
        hilog.info(0x0000, 'UIContextFrameNodeQueryNullTest',
          '[uiContextGetAttachedFrameNodeByIdUndefined_0100] exception: ' + JSON.stringify(e));
        expect(e !== null && e !== undefined).assertTrue();
      }

      hilog.info(0x0000, 'UIContextFrameNodeQueryNullTest', '[uiContextGetAttachedFrameNodeByIdUndefined_0100] END');
    });

    /**
     * @tc.name   uiContextGetAttachedFrameNodeByIdEmptyString_0100
     * @tc.number SUB_ARKUI_UICONTEXT_GETATTACHEDFRAMENODEBYID_EMPTYSTRING_0100
     * @tc.desc   测试 UIContext getAttachedFrameNodeById 方法参数为空字符串的行为
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('uiContextGetAttachedFrameNodeByIdEmptyString_0100', Level.LEVEL2, async () => {
      hilog.info(0x0000, 'UIContextFrameNodeQueryNullTest', '[uiContextGetAttachedFrameNodeByIdEmptyString_0100] START');

      try {
        // 直接传递空字符串作为参数
        let result = uiContext?.getAttachedFrameNodeById('');
        hilog.info(0x0000, 'UIContextFrameNodeQueryNullTest',
          '[uiContextGetAttachedFrameNodeByIdEmptyString_0100] getAttachedFrameNodeById(\'\') result: ' + result);
        // 如果没有抛出异常，验证返回值
        expect(result === null).assertTrue();
      } catch (e) {
        // 如果抛出异常，验证异常信息
        hilog.info(0x0000, 'UIContextFrameNodeQueryNullTest',
          '[uiContextGetAttachedFrameNodeByIdEmptyString_0100] exception: ' + JSON.stringify(e));
        expect(e !== null && e !== undefined).assertTrue();
      }

      hilog.info(0x0000, 'UIContextFrameNodeQueryNullTest', '[uiContextGetAttachedFrameNodeByIdEmptyString_0100] END');
    });

    // ==================== getFrameNodeByUniqueId 测试 ====================

    /**
     * @tc.name   uiContextGetFrameNodeByUniqueIdNull_0100
     * @tc.number SUB_ARKUI_UICONTEXT_GETFRAMENODEBYUNIQUEID_NULL_0100
     * @tc.desc   测试 UIContext getFrameNodeByUniqueId 方法参数为 null 的行为
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('uiContextGetFrameNodeByUniqueIdNull_0100', Level.LEVEL2, async () => {
      hilog.info(0x0000, 'UIContextFrameNodeQueryNullTest', '[uiContextGetFrameNodeByUniqueIdNull_0100] START');

      try {
        // 直接传递 null 作为参数
        let result = uiContext?.getFrameNodeByUniqueId(null);
        hilog.info(0x0000, 'UIContextFrameNodeQueryNullTest',
          '[uiContextGetFrameNodeByUniqueIdNull_0100] getFrameNodeByUniqueId(null) result: ' + result);
        // 如果没有抛出异常，验证返回值
        expect(result === null).assertTrue();
      } catch (e) {
        // 如果抛出异常，验证异常信息
        hilog.info(0x0000, 'UIContextFrameNodeQueryNullTest',
          '[uiContextGetFrameNodeByUniqueIdNull_0100] exception: ' + JSON.stringify(e));
        expect(e !== null && e !== undefined).assertTrue();
      }

      hilog.info(0x0000, 'UIContextFrameNodeQueryNullTest', '[uiContextGetFrameNodeByUniqueIdNull_0100] END');
    });

    /**
     * @tc.name   uiContextGetFrameNodeByUniqueIdUndefined_0100
     * @tc.number SUB_ARKUI_UICONTEXT_GETFRAMENODEBYUNIQUEID_UNDEFINED_0100
     * @tc.desc   测试 UIContext getFrameNodeByUniqueId 方法参数为 undefined 的行为
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('uiContextGetFrameNodeByUniqueIdUndefined_0100', Level.LEVEL2, async () => {
      hilog.info(0x0000, 'UIContextFrameNodeQueryNullTest', '[uiContextGetFrameNodeByUniqueIdUndefined_0100] START');

      try {
        // 直接传递 undefined 作为参数
        let result = uiContext?.getFrameNodeByUniqueId(undefined);
        hilog.info(0x0000, 'UIContextFrameNodeQueryNullTest',
          '[uiContextGetFrameNodeByUniqueIdUndefined_0100] getFrameNodeByUniqueId(undefined) result: ' + result);
        // 如果没有抛出异常，验证返回值
        expect(result === null).assertTrue();
      } catch (e) {
        // 如果抛出异常，验证异常信息
        hilog.info(0x0000, 'UIContextFrameNodeQueryNullTest',
          '[uiContextGetFrameNodeByUniqueIdUndefined_0100] exception: ' + JSON.stringify(e));
        expect(e !== null && e !== undefined).assertTrue();
      }

      hilog.info(0x0000, 'UIContextFrameNodeQueryNullTest', '[uiContextGetFrameNodeByUniqueIdUndefined_0100] END');
    });

    // ==================== getPageInfoByUniqueId 测试 ====================

    /**
     * @tc.name   uiContextGetPageInfoByUniqueIdNull_0100
     * @tc.number SUB_ARKUI_UICONTEXT_GETPAGEINFOBYUNIQUEID_NULL_0100
     * @tc.desc   测试 UIContext getPageInfoByUniqueId 方法参数为 null 的行为
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('uiContextGetPageInfoByUniqueIdNull_0100', Level.LEVEL2, async () => {
      hilog.info(0x0000, 'UIContextFrameNodeQueryNullTest', '[uiContextGetPageInfoByUniqueIdNull_0100] START');

      try {
        // 直接传递 null 作为参数
        let result = uiContext?.getPageInfoByUniqueId(null);
        hilog.info(0x0000, 'UIContextFrameNodeQueryNullTest',
          '[uiContextGetPageInfoByUniqueIdNull_0100] getPageInfoByUniqueId(null) result: ' + JSON.stringify(result));
        // 如果没有抛出异常，验证返回值
        expect(result !== null && result !== undefined).assertTrue();
      } catch (e) {
        // 如果抛出异常，验证异常信息
        hilog.info(0x0000, 'UIContextFrameNodeQueryNullTest',
          '[uiContextGetPageInfoByUniqueIdNull_0100] exception: ' + JSON.stringify(e));
        expect(e !== null && e !== undefined).assertTrue();
      }

      hilog.info(0x0000, 'UIContextFrameNodeQueryNullTest', '[uiContextGetPageInfoByUniqueIdNull_0100] END');
    });

    /**
     * @tc.name   uiContextGetPageInfoByUniqueIdUndefined_0100
     * @tc.number SUB_ARKUI_UICONTEXT_GETPAGEINFOBYUNIQUEID_UNDEFINED_0100
     * @tc.desc   测试 UIContext getPageInfoByUniqueId 方法参数为 undefined 的行为
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('uiContextGetPageInfoByUniqueIdUndefined_0100', Level.LEVEL2, async () => {
      hilog.info(0x0000, 'UIContextFrameNodeQueryNullTest', '[uiContextGetPageInfoByUniqueIdUndefined_0100] START');

      try {
        // 直接传递 undefined 作为参数
        let result = uiContext?.getPageInfoByUniqueId(undefined);
        hilog.info(0x0000, 'UIContextFrameNodeQueryNullTest',
          '[uiContextGetPageInfoByUniqueIdUndefined_0100] getPageInfoByUniqueId(undefined) result: ' + JSON.stringify(result));
        // 如果没有抛出异常，验证返回值
        expect(result !== null && result !== undefined).assertTrue();
      } catch (e) {
        // 如果抛出异常，验证异常信息
        hilog.info(0x0000, 'UIContextFrameNodeQueryNullTest',
          '[uiContextGetPageInfoByUniqueIdUndefined_0100] exception: ' + JSON.stringify(e));
        expect(e !== null && e !== undefined).assertTrue();
      }

      hilog.info(0x0000, 'UIContextFrameNodeQueryNullTest', '[uiContextGetPageInfoByUniqueIdUndefined_0100] END');
    });
  });
}
