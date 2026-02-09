/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll } from '@ohos/hypium'
import nativerenderndk from 'libnoderenderndk.so'
import Utils from '../common/Utils';

const ARKUI_ERROR_CODE_NO_ERROR = 0;
const ARKUI_ERROR_CODE_ERROR = 1;
const ARKUI_ERROR_CODE_CALLBACK_INVALID = 190002
const ARKUI_ERROR_CODE_CAPI_INIT_ERROR = 500;
const ARKUI_ERROR_CODE_UI_CONTEXT_INVALID = 190001;

export default function RunTaskInscopeTest() {
  describe('RunTaskInscopeTest', () => {
    beforeAll(async (done: Function) => {
      await Utils.pushPage(`scopetest/runTaskInScopeTest`, done);
    });
    /**
     * @tc.name   testOHArkUIRunTaskInScope0100
     * @tc.number SUB_ArkUI_ACE_ENGINE_OH_ArkUI_RunTaskInScope_0100
     * @tc.desc   testing OH_ArkUI_RunTaskInScope interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIRunTaskInScope0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIRunTaskInScope0100 start====");
          let result: number = nativerenderndk.RunTaskInScopeTest_001();
          console.info(`====>testOHArkUIRunTaskInScope0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIRunTaskInScope0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUIRunTaskInScope0200
     * @tc.number SUB_ArkUI_ACE_ENGINE_OH_ArkUI_RunTaskInScope_0200
     * @tc.desc   testing OH_ArkUI_RunTaskInScope interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIRunTaskInScope0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIRunTaskInScope0200 start====");
          let result: number = nativerenderndk.RunTaskInScopeTest_002();
          console.info(`====>testOHArkUIRunTaskInScope0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIRunTaskInScope0200 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUIRunTaskInScope0400
     * @tc.number SUB_ArkUI_ACE_ENGINE_OH_ArkUI_RunTaskInScope_0400
     * @tc.desc   testing OH_ArkUI_RunTaskInScope interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIRunTaskInScope0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIRunTaskInScope0400 start====");
          let result: number = nativerenderndk.RunTaskInScopeTest_004();
          console.info(`====>testOHArkUIRunTaskInScope0400 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIRunTaskInScope0400 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

  })
}