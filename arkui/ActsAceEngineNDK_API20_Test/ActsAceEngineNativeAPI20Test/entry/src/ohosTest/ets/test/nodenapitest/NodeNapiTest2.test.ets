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
const ARKUI_ERROR_CODE_PARAM_INVALID = 401;

export default function NodeNapiTest2() {
  describe('NodeNapiTest2', () => {
    beforeAll(async (done: Function) => {
      await Utils.pushPageNoClear(`nodenapitest/nodenapiTest2`, done);
    });

    /**
     * @tc.name   testOHArkUIGetNodeContentFromNapiValue0100
     * @tc.number SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetNodeContentFromNapiValue_0100
     * @tc.desc   testing OH_ArkUI_GetNodeContentFromNapiValue interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIGetNodeContentFromNapiValue0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetNodeContentFromNapiValue0100 start====");
          let result: number = nativerenderndk.GetNodeContentFromNapiValueTest_001();
          console.info(`====>testOHArkUIGetNodeContentFromNapiValue0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetNodeContentFromNapiValue0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOHArkUIGetNodeContentFromNapiValue0200
     * @tc.number SUB_ArkUI_ACE_ENGINE_OH_ArkUI_GetNodeContentFromNapiValue_0200
     * @tc.desc   testing OH_ArkUI_GetNodeContentFromNapiValue interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIGetNodeContentFromNapiValue0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIGetNodeContentFromNapiValue0200 start====");
          let result: number = nativerenderndk.GetNodeContentFromNapiValueTest_002();
          console.info(`====>testOHArkUIGetNodeContentFromNapiValue0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIGetNodeContentFromNapiValue0200 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

  })
}