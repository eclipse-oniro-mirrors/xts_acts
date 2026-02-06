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
const ARKUI_ERROR_CODE_FORCE_DARK_CONFIG_INVALID = 106205;
const ARKUI_ERROR_CODE_ATTRIBUTE_OR_EVENT_NOT_SUPPORTED = 106102;
const ARKUI_INSPECTOR_NATIVE_RESULT_SUCCESSFUL = 0;
const ARKUI_INSPECTOR_NATIVE_RESULT_BAD_PARAMETER = -1;

export default function NodeUtilsTest2() {
  describe('NodeUtilsTest2', () => {
    beforeAll(async (done: Function) => {
      await Utils.pushPage(`nodeutils/nodeutilsTest`, done);
    });

    /**
     * @tc.name   testOHArkUISetForceDarkConfig0100
     * @tc.number SUB_ArkUI_ACE_ENGINE_OH_ArkUI_SetForceDarkConfig_0100
     * @tc.desc   testing OH_ArkUI_SetForceDarkConfig interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUISetForceDarkConfig0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUISetForceDarkConfig0100 start====");
          let result: number = nativerenderndk.SetForceDarkConfigTest_001()
          console.info(`====>testOHArkUISetForceDarkConfig0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUISetForceDarkConfig0100 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUISetForceDarkConfig0200
     * @tc.number SUB_ArkUI_ACE_ENGINE_OH_ArkUI_SetForceDarkConfig_0200
     * @tc.desc   testing OH_ArkUI_SetForceDarkConfig interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUISetForceDarkConfig0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUISetForceDarkConfig0200 start====");
          let result: number = nativerenderndk.SetForceDarkConfigTest_002()
          console.info(`====>testOHArkUISetForceDarkConfig0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUISetForceDarkConfig0200 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeCustomEventGetCustomSpanMeasureInfo0100
     * @tc.number SUB_ArkUI_ACE_ENGINE_OH_ArkUI_NodeCustomEvent_GetCustomSpanMeasureInfo_0100
     * @tc.desc   testing OH_ArkUI_NodeCustomEvent_GetCustomSpanMeasureInfo interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeCustomEventGetCustomSpanMeasureInfo0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeCustomEventGetCustomSpanMeasureInfo0100 start====");
          let result: number = nativerenderndk.GetCustomSpanMeasureInfoTest_001()
          console.info(`====>testOHArkUINodeCustomEventGetCustomSpanMeasureInfo0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeCustomEventGetCustomSpanMeasureInfo0100 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeCustomEventGetCustomSpanMeasureInfo0200
     * @tc.number SUB_ArkUI_ACE_ENGINE_OH_ArkUI_NodeCustomEvent_GetCustomSpanMeasureInfo_0200
     * @tc.desc   testing OH_ArkUI_NodeCustomEvent_GetCustomSpanMeasureInfo interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeCustomEventGetCustomSpanMeasureInfo0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeCustomEventGetCustomSpanMeasureInfo0200 start====");
          let result: number = nativerenderndk.GetCustomSpanMeasureInfoTest_002()
          console.info(`====>testOHArkUINodeCustomEventGetCustomSpanMeasureInfo0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeCustomEventGetCustomSpanMeasureInfo0200 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeCustomEventSetCustomSpanMetrics0100
     * @tc.number SUB_ArkUI_ACE_ENGINE_OH_ArkUI_NodeCustomEvent_SetCustomSpanMetrics_0100
     * @tc.desc   testing OH_ArkUI_NodeCustomEvent_SetCustomSpanMetrics interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeCustomEventSetCustomSpanMetrics0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeCustomEventSetCustomSpanMetrics0100 start====");
          let result: number = nativerenderndk.SetCustomSpanMetricsTest_001()
          console.info(`====>testOHArkUINodeCustomEventSetCustomSpanMetrics0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeCustomEventSetCustomSpanMetrics0100 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeCustomEventSetCustomSpanMetrics0200
     * @tc.number SUB_ArkUI_ACE_ENGINE_OH_ArkUI_NodeCustomEvent_SetCustomSpanMetrics_0200
     * @tc.desc   testing OH_ArkUI_NodeCustomEvent_SetCustomSpanMetrics interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeCustomEventSetCustomSpanMetrics0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeCustomEventSetCustomSpanMetrics0200 start====");
          let result: number = nativerenderndk.SetCustomSpanMetricsTest_002()
          console.info(`====>testOHArkUINodeCustomEventSetCustomSpanMetrics0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeCustomEventSetCustomSpanMetrics0200 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeCustomEventGetCustomSpanDrawInfo0100
     * @tc.number SUB_ArkUI_ACE_ENGINE_OH_ArkUI_NodeCustomEvent_GetCustomSpanDrawInfo_0100
     * @tc.desc   testing OH_ArkUI_NodeCustomEvent_GetCustomSpanDrawInfo interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeCustomEventGetCustomSpanDrawInfo0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeCustomEventGetCustomSpanDrawInfo0100 start====");
          let result: number = nativerenderndk.GetCustomSpanDrawInfoTest_001()
          console.info(`====>testOHArkUINodeCustomEventGetCustomSpanDrawInfo0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeCustomEventGetCustomSpanDrawInfo0100 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeCustomEventGetCustomSpanDrawInfo0200
     * @tc.number SUB_ArkUI_ACE_ENGINE_OH_ArkUI_NodeCustomEvent_GetCustomSpanDrawInfo_0200
     * @tc.desc   testing OH_ArkUI_NodeCustomEvent_GetCustomSpanDrawInfo interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeCustomEventGetCustomSpanDrawInfo0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeCustomEventGetCustomSpanDrawInfo0200 start====");
          let result: number = nativerenderndk.GetCustomSpanDrawInfoTest_002()
          console.info(`====>testOHArkUINodeCustomEventGetCustomSpanDrawInfo0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeCustomEventGetCustomSpanDrawInfo0200 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUIListCloseAllSwipeActions0100
     * @tc.number SUB_ArkUI_ACE_ENGINE_OH_ArkUI_List_CloseAllSwipeActions_0100
     * @tc.desc   testing OH_ArkUI_List_CloseAllSwipeActions interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIListCloseAllSwipeActions0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIListCloseAllSwipeActions0100 start====");
          let result: number = nativerenderndk.CloseAllSwipeActionsTest_001()
          console.info(`====>testOHArkUIListCloseAllSwipeActions0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIListCloseAllSwipeActions0100 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUIListCloseAllSwipeActions0200
     * @tc.number SUB_ArkUI_ACE_ENGINE_OH_ArkUI_List_CloseAllSwipeActions_0200
     * @tc.desc   testing OH_ArkUI_List_CloseAllSwipeActions interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIListCloseAllSwipeActions0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIListCloseAllSwipeActions0200 start====");
          let result: number = nativerenderndk.CloseAllSwipeActionsTest_002()
          console.info(`====>testOHArkUIListCloseAllSwipeActions0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIListCloseAllSwipeActions0200 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUIListCloseAllSwipeActions0300
     * @tc.number SUB_ArkUI_ACE_ENGINE_OH_ArkUI_List_CloseAllSwipeActions_0300
     * @tc.desc   testing OH_ArkUI_List_CloseAllSwipeActions interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIListCloseAllSwipeActions0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIListCloseAllSwipeActions0300 start====");
          let result: number = nativerenderndk.CloseAllSwipeActionsTest_003()
          console.info(`====>testOHArkUIListCloseAllSwipeActions0300 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIListCloseAllSwipeActions0300 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUIRegisterSystemColorModeChangeEvent0200
     * @tc.number SUB_ArkUI_ACE_ENGINE_OH_ArkUI_RegisterSystemColorModeChangeEvent_0200
     * @tc.desc   testing OH_ArkUI_RegisterSystemColorModeChangeEvent interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIRegisterSystemColorModeChangeEvent0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIRegisterSystemColorModeChangeEvent0200 start====");
          let result: number = nativerenderndk.RegisterSystemColorModeChangeTest_002()
          console.info(`====>testOHArkUIRegisterSystemColorModeChangeEvent0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIRegisterSystemColorModeChangeEvent0200 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUIRegisterSystemFontStyleChangeEvent0200
     * @tc.number SUB_ArkUI_ACE_ENGINE_OH_ArkUI_RegisterSystemFontStyleChangeEvent_0200
     * @tc.desc   testing OH_ArkUI_RegisterSystemFontStyleChangeEvent interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIRegisterSystemFontStyleChangeEvent0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIRegisterSystemFontStyleChangeEvent0200 start====");
          let result: number = nativerenderndk.RegisterSystemFontStyleChangeTest_002()
          console.info(`====>testOHArkUIRegisterSystemFontStyleChangeEvent0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIRegisterSystemFontStyleChangeEvent0200 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUIRegisterLayoutCallbackOnNodeHandle0100
     * @tc.number SUB_ArkUI_ACE_ENGINE_OH_ArkUI_RegisterLayoutCallbackOnNodeHandle_0100
     * @tc.desc   testing OH_ArkUI_RegisterLayoutCallbackOnNodeHandle interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIRegisterLayoutCallbackOnNodeHandle0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIRegisterLayoutCallbackOnNodeHandle0100 start====");
          let result: number = nativerenderndk.RegisterLayoutCallbackOnNodeTest_001()
          console.info(`====>testOHArkUIRegisterLayoutCallbackOnNodeHandle0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIRegisterLayoutCallbackOnNodeHandle0100 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUIRegisterDrawCallbackOnNodeHandle0100
     * @tc.number SUB_ArkUI_ACE_ENGINE_OH_ArkUI_RegisterDrawCallbackOnNodeHandle_0100
     * @tc.desc   testing OH_ArkUI_RegisterDrawCallbackOnNodeHandle interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIRegisterDrawCallbackOnNodeHandle0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIRegisterDrawCallbackOnNodeHandle0100 start====");
          let result: number = nativerenderndk.RegisterDrawCallbackOnNodeTest_001()
          console.info(`====>testOHArkUIRegisterDrawCallbackOnNodeHandle0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIRegisterDrawCallbackOnNodeHandle0100 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUIUnregisterLayoutCallbackOnNodeHandle0100
     * @tc.number SUB_ArkUI_ACE_ENGINE_OH_ArkUI_UnregisterLayoutCallbackOnNodeHandle_0100
     * @tc.desc   testing OH_ArkUI_UnregisterLayoutCallbackOnNodeHandle interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIUnregisterLayoutCallbackOnNodeHandle0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIUnregisterLayoutCallbackOnNodeHandle0100 start====");
          let result: number = nativerenderndk.UnregisterLayoutCallbackOnNodeTest_001()
          console.info(`====>testOHArkUIUnregisterLayoutCallbackOnNodeHandle0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIUnregisterLayoutCallbackOnNodeHandle0100 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUIUnregisterDrawCallbackOnNodeHandle0100
     * @tc.number SUB_ArkUI_ACE_ENGINE_OH_ArkUI_UnregisterDrawCallbackOnNodeHandle_0100
     * @tc.desc   testing OH_ArkUI_UnregisterDrawCallbackOnNodeHandle interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIUnregisterDrawCallbackOnNodeHandle0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIUnregisterDrawCallbackOnNodeHandle0100 start====");
          let result: number = nativerenderndk.UnregisterDrawCallbackOnNodeTest_001()
          console.info(`====>testOHArkUIUnregisterDrawCallbackOnNodeHandle0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIUnregisterDrawCallbackOnNodeHandle0100 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetPositionToParent0100
     * @tc.number SUB_ArkUI_ACE_ENGINE_OH_ArkUI_NodeUtils_GetPositionToParent_0100
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetPositionToParent interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetPositionToParent0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetPositionToParent0100 start====");
          let result: number = nativerenderndk.GetPositionToParentTest_001()
          console.info(`====>testOHArkUINodeUtilsGetPositionToParent0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetPositionToParent0100 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetPositionToParent0200
     * @tc.number SUB_ArkUI_ACE_ENGINE_OH_ArkUI_NodeUtils_GetPositionToParent_0200
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetPositionToParent interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetPositionToParent0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetPositionToParent0200 start====");
          let result: number = nativerenderndk.GetPositionToParentTest_002()
          console.info(`====>testOHArkUINodeUtilsGetPositionToParent0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetPositionToParent0200 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetNodeHandleByUniqueId0100
     * @tc.number SUB_ArkUI_ACE_ENGINE_OH_ArkUI_NodeUtils_GetNodeHandleByUniqueId_0100
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetNodeHandleByUniqueId interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetNodeHandleByUniqueId0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetNodeHandleByUniqueId0100 start====");
          let result: number = nativerenderndk.GetNodeHandleByUniqueIdTest_001()
          console.info(`====>testOHArkUINodeUtilsGetNodeHandleByUniqueId0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetNodeHandleByUniqueId0100 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetNodeHandleByUniqueId0200
     * @tc.number SUB_ArkUI_ACE_ENGINE_OH_ArkUI_NodeUtils_GetNodeHandleByUniqueId_0200
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetNodeHandleByUniqueId interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetNodeHandleByUniqueId0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetNodeHandleByUniqueId0200 start====");
          let result: number = nativerenderndk.GetNodeHandleByUniqueIdTest_002()
          console.info(`====>testOHArkUINodeUtilsGetNodeHandleByUniqueId0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetNodeHandleByUniqueId0200 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetNodeUniqueId0100
     * @tc.number SUB_ArkUI_ACE_ENGINE_OH_ArkUI_NodeUtils_GetNodeUniqueId_0100
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetNodeUniqueId interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetNodeUniqueId0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetNodeUniqueId0100 start====");
          let result: number = nativerenderndk.GetNodeUniqueIdTest_001()
          console.info(`====>testOHArkUINodeUtilsGetNodeUniqueId0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetNodeUniqueId0100 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetNodeUniqueId0200
     * @tc.number SUB_ArkUI_ACE_ENGINE_OH_ArkUI_NodeUtils_GetNodeUniqueId_0200
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetNodeUniqueId interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetNodeUniqueId0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetNodeUniqueId0200 start====");
          let result: number = nativerenderndk.GetNodeUniqueIdTest_002()
          console.info(`====>testOHArkUINodeUtilsGetNodeUniqueId0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetNodeUniqueId0200 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUIAddSupportedUIStates0100
     * @tc.number SUB_ArkUI_ACE_ENGINE_OH_ArkUI_AddSupportedUIStates_0100
     * @tc.desc   testing OH_ArkUI_AddSupportedUIStates interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIAddSupportedUIStates0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIAddSupportedUIStates0100 start====");
          let result: number = nativerenderndk.AddSupportedUIStatesTest_001()
          console.info(`====>testOHArkUIAddSupportedUIStates0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIAddSupportedUIStates0100 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUIAddSupportedUIStates0200
     * @tc.number SUB_ArkUI_ACE_ENGINE_OH_ArkUI_AddSupportedUIStates_0200
     * @tc.desc   testing OH_ArkUI_AddSupportedUIStates interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIAddSupportedUIStates0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIAddSupportedUIStates0200 start====");
          let result: number = nativerenderndk.AddSupportedUIStatesTest_002()
          console.info(`====>testOHArkUIAddSupportedUIStates0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIAddSupportedUIStates0200 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUIRemoveSupportedUIStates0100
     * @tc.number SUB_ArkUI_ACE_ENGINE_OH_ArkUI_RemoveSupportedUIStates_0100
     * @tc.desc   testing OH_ArkUI_RemoveSupportedUIStates interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIRemoveSupportedUIStates0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIRemoveSupportedUIStates0100 start====");
          let result: number = nativerenderndk.RemoveSupportedUIStatesTest_001()
          console.info(`====>testOHArkUIRemoveSupportedUIStates0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIRemoveSupportedUIStates0100 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUIRemoveSupportedUIStates0200
     * @tc.number SUB_ArkUI_ACE_ENGINE_OH_ArkUI_RemoveSupportedUIStates_0200
     * @tc.desc   testing OH_ArkUI_RemoveSupportedUIStates interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIRemoveSupportedUIStates0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIRemoveSupportedUIStates0200 start====");
          let result: number = nativerenderndk.RemoveSupportedUIStatesTest_002()
          console.info(`====>testOHArkUIRemoveSupportedUIStates0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIRemoveSupportedUIStates0200 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })
  })
}