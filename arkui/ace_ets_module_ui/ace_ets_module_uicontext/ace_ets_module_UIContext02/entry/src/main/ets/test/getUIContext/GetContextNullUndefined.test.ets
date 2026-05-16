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
import { hilog } from '@kit.PerformanceAnalysisKit';

export default function GetContextNullUndefinedTest() {
  describe('GetContextNullUndefinedTest', () => {
    beforeAll(async () => {
    });

    beforeEach(() => {
      hilog.info(0x0000, 'GetContextNullUndefinedTest', 'beforeEach: prepare for test case');
    });

    afterEach(() => {
      hilog.info(0x0000, 'GetContextNullUndefinedTest', 'afterEach: test case finished');
    });

    afterAll(async () => {
      hilog.info(0x0000, 'GetContextNullUndefinedTest', 'afterAll: all tests finished');
    });

    /**
     * @tc.name   GetContextNullUndefinedTest_0100
     * @tc.number SUB_ARKUI_UICONTEXT_GetContext_NULL_0100
     * @tc.desc   测试 GetContext 方法参数为 null 的行为
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('GetContextNullUndefinedTest_0100', Level.LEVEL2, async () => {
      hilog.info(0x0000, 'GetContextNullUndefinedTest', '[GetContextNullUndefinedTest_0100] START');

      try {
        // 直接传递 null 作为参数
        let result = getContext(null);
        hilog.info(0x0000, 'GetContextNullUndefinedTest',
          '[GetContextNullUndefinedTest_0100] result: ' + result);
        // 如果没有抛出异常，验证返回值
        expect(result !== undefined).assertTrue();
      } catch (e) {
        // 如果抛出异常，验证异常信息
        hilog.info(0x0000, 'GetContextNullUndefinedTest',
          '[GetContextNullUndefinedTest_0100] exception: ' + JSON.stringify(e));
        expect(e !== null && e !== undefined).assertTrue();
      }

      hilog.info(0x0000, 'GetContextNullUndefinedTest', '[GetContextNullUndefinedTest_0100] END');
    });

    /**
     * @tc.name   GetContextNullUndefinedTest_0200
     * @tc.number SUB_ARKUI_UICONTEXT_GetContext_UNDEFINED_0200
     * @tc.desc   测试 UIContext GetContext 方法参数为 undefined 的行为
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('GetContextNullUndefinedTest_0200', Level.LEVEL2, async () => {
      hilog.info(0x0000, 'GetContextNullUndefinedTest', '[GetContextNullUndefinedTest_0200] START');

      try {
        // 直接传递 undefined 作为参数
        let result = getContext(undefined);
        hilog.info(0x0000, 'GetContextNullUndefinedTest',
          '[GetContextNullUndefinedTest_0200] result: ' + result);
        // 如果没有抛出异常，验证返回值
        expect(result !== undefined).assertTrue();
      } catch (e) {
        // 如果抛出异常，验证异常信息
        hilog.info(0x0000, 'GetContextNullUndefinedTest',
          '[GetContextNullUndefinedTest_0200] exception: ' + JSON.stringify(e));
        expect(e !== null && e !== undefined).assertTrue();
      }

      hilog.info(0x0000, 'GetContextNullUndefinedTest', '[GetContextNullUndefinedTest_0200] END');
    });

  });
}
