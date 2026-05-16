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
import mindsporendk from 'libmindsporendk.so'

const ARKUI_ERROR_CODE_NO_ERROR = 0;
const ARKUI_ERROR_CODE_ERROR = 1;

export default function MindSporeDataTypeTest() {
  describe('MindSporeDataTypeTest', () => {
    beforeAll(async (done: Function) => {
    });
    /**
     * @tc.name   testdatatypetest_001
     * @tc.number SUB_AI_MINDSPORE_OH_AI_DATATYPE_UNKNOWN_0100
     * @tc.desc   testing OH_AI_DATATYPE_UNKNOWN interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testdatatypetest_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testdatatypetest_001 start====");
          let result: number = mindsporendk.DataTypeTest_001();
          console.info(`====>testdatatypetest_001 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testdatatypetest_001 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testdatatypetest_002
     * @tc.number SUB_AI_MINDSPORE_OH_AI_DATATYPE_OBJECTTYPE_STRING_0100
     * @tc.desc   testing OH_AI_DATATYPE_OBJECTTYPE_STRING interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testdatatypetest_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testdatatypetest_002 start====");
          let result: number = mindsporendk.DataTypeTest_002();
          console.info(`====>testdatatypetest_002 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testdatatypetest_002 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testdatatypetest_007
     * @tc.number SUB_AI_MINDSPORE_OH_AI_DATATYPE_NUMBERTYPE_BOOL_0100
     * @tc.desc   testing OH_AI_DATATYPE_NUMBERTYPE_BOOL interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testdatatypetest_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testdatatypetest_007 start====");
          let result: number = mindsporendk.DataTypeTest_007();
          console.info(`====>testdatatypetest_007 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testdatatypetest_007 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testdatatypetest_008
     * @tc.number SUB_AI_MINDSPORE_OH_AI_DATATYPE_NUMBERTYPE_INT8_0100
     * @tc.desc   testing OH_AI_DATATYPE_NUMBERTYPE_INT8 interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testdatatypetest_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testdatatypetest_008 start====");
          let result: number = mindsporendk.DataTypeTest_008();
          console.info(`====>testdatatypetest_008 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testdatatypetest_008 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testdatatypetest_009
     * @tc.number SUB_AI_MINDSPORE_OH_AI_DATATYPE_NUMBERTYPE_INT16_0100
     * @tc.desc   testing OH_AI_DATATYPE_NUMBERTYPE_INT16 interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testdatatypetest_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testdatatypetest_009 start====");
          let result: number = mindsporendk.DataTypeTest_009();
          console.info(`====>testdatatypetest_009 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testdatatypetest_009 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testdatatypetest_010
     * @tc.number SUB_AI_MINDSPORE_OH_AI_DATATYPE_NUMBERTYPE_INT32_0100
     * @tc.desc   testing OH_AI_DATATYPE_NUMBERTYPE_INT32 interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testdatatypetest_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testdatatypetest_010 start====");
          let result: number = mindsporendk.DataTypeTest_010();
          console.info(`====>testdatatypetest_010 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testdatatypetest_010 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testdatatypetest_011
     * @tc.number SUB_AI_MINDSPORE_OH_AI_DATATYPE_NUMBERTYPE_INT64_0100
     * @tc.desc   testing OH_AI_DATATYPE_NUMBERTYPE_INT64 interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testdatatypetest_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testdatatypetest_011 start====");
          let result: number = mindsporendk.DataTypeTest_011();
          console.info(`====>testdatatypetest_011 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testdatatypetest_011 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testdatatypetest_012
     * @tc.number SUB_AI_MINDSPORE_OH_AI_DATATYPE_NUMBERTYPE_UINT8_0100
     * @tc.desc   testing OH_AI_DATATYPE_NUMBERTYPE_UINT8 interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testdatatypetest_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testdatatypetest_012 start====");
          let result: number = mindsporendk.DataTypeTest_012();
          console.info(`====>testdatatypetest_012 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testdatatypetest_012 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testdatatypetest_013
     * @tc.number SUB_AI_MINDSPORE_OH_AI_DATATYPE_NUMBERTYPE_UINT16_0100
     * @tc.desc   testing OH_AI_DATATYPE_NUMBERTYPE_UINT16 interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testdatatypetest_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testdatatypetest_013 start====");
          let result: number = mindsporendk.DataTypeTest_013();
          console.info(`====>testdatatypetest_013 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testdatatypetest_013 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testdatatypetest_014
     * @tc.number SUB_AI_MINDSPORE_OH_AI_DATATYPE_NUMBERTYPE_UINT32_0100
     * @tc.desc   testing OH_AI_DATATYPE_NUMBERTYPE_UINT32 interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testdatatypetest_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testdatatypetest_014 start====");
          let result: number = mindsporendk.DataTypeTest_014();
          console.info(`====>testdatatypetest_014 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testdatatypetest_014 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testdatatypetest_015
     * @tc.number SUB_AI_MINDSPORE_OH_AI_DATATYPE_NUMBERTYPE_UINT64_0100
     * @tc.desc   testing OH_AI_DATATYPE_NUMBERTYPE_UINT64 interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testdatatypetest_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testdatatypetest_015 start====");
          let result: number = mindsporendk.DataTypeTest_015();
          console.info(`====>testdatatypetest_015 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testdatatypetest_015 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

  })
}