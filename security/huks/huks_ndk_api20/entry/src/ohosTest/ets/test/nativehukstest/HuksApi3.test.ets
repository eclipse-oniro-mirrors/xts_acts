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

const ARKUI_ERROR_CODE_NO_ERROR = 0;
const ARKUI_ERROR_CODE_ERROR = 1;

export default function HuksApiTest3() {
  describe('HuksApiTest3', () => {
    beforeAll(async () => {
      console.info("====>testHuksApiTest3 start====");
    });

    /**
     * @tc.name   testOH_HUKS_ERR_CODE_MISSING_CRYPTO_ALG_ARGUMENT0100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_ERR_CODE_MISSING_CRYPTO_ALG_ARGUMENT_0100
     * @tc.desc   testing OH_HUKS_ERR_CODE_MISSING_CRYPTO_ALG_ARGUMENT interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_ERR_CODE_MISSING_CRYPTO_ALG_ARGUMENT0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_ERR_CODE_MISSING_CRYPTO_ALG_ARGUMENT0100 start====");
          let result: number = nativehuksndk.ErrCodeTest_001();
          console.info(`====>testOH_HUKS_ERR_CODE_MISSING_CRYPTO_ALG_ARGUMENT0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_ERR_CODE_MISSING_CRYPTO_ALG_ARGUMENT0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT0100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT_0100
     * @tc.desc   testing OH_HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT0100 start====");
          let result: number = nativehuksndk.ErrCodeTest_002();
          console.info(`====>testOH_HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_ERR_CODE_ITEM_NOT_EXIST0100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_ERR_CODE_ITEM_NOT_EXIST_0100
     * @tc.desc   testing OH_HUKS_ERR_CODE_ITEM_NOT_EXIST interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_ERR_CODE_ITEM_NOT_EXIST0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_ERR_CODE_ITEM_NOT_EXIST0100 start====");
          let result: number = nativehuksndk.ErrCodeTest_003();
          console.info(`====>testOH_HUKS_ERR_CODE_ITEM_NOT_EXIST0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_ERR_CODE_ITEM_NOT_EXIST0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_ERR_CODE_DEVICE_PASSWORD_UNSET0100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_ERR_CODE_DEVICE_PASSWORD_UNSET_0100
     * @tc.desc   testing OH_HUKS_ERR_CODE_DEVICE_PASSWORD_UNSET interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_ERR_CODE_DEVICE_PASSWORD_UNSET0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_ERR_CODE_DEVICE_PASSWORD_UNSET0100 start====");
          let result: number = nativehuksndk.ErrCodeTest_004();
          console.info(`====>testOH_HUKS_ERR_CODE_DEVICE_PASSWORD_UNSET0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_ERR_CODE_DEVICE_PASSWORD_UNSET0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_ERR_CODE_KEY_ALREADY_EXIST0100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_ERR_CODE_KEY_ALREADY_EXIST_0100
     * @tc.desc   testing OH_HUKS_ERR_CODE_KEY_ALREADY_EXIST interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_ERR_CODE_KEY_ALREADY_EXIST0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_ERR_CODE_KEY_ALREADY_EXIST0100 start====");
          let result: number = nativehuksndk.ErrCodeTest_005();
          console.info(`====>testOH_HUKS_ERR_CODE_KEY_ALREADY_EXIST0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_ERR_CODE_KEY_ALREADY_EXIST0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_ERR_CODE_INVALID_ARGUMENT0100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_ERR_CODE_INVALID_ARGUMENT_0100
     * @tc.desc   testing OH_HUKS_ERR_CODE_INVALID_ARGUMENT interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_ERR_CODE_INVALID_ARGUMENT0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_ERR_CODE_INVALID_ARGUMENT0100 start====");
          let result: number = nativehuksndk.ErrCodeTest_006();
          console.info(`====>testOH_HUKS_ERR_CODE_INVALID_ARGUMENT0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_ERR_CODE_INVALID_ARGUMENT0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_ERR_CODE_FEATURE_NOT_SUPPORTED0100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_ERR_CODE_FEATURE_NOT_SUPPORTED_0100
     * @tc.desc   testing OH_HUKS_ERR_CODE_FEATURE_NOT_SUPPORTED interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_ERR_CODE_FEATURE_NOT_SUPPORTED0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_ERR_CODE_FEATURE_NOT_SUPPORTED0100 start====");
          let result: number = nativehuksndk.ErrCodeTest_007();
          console.info(`====>testOH_HUKS_ERR_CODE_FEATURE_NOT_SUPPORTED0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_ERR_CODE_FEATURE_NOT_SUPPORTED0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })


    /**
     * @tc.name   testOH_HUKS_AUTH_STORAGE_LEVEL_CE0100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_AUTH_STORAGE_LEVEL_CE_0100
     * @tc.desc   testing OH_HUKS_AUTH_STORAGE_LEVEL_CE interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_AUTH_STORAGE_LEVEL_CE0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_AUTH_STORAGE_LEVEL_CE0100 start====");
          let result: number = nativehuksndk.AuthStorageLevelTest_001();
          console.info(`====>testOH_HUKS_AUTH_STORAGE_LEVEL_CE0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_AUTH_STORAGE_LEVEL_CE0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_AUTH_STORAGE_LEVEL_ECE0100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_AUTH_STORAGE_LEVEL_ECE_0100
     * @tc.desc   testing OH_HUKS_AUTH_STORAGE_LEVEL_ECE interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_AUTH_STORAGE_LEVEL_ECE0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_AUTH_STORAGE_LEVEL_ECE0100 start====");
          let result: number = nativehuksndk.AuthStorageLevelTest_002();
          console.info(`====>testOH_HUKS_AUTH_STORAGE_LEVEL_ECE0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_AUTH_STORAGE_LEVEL_ECE0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })


  })
}
