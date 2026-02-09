/**
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

export default function NodeUtilsTest1() {
  describe('NodeUtilsTest1', () => {
    /**
     * @tc.name   testOHArkUINodeUtilsGetNodeType0100
     * @tc.number SUB_ArkUI_ACE_ENGINE_OHArkUINodeUtilsGetNodeType_0100
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetNodeType interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetNodeType0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetNodeType0100 start====");
          let result: number = nativerenderndk.GetNodeTypeTest_001()
          console.info(`====>testOHArkUINodeUtilsGetNodeType0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetNodeType0100 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetNodeType0200
     * @tc.number SUB_ArkUI_ACE_ENGINE_OHArkUINodeUtilsGetNodeType_0200
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetNodeType interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetNodeType0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetNodeType0200 start====");
          let result: number = nativerenderndk.GetNodeTypeTest_002()
          console.info(`====>testOHArkUINodeUtilsGetNodeType0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetNodeType0200 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetNodeType0300
     * @tc.number SUB_ArkUI_ACE_ENGINE_OHArkUINodeUtilsGetNodeType_0300
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetNodeType interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetNodeType0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetNodeType0300 start====");
          let result: number = nativerenderndk.GetNodeTypeTest_003()
          console.info(`====>testOHArkUINodeUtilsGetNodeType0300 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetNodeType0300 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetNodeType0400
     * @tc.number SUB_ArkUI_ACE_ENGINE_OHArkUINodeUtilsGetNodeType_0400
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetNodeType interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetNodeType0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetNodeType0400 start====");
          let result: number = nativerenderndk.GetNodeTypeTest_004()
          console.info(`====>testOHArkUINodeUtilsGetNodeType0400 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetNodeType0400 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetNodeType0500
     * @tc.number SUB_ArkUI_ACE_ENGINE_OHArkUINodeUtilsGetNodeType_0500
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetNodeType interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetNodeType0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetNodeType0500 start====");
          let result: number = nativerenderndk.GetNodeTypeTest_005()
          console.info(`====>testOHArkUINodeUtilsGetNodeType0500 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetNodeType0500 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetNodeType0600
     * @tc.number SUB_ArkUI_ACE_ENGINE_OHArkUINodeUtilsGetNodeType_0600
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetNodeType interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetNodeType0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetNodeType0600 start====");
          let result: number = nativerenderndk.GetNodeTypeTest_006()
          console.info(`====>testOHArkUINodeUtilsGetNodeType0600 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetNodeType0600 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetNodeType0700
     * @tc.number SUB_ArkUI_ACE_ENGINE_OHArkUINodeUtilsGetNodeType_0700
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetNodeType interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetNodeType0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetNodeType0700 start====");
          let result: number = nativerenderndk.GetNodeTypeTest_007()
          console.info(`====>testOHArkUINodeUtilsGetNodeType0700 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetNodeType0700 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetNodeType0800
     * @tc.number SUB_ArkUI_ACE_ENGINE_OHArkUINodeUtilsGetNodeType_0800
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetNodeType interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetNodeType0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetNodeType0800 start====");
          let result: number = nativerenderndk.GetNodeTypeTest_008()
          console.info(`====>testOHArkUINodeUtilsGetNodeType0800 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetNodeType0800 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetNodeType0900
     * @tc.number SUB_ArkUI_ACE_ENGINE_OHArkUINodeUtilsGetNodeType_0900
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetNodeType interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetNodeType0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetNodeType0900 start====");
          let result: number = nativerenderndk.GetNodeTypeTest_009()
          console.info(`====>testOHArkUINodeUtilsGetNodeType0900 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetNodeType0900 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetNodeType1000
     * @tc.number SUB_ArkUI_ACE_ENGINE_OHArkUINodeUtilsGetNodeType_1000
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetNodeType interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetNodeType1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetNodeType1000 start====");
          let result: number = nativerenderndk.GetNodeTypeTest_010()
          console.info(`====>testOHArkUINodeUtilsGetNodeType1000 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetNodeType1000 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetNodeType1100
     * @tc.number SUB_ArkUI_ACE_ENGINE_OHArkUINodeUtilsGetNodeType_1100
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetNodeType interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetNodeType1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetNodeType1100 start====");
          let result: number = nativerenderndk.GetNodeTypeTest_011()
          console.info(`====>testOHArkUINodeUtilsGetNodeType1100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetNodeType1100 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetNodeType1200
     * @tc.number SUB_ArkUI_ACE_ENGINE_OHArkUINodeUtilsGetNodeType_1200
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetNodeType interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetNodeType1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetNodeType1200 start====");
          let result: number = nativerenderndk.GetNodeTypeTest_012()
          console.info(`====>testOHArkUINodeUtilsGetNodeType1200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetNodeType1200 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetNodeType1300
     * @tc.number SUB_ArkUI_ACE_ENGINE_OHArkUINodeUtilsGetNodeType_1300
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetNodeType interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetNodeType1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetNodeType1300 start====");
          let result: number = nativerenderndk.GetNodeTypeTest_013()
          console.info(`====>testOHArkUINodeUtilsGetNodeType1300 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetNodeType1300 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetNodeType1400
     * @tc.number SUB_ArkUI_ACE_ENGINE_OHArkUINodeUtilsGetNodeType_1400
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetNodeType interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetNodeType1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetNodeType1400 start====");
          let result: number = nativerenderndk.GetNodeTypeTest_014()
          console.info(`====>testOHArkUINodeUtilsGetNodeType1400 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetNodeType1400 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetNodeType1500
     * @tc.number SUB_ArkUI_ACE_ENGINE_OHArkUINodeUtilsGetNodeType_1500
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetNodeType interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetNodeType1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetNodeType1500 start====");
          let result: number = nativerenderndk.GetNodeTypeTest_015()
          console.info(`====>testOHArkUINodeUtilsGetNodeType1500 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetNodeType1500 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetNodeType1600
     * @tc.number SUB_ArkUI_ACE_ENGINE_OHArkUINodeUtilsGetNodeType_1600
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetNodeType interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetNodeType1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetNodeType1600 start====");
          let result: number = nativerenderndk.GetNodeTypeTest_016()
          console.info(`====>testOHArkUINodeUtilsGetNodeType1600 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetNodeType1600 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetNodeType1800
     * @tc.number SUB_ArkUI_ACE_ENGINE_OHArkUINodeUtilsGetNodeType_1800
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetNodeType interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetNodeType1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetNodeType1800 start====");
          let result: number = nativerenderndk.GetNodeTypeTest_018()
          console.info(`====>testOHArkUINodeUtilsGetNodeType1800 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetNodeType1800 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetNodeType1900
     * @tc.number SUB_ArkUI_ACE_ENGINE_OHArkUINodeUtilsGetNodeType_1900
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetNodeType interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetNodeType1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetNodeType1900 start====");
          let result: number = nativerenderndk.GetNodeTypeTest_019()
          console.info(`====>testOHArkUINodeUtilsGetNodeType1900 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetNodeType1900 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetNodeType2000
     * @tc.number SUB_ArkUI_ACE_ENGINE_OHArkUINodeUtilsGetNodeType_2000
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetNodeType interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetNodeType2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetNodeType2000 start====");
          let result: number = nativerenderndk.GetNodeTypeTest_020()
          console.info(`====>testOHArkUINodeUtilsGetNodeType2000 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetNodeType2000 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetNodeType2100
     * @tc.number SUB_ArkUI_ACE_ENGINE_OHArkUINodeUtilsGetNodeType_2100
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetNodeType interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetNodeType2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetNodeType2100 start====");
          let result: number = nativerenderndk.GetNodeTypeTest_021()
          console.info(`====>testOHArkUINodeUtilsGetNodeType2100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetNodeType2100 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetNodeType2200
     * @tc.number SUB_ArkUI_ACE_ENGINE_OHArkUINodeUtilsGetNodeType_2200
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetNodeType interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetNodeType2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetNodeType2200 start====");
          let result: number = nativerenderndk.GetNodeTypeTest_022()
          console.info(`====>testOHArkUINodeUtilsGetNodeType2200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetNodeType2200 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetNodeType2300
     * @tc.number SUB_ArkUI_ACE_ENGINE_OHArkUINodeUtilsGetNodeType_2300
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetNodeType interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetNodeType2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetNodeType2300 start====");
          let result: number = nativerenderndk.GetNodeTypeTest_023()
          console.info(`====>testOHArkUINodeUtilsGetNodeType2300 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetNodeType2300 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetNodeType2400
     * @tc.number SUB_ArkUI_ACE_ENGINE_OHArkUINodeUtilsGetNodeType_2400
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetNodeType interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetNodeType2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetNodeType2400 start====");
          let result: number = nativerenderndk.GetNodeTypeTest_024()
          console.info(`====>testOHArkUINodeUtilsGetNodeType2400 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetNodeType2400 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetNodeType2500
     * @tc.number SUB_ArkUI_ACE_ENGINE_OHArkUINodeUtilsGetNodeType_2500
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetNodeType interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetNodeType2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetNodeType2500 start====");
          let result: number = nativerenderndk.GetNodeTypeTest_025()
          console.info(`====>testOHArkUINodeUtilsGetNodeType2500 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetNodeType2500 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetNodeType2600
     * @tc.number SUB_ArkUI_ACE_ENGINE_OHArkUINodeUtilsGetNodeType_2600
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetNodeType interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetNodeType2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetNodeType2600 start====");
          let result: number = nativerenderndk.GetNodeTypeTest_026()
          console.info(`====>testOHArkUINodeUtilsGetNodeType2600 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetNodeType2600 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetNodeType2700
     * @tc.number SUB_ArkUI_ACE_ENGINE_OHArkUINodeUtilsGetNodeType_2700
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetNodeType interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetNodeType2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetNodeType2700 start====");
          let result: number = nativerenderndk.GetNodeTypeTest_027()
          console.info(`====>testOHArkUINodeUtilsGetNodeType2700 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetNodeType2700 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetNodeType2800
     * @tc.number SUB_ArkUI_ACE_ENGINE_OHArkUINodeUtilsGetNodeType_2800
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetNodeType interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetNodeType2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetNodeType2800 start====");
          let result: number = nativerenderndk.GetNodeTypeTest_028()
          console.info(`====>testOHArkUINodeUtilsGetNodeType2800 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetNodeType2800 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetNodeType2900
     * @tc.number SUB_ArkUI_ACE_ENGINE_OHArkUINodeUtilsGetNodeType_2900
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetNodeType interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetNodeType2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetNodeType2900 start====");
          let result: number = nativerenderndk.GetNodeTypeTest_029()
          console.info(`====>testOHArkUINodeUtilsGetNodeType2900 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetNodeType2900 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetNodeType3000
     * @tc.number SUB_ArkUI_ACE_ENGINE_OHArkUINodeUtilsGetNodeType_3000
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetNodeType interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetNodeType3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetNodeType3000 start====");
          let result: number = nativerenderndk.GetNodeTypeTest_030()
          console.info(`====>testOHArkUINodeUtilsGetNodeType3000 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetNodeType3000 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetNodeType3100
     * @tc.number SUB_ArkUI_ACE_ENGINE_OHArkUINodeUtilsGetNodeType_3100
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetNodeType interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetNodeType3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetNodeType3100 start====");
          let result: number = nativerenderndk.GetNodeTypeTest_031()
          console.info(`====>testOHArkUINodeUtilsGetNodeType3100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetNodeType3100 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetNodeType3200
     * @tc.number SUB_ArkUI_ACE_ENGINE_OHArkUINodeUtilsGetNodeType_3200
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetNodeType interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetNodeType3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetNodeType3200 start====");
          let result: number = nativerenderndk.GetNodeTypeTest_032()
          console.info(`====>testOHArkUINodeUtilsGetNodeType3200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetNodeType3200 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetNodeType3300
     * @tc.number SUB_ArkUI_ACE_ENGINE_OHArkUINodeUtilsGetNodeType_3300
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetNodeType interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetNodeType3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetNodeType3300 start====");
          let result: number = nativerenderndk.GetNodeTypeTest_033()
          console.info(`====>testOHArkUINodeUtilsGetNodeType3300 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetNodeType3300 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetNodeType3400
     * @tc.number SUB_ArkUI_ACE_ENGINE_OHArkUINodeUtilsGetNodeType_3400
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetNodeType interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetNodeType3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetNodeType3400 start====");
          let result: number = nativerenderndk.GetNodeTypeTest_034()
          console.info(`====>testOHArkUINodeUtilsGetNodeType3400 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetNodeType3400 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetNodeType3500
     * @tc.number SUB_ArkUI_ACE_ENGINE_OHArkUINodeUtilsGetNodeType_3500
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetNodeType interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetNodeType3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetNodeType3500 start====");
          let result: number = nativerenderndk.GetNodeTypeTest_035()
          console.info(`====>testOHArkUINodeUtilsGetNodeType3500 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetNodeType3500 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetNodeType3600
     * @tc.number testOHArkUINodeUtilsGetNodeType3600
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetNodeType interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetNodeType3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetNodeType3600 start====");
          let result: number = nativerenderndk.GetNodeTypeTest_036()
          console.info(`====>testOHArkUINodeUtilsGetNodeType3600 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetNodeType3600 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetNodeType3700
     * @tc.number SUB_ArkUI_ACE_ENGINE_OHArkUINodeUtilsGetNodeType_3700
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetNodeType interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetNodeType3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetNodeType3700 start====");
          let result: number = nativerenderndk.GetNodeTypeTest_037()
          console.info(`====>testOHArkUINodeUtilsGetNodeType3700 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetNodeType3700 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetNodeType3800
     * @tc.number SUB_ArkUI_ACE_ENGINE_OHArkUINodeUtilsGetNodeType_3800
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetNodeType interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetNodeType3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetNodeType3800 start====");
          let result: number = nativerenderndk.GetNodeTypeTest_038()
          console.info(`====>testOHArkUINodeUtilsGetNodeType3800 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetNodeType3800 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /**
     * @tc.name   testOHArkUINodeUtilsGetNodeType3900
     * @tc.number SUB_ArkUI_ACE_ENGINE_OHArkUINodeUtilsGetNodeType_3900
     * @tc.desc   testing OH_ArkUI_NodeUtils_GetNodeType interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUINodeUtilsGetNodeType3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeUtilsGetNodeType3900 start====");
          let result: number = nativerenderndk.GetNodeTypeTest_039()
          console.info(`====>testOHArkUINodeUtilsGetNodeType3900 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeUtilsGetNodeType3900 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

  })
}