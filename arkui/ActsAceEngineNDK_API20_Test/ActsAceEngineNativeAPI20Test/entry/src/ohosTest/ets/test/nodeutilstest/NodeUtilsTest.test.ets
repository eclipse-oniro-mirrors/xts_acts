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
const ARKUI_ERROR_CODE_PARAM_INVALID = 401;
const ARKUI_ERROR_CODE_ERROR = 1;
const ARKUI_ERROR_CODE_CAPI_INIT_ERROR = 500;

export default function NodeUtilsTest() {
  describe('NodeUtilsTest', () => {
    /**
     * @tc.name   testOHArkUINodeUtilsGetLayoutSize0100
     * @tc.number SUB_ArkUI_ACE_ENGINE_OHArkUINodeUtilsGetLayoutSize_0100
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetLayoutSize interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetLayoutSize0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetLayoutSize0100 start====");
          let result: number = nativerenderndk.GetLayoutSizeTest_001()
          console.info(`====>testOHArkUINodeUtilsGetLayoutSize0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetLayoutSize0100 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetLayoutSize0200
     * @tc.number SUB_ArkUI_ACE_ENGINE_OHArkUINodeUtilsGetLayoutSize_0200
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetLayoutSize interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetLayoutSize0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetLayoutSize0200 start====");
          let result: number = nativerenderndk.GetLayoutSizeTest_002()
          console.info(`====>testOHArkUINodeUtilsGetLayoutSize0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetLayoutSize0200 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetLayoutPosition0100
     * @tc.number SUB_ArkUI_ACE_ENGINE_OHArkUINodeUtilsGetLayoutPosition_0100
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetLayoutPosition interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetLayoutPosition0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetLayoutPosition0100 start====");
          let result: number = nativerenderndk.GetLayoutPositionTest_001()
          console.info(`====>testOHArkUINodeUtilsGetLayoutPosition0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetLayoutPosition0100 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetLayoutPosition0200
     * @tc.number SUB_ArkUI_ACE_ENGINE_OHArkUINodeUtilsGetLayoutPosition_0200
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetLayoutPosition interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetLayoutPosition0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetLayoutPosition0200 start====");
          let result: number = nativerenderndk.GetLayoutPositionTest_002()
          console.info(`====>testOHArkUINodeUtilsGetLayoutPosition0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetLayoutPosition0200 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetLayoutPositionInWindow0100
     * @tc.number SUB_ArkUI_ACE_ENGINE_OHArkUINodeUtilsGetLayoutPositionInWindow_0100
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetLayoutPositionInWindow interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetLayoutPositionInWindow0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetLayoutPositionInWindow0100 start====");
          let result: number = nativerenderndk.GetLayoutPositionInWindowTest_001()
          console.info(`====>testOHArkUINodeUtilsGetLayoutPositionInWindow0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetLayoutPositionInWindow0100 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetLayoutPositionInWindow0200
     * @tc.number SUB_ArkUI_ACE_ENGINE_OHArkUINodeUtilsGetLayoutPositionInWindow_0200
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetLayoutPositionInWindow interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetLayoutPositionInWindow0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetLayoutPositionInWindow0200 start====");
          let result: number = nativerenderndk.GetLayoutPositionInWindowTest_002()
          console.info(`====>testOHArkUINodeUtilsGetLayoutPositionInWindow0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetLayoutPositionInWindow0200 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetLayoutPositionInScreen0100
     * @tc.number SUB_ArkUI_ACE_ENGINE_OHArkUINodeUtilsGetLayoutPositionInScreen_0100
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetLayoutPositionInScreen interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetLayoutPositionInScreen0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetLayoutPositionInScreen0100 start====");
          let result: number = nativerenderndk.GetLayoutPositionInScreenTest_001()
          console.info(`====>testOHArkUINodeUtilsGetLayoutPositionInScreen0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetLayoutPositionInScreen0100 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetLayoutPositionInScreen0200
     * @tc.number SUB_ArkUI_ACE_ENGINE_OHArkUINodeUtilsGetLayoutPositionInScreen_0200
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetLayoutPositionInScreen interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetLayoutPositionInScreen0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetLayoutPositionInScreen0200 start====");
          let result: number = nativerenderndk.GetLayoutPositionInScreenTest_002()
          console.info(`====>testOHArkUINodeUtilsGetLayoutPositionInScreen0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetLayoutPositionInScreen0200 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })
    /**
     * @tc.name   testOHArkUINodeUtilsGetLayoutPositionInGlobalDisplay0100
     * @tc.number SUB_ArkUI_ACE_ENGINE_OHArkUINodeUtilsGetLayoutPositionInGlobalDisplay_0100
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetLayoutPositionInGlobalDisplay interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetLayoutPositionInGlobalDisplay0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>OHArkUINodeUtilsGetLayoutPositionInGlobalDisplay0100 start====");
          let result: number = nativerenderndk.GetLayoutPositionInGlobalDisplayTest_001()
          console.info(`====>OHArkUINodeUtilsGetLayoutPositionInGlobalDisplay0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>OHArkUINodeUtilsGetLayoutPositionInGlobalDisplay0100 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetLayoutPositionInGlobalDisplay0200
     * @tc.number SUB_ArkUI_ACE_ENGINE_OHArkUINodeUtilsGetLayoutPositionInGlobalDisplay_0200
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetLayoutPositionInGlobalDisplay interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetLayoutPositionInGlobalDisplay0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetLayoutPositionInGlobalDisplay0200 start====");
          let result: number = nativerenderndk.GetLayoutPositionInGlobalDisplayTest_002()
          console.info(`====>testOHArkUINodeUtilsGetLayoutPositionInGlobalDisplay0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetLayoutPositionInGlobalDisplay0200 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetPositionWithTranslateInWindow0100
     * @tc.number SUB_ArkUI_ACE_ENGINE_OHArkUINodeUtilsGetPositionWithTranslateInWindow_0100
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetPositionWithTranslateInWindow interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetPositionWithTranslateInWindow0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetPositionWithTranslateInWindow0100 start====");
          let result: number = nativerenderndk.GetPositionWithTranslateInWindowTest_001()
          console.info(`====>testOHArkUINodeUtilsGetPositionWithTranslateInWindow0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetPositionWithTranslateInWindow0100 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetPositionWithTranslateInWindow0200
     * @tc.number SUB_ArkUI_ACE_ENGINE_OHArkUINodeUtilsGetPositionWithTranslateInWindow_0200
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetPositionWithTranslateInWindow interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetPositionWithTranslateInWindow0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetPositionWithTranslateInWindow0200 start====");
          let result: number = nativerenderndk.GetPositionWithTranslateInWindowTest_002()
          console.info(`====>testOHArkUINodeUtilsGetPositionWithTranslateInWindow0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetPositionWithTranslateInWindow0200 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetPositionWithTranslateInScreen0100
     * @tc.number SUB_ArkUI_ACE_ENGINE_OHArkUINodeUtilsGetPositionWithTranslateInScreen_0100
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetPositionWithTranslateInScreen interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetPositionWithTranslateInScreen0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetPositionWithTranslateInScreen0100 start====");
          let result: number = nativerenderndk.GetPositionWithTranslateInScreenTest_001()
          console.info(`====>testOHArkUINodeUtilsGetPositionWithTranslateInScreen0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetPositionWithTranslateInScreen0100 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetPositionWithTranslateInScreen0200
     * @tc.number SUB_ArkUI_ACE_ENGINE_OHArkUINodeUtilsGetPositionWithTranslateInScreen_0200
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetPositionWithTranslateInScreen interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetPositionWithTranslateInScreen0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetPositionWithTranslateInScreen0200 start====");
          let result: number = nativerenderndk.GetPositionWithTranslateInScreenTest_002()
          console.info(`====>testOHArkUINodeUtilsGetPositionWithTranslateInScreen0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetPositionWithTranslateInScreen0200 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetCustomProperty0100
     * @tc.number SUB_ArkUI_ACE_ENGINE_OHArkUINodeUtilsGetCustomProperty_0100
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetCustomProperty interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetCustomProperty0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetCustomProperty0100 start====");
          let result: number = nativerenderndk.GetCustomPropertyTest_001()
          console.info(`====>testOHArkUINodeUtilsGetCustomProperty0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetCustomProperty0100 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetActiveChildrenInfo0100
     * @tc.number SUB_ArkUI_ACE_ENGINE_OHArkUINodeUtilsGetActiveChildrenInfo_0100
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetActiveChildrenInfo interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetActiveChildrenInfo0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetActiveChildrenInfo0100 start====");
          let result: number = nativerenderndk.GetActiveChildrenInfoTest_001()
          console.info(`====>testOHArkUINodeUtilsGetActiveChildrenInfo0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetActiveChildrenInfo0100 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetActiveChildrenInfo0200
     * @tc.number SUB_ArkUI_ACE_ENGINE_OHArkUINodeUtilsGetActiveChildrenInfo_0200
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetActiveChildrenInfo interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetActiveChildrenInfo0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetActiveChildrenInfo0200 start====");
          let result: number = nativerenderndk.GetActiveChildrenInfoTest_002()
          console.info(`====>testOHArkUINodeUtilsGetActiveChildrenInfo0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetActiveChildrenInfo0200 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })
    /**
     * @tc.name   testOHArkUINodeUtilsSetCrossLanguageOption0100
     * @tc.number SUB_ArkUI_ACE_ENGINE_OH_ArkUI_NodeUtils_SetCrossLanguageOption_0100
     * @tc.desc   testing OH_ArkUI_NodeUtils_SetCrossLanguageOption interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsSetCrossLanguageOption0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsSetCrossLanguageOption0100 start====");
          let result: number = nativerenderndk.SetCrossLanguageOptionTest_001()
          console.info(`====>testOHArkUINodeUtilsSetCrossLanguageOption0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsSetCrossLanguageOption0100 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })
    /**
     * @tc.name   testOHArkUINodeUtilsSetCrossLanguageOption0200
     * @tc.number SUB_ArkUI_ACE_ENGINE_OH_ArkUI_NodeUtils_SetCrossLanguageOption_0200
     * @tc.desc   testing OH_ArkUI_NodeUtils_SetCrossLanguageOption interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsSetCrossLanguageOption0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsSetCrossLanguageOption0200 start====");
          let result: number = nativerenderndk.SetCrossLanguageOptionTest_002()
          console.info(`====>testOHArkUINodeUtilsSetCrossLanguageOption0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsSetCrossLanguageOption0200 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetCrossLanguageOption0100
     * @tc.number SUB_ArkUI_ACE_ENGINE_OH_ArkUI_NodeUtils_GetCrossLanguageOption_0100
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetCrossLanguageOption interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetCrossLanguageOption0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetCrossLanguageOption0100 start====");
          let result: number = nativerenderndk.GetCrossLanguageOptionTest_001()
          console.info(`====>testOHArkUINodeUtilsGetCrossLanguageOption0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetCrossLanguageOption0100 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetCrossLanguageOption0200
     * @tc.number SUB_ArkUI_ACE_ENGINE_OH_ArkUI_NodeUtils_GetCrossLanguageOption_0200
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetCrossLanguageOption interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetCrossLanguageOption0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetCrossLanguageOption0200 start====");
          let result: number = nativerenderndk.GetCrossLanguageOptionTest_002()
          console.info(`====>testOHArkUINodeUtilsGetCrossLanguageOption0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetCrossLanguageOption0200 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

  })
}