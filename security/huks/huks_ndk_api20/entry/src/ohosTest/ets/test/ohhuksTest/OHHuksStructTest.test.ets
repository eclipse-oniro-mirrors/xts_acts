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
import nativehuksndk from 'libnativehuksndk.so'

export default function OHHuksStructTest() {
  describe('OHHuksStructTest', () => {
    beforeAll(async () => {
      console.info("====>testHuksApiTest start====");
    });

    /**
     * @tc.name   testGetOHHuksResult0100
     * @tc.number SUB_SECURITY_OH_Huks_Result_0100
     * @tc.desc   overriding struct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetOHHuksResult0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testGetOHHuksResult0100 start====");
          let result: number = nativehuksndk.GetOHHuksResult0100();
          console.info(`====>testGetOHHuksResult0100 result====${result}`);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>testGetOHHuksResult0100 err: " + err);
          expect(false).assertEqual(0);
          done();
        }
      })

    /**
     * @tc.name   testGetOHHuksResult0200
     * @tc.number SUB_SECURITY_OH_Huks_Result_0200
     * @tc.desc   overriding struct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetOHHuksResult0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testGetOHHuksResult0200 start====");
          let result: number = nativehuksndk.GetOHHuksResult0200();
          console.info(`====>testGetOHHuksResult0200 result====${result}`);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>testGetOHHuksResult0200 err: " + err);
          expect(false).assertEqual(0);
          done();
        }
      })

    /**
     * @tc.name   testGetOHHuksParamSet0100
     * @tc.number SUB_SECURITY_OH_Huks_ParamSet_0100
     * @tc.desc   overriding struct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetOHHuksParamSet0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testGetOHHuksParamSet0100 start====");
          let result: number = nativehuksndk.GetOHHuksParamSet0100();
          console.info(`====>testGetOHHuksParamSet0100 result====${result}`);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>testGetOHHuksParamSet0100 err: " + err);
          expect(false).assertEqual(0);
          done();
        }
      })

    /**
     * @tc.name   testGetOHHuksParamSet0200
     * @tc.number SUB_SECURITY_OH_Huks_ParamSet_0200
     * @tc.desc   overriding struct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetOHHuksParamSet0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testGetOHHuksParamSet0200 start====");
          let result: number = nativehuksndk.GetOHHuksParamSet0200();
          console.info(`====>testGetOHHuksParamSet0200 result====${result}`);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>testGetOHHuksParamSet0200 err: " + err);
          expect(false).assertEqual(0);
          done();
        }
      })

    /**
     * @tc.name   testGetOHHuksParam0100
     * @tc.number SUB_SECURITY_OH_Huks_Param_0100
     * @tc.desc   overriding struct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetOHHuksParam0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testGetOHHuksParam0100 start====");
          let result: number = nativehuksndk.GetOHHuksParam0100();
          console.info(`====>testGetOHHuksParam0100 result====${result}`);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>testGetOHHuksParam0100 err: " + err);
          expect(false).assertEqual(0);
          done();
        }
      })

    /**
     * @tc.name   testGetOHHuksParam0200
     * @tc.number SUB_SECURITY_OH_Huks_Param_0200
     * @tc.desc   overriding struct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetOHHuksParam0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testGetOHHuksParam0200 start====");
          let result: number = nativehuksndk.GetOHHuksParam0200();
          console.info(`====>testGetOHHuksParam0200 result====${result}`);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>testGetOHHuksParam0200 err: " + err);
          expect(false).assertEqual(0);
          done();
        }
      })

    /**
     * @tc.name   testGetOHHuksParam0300
     * @tc.number SUB_SECURITY_OH_Huks_Param_0300
     * @tc.desc   overriding struct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetOHHuksParam0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testGetOHHuksParam0300 start====");
          let result: number = nativehuksndk.GetOHHuksParam0300();
          console.info(`====>testGetOHHuksParam0300 result====${result}`);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>testGetOHHuksParam0300 err: " + err);
          expect(false).assertEqual(0);
          done();
        }
      })

    /**
     * @tc.name   testGetOHHuksParam0400
     * @tc.number SUB_SECURITY_OH_Huks_Param_0400
     * @tc.desc   overriding struct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetOHHuksParam0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testGetOHHuksParam0400 start====");
          let result: number = nativehuksndk.GetOHHuksParam0400();
          console.info(`====>testGetOHHuksParam0400 result====${result}`);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>testGetOHHuksParam0400 err: " + err);
          expect(false).assertEqual(0);
          done();
        }
      })

    /**
     * @tc.name   testGetOHHuksParam0500
     * @tc.number SUB_SECURITY_OH_Huks_Param_0500
     * @tc.desc   overriding struct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetOHHuksParam0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testGetOHHuksParam0500 start====");
          let result: number = nativehuksndk.GetOHHuksParam0500();
          console.info(`====>testGetOHHuksParam0500 result====${result}`);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>testGetOHHuksParam0500 err: " + err);
          expect(false).assertEqual(0);
          done();
        }
      })
  })
}