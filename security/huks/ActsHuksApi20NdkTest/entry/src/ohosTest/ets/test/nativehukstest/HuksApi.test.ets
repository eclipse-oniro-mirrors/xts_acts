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

export default function HuksApiTest() {
  describe('HuksApiTest', () => {
    beforeAll(async () => {
      console.info("====>testHuksApiTest start====");
    });
    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_Huks_GetSdkVersion_0100
       * @tc.name    testOH_Huks_GetSdkVersion0100
       * @tc.desc    testing OH_Huks_GetSdkVersion interface OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT(401)
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_Huks_GetSdkVersion0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_Huks_GetSdkVersion0100 start====");
          let result: number = nativehuksndk.GetSdkVersionTest_001();
          console.info(`====>testOH_Huks_GetSdkVersion0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_Huks_GetSdkVersion0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_Huks_GenerateKeyItem_0100
       * @tc.name    testOH_Huks_GenerateKeyItem0100
       * @tc.desc    testing OH_Huks_GenerateKeyItem interface OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT(401)
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_Huks_GenerateKeyItem0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_Huks_GenerateKeyItem0100 start====");
          let result: number = nativehuksndk.GenerateKeyItemTest_001();
          console.info(`====>testOH_Huks_GenerateKeyItem0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_Huks_GenerateKeyItem0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_Huks_GenerateKeyItem_0200
       * @tc.name    testOH_Huks_GenerateKeyItem0200
       * @tc.desc    testing OH_Huks_GenerateKeyItem interface OH_HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT (12000003)
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_Huks_GenerateKeyItem0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_Huks_GenerateKeyItem0200 start====");
          let result: number = nativehuksndk.GenerateKeyItemTest_002();
          console.info(`====>testOH_Huks_GenerateKeyItem0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_Huks_GenerateKeyItem0200 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_Huks_GenerateKeyItem_0300
       * @tc.name    testOH_Huks_GenerateKeyItem0300
       * @tc.desc    testing OH_Huks_GenerateKeyItem interface OH_HUKS_ERR_CODE_KEY_ALREADY_EXIST(12000017)
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_Huks_GenerateKeyItem0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_Huks_GenerateKeyItem0300 start====");
          let result: number = nativehuksndk.GenerateKeyItemTest_003();
          console.info(`====>testOH_Huks_GenerateKeyItem0300 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_Huks_GenerateKeyItem0300 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_Huks_GenerateKeyItem_0400
       * @tc.name    testOH_Huks_GenerateKeyItem0400
       * @tc.desc    testing OH_Huks_GenerateKeyItem interface OH_HUKS_ERR_CODE_MISSING_CRYPTO_ALG_ARGUMENT (12000002)
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_Huks_GenerateKeyItem0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_Huks_GenerateKeyItem0400 start====");
          let result: number = nativehuksndk.GenerateKeyItemTest_004();
          console.info(`====>testOH_Huks_GenerateKeyItem0400 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_Huks_GenerateKeyItem0400 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_Huks_GenerateKeyItem_0500
       * @tc.name    testOH_Huks_GenerateKeyItem0500
       * @tc.desc    testing OH_Huks_GenerateKeyItem interface OH_HUKS_ERR_CODE_DEVICE_PASSWORD_UNSET (12000016)
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_Huks_GenerateKeyItem0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_Huks_GenerateKeyItem0500 start====");
          let result: number = nativehuksndk.GenerateKeyItemTest_005();
          console.info(`====>testOH_Huks_GenerateKeyItem0500 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_Huks_GenerateKeyItem0500 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_Huks_ImportKeyItem_0100
       * @tc.name    testOH_Huks_ImportKeyItem0100
       * @tc.desc    testing OH_Huks_ImportKeyItem interface OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT(401)
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_Huks_ImportKeyItem0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_Huks_ImportKeyItem0100 start====");
          let result: number = nativehuksndk.ImportKeyItemTest_001();
          console.info(`====>testOH_Huks_ImportKeyItem0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_Huks_ImportKeyItem0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_Huks_ImportKeyItem_0200
       * @tc.name    testOH_Huks_ImportKeyItem0200
       * @tc.desc    testing OH_Huks_ImportKeyItem interface OH_HUKS_ERR_CODE_MISSING_CRYPTO_ALG_ARGUMENT(12000002)
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_Huks_ImportKeyItem0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_Huks_ImportKeyItem0200 start====");
          let result: number = nativehuksndk.ImportKeyItemTest_002();
          console.info(`====>testOH_Huks_ImportKeyItem0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_Huks_ImportKeyItem0200 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_Huks_ImportKeyItem_0300
       * @tc.name    testOH_Huks_ImportKeyItem0300
       * @tc.desc    testing OH_Huks_ImportKeyItem interface OH_HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT(12000003)
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_Huks_ImportKeyItem0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_Huks_ImportKeyItem0300 start====");
          let result: number = nativehuksndk.ImportKeyItemTest_003();
          console.info(`====>testOH_Huks_ImportKeyItem0300 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_Huks_ImportKeyItem0300 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_Huks_ImportKeyItem_0400
       * @tc.name    testOH_Huks_ImportKeyItem0400
       * @tc.desc    testing OH_Huks_ImportKeyItem interface OH_HUKS_ERR_CODE_KEY_ALREADY_EXIST(12000017)
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_Huks_ImportKeyItem0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_Huks_ImportKeyItem0400 start====");
          let result: number = nativehuksndk.ImportKeyItemTest_004();
          console.info(`====>testOH_Huks_ImportKeyItem0400 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_Huks_ImportKeyItem0400 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_Huks_ImportWrappedKeyItem_0100
       * @tc.name    testOH_Huks_ImportWrappedKeyItem0100
       * @tc.desc    testing OH_Huks_ImportWrappedKeyItem interface OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT(401)
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_Huks_ImportWrappedKeyItem0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_Huks_ImportWrappedKeyItem0100 start====");
          let result: number = nativehuksndk.ImportWrappedKeyItemTest_001();
          console.info(`====>testOH_Huks_ImportWrappedKeyItem0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_Huks_ImportWrappedKeyItem0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_Huks_ImportWrappedKeyItem_0200
       * @tc.name    testOH_Huks_ImportWrappedKeyItem0200
       * @tc.desc    testing OH_Huks_ImportWrappedKeyItem interface OH_HUKS_ERR_CODE_KEY_ALREADY_EXIST(12000017)
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_Huks_ImportWrappedKeyItem0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_Huks_ImportWrappedKeyItem0200 start====");
          let result: number = nativehuksndk.ImportWrappedKeyItemTest_002();
          console.info(`====>testOH_Huks_ImportWrappedKeyItem0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_Huks_ImportWrappedKeyItem0200 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_Huks_ExportPublicKeyItem_0100
       * @tc.name    testOH_Huks_ExportPublicKeyItem0100
       * @tc.desc    testing OH_Huks_ExportPublicKeyItem interface OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT(401)
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_Huks_ExportPublicKeyItem0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_Huks_ExportPublicKeyItem0100 start====");
          let result: number = nativehuksndk.ExportPublicKeyItemTest_001();
          console.info(`====>testOH_Huks_ExportPublicKeyItem0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_Huks_ExportPublicKeyItem0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_Huks_ExportPublicKeyItem_0200
       * @tc.name    testOH_Huks_ExportPublicKeyItem0200
       * @tc.desc    testing OH_Huks_ExportPublicKeyItem interface OH_HUKS_ERR_CODE_ITEM_NOT_EXIST(12000011)
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_Huks_ExportPublicKeyItem0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_Huks_ExportPublicKeyItem0200 start====");
          let result: number = nativehuksndk.ExportPublicKeyItemTest_002();
          console.info(`====>testOH_Huks_ExportPublicKeyItem0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_Huks_ExportPublicKeyItem0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_Huks_DeleteKeyItem_0100
       * @tc.name    testOH_Huks_DeleteKeyItem0100
       * @tc.desc    testing OH_Huks_DeleteKeyItem interface OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT(401)
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_Huks_DeleteKeyItem0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_Huks_DeleteKeyItem0100 start====");
          let result: number = nativehuksndk.DeleteKeyItemTest_001();
          console.info(`====>testOH_Huks_DeleteKeyItem0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_Huks_DeleteKeyItem0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_Huks_DeleteKeyItem_0200
       * @tc.name    testOH_Huks_DeleteKeyItem0200
       * @tc.desc    testing OH_Huks_DeleteKeyItem interface OH_HUKS_ERR_CODE_ITEM_NOT_EXIST(12000011)
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_Huks_DeleteKeyItem0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_Huks_DeleteKeyItem0200 start====");
          let result: number = nativehuksndk.DeleteKeyItemTest_002();
          console.info(`====>testOH_Huks_DeleteKeyItem0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_Huks_DeleteKeyItem0200 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_Huks_GetKeyItemParamSet_0100
       * @tc.name    testOH_Huks_GetKeyItemParamSet0100
       * @tc.desc    testing OH_Huks_GetKeyItemParamSet interface OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT(401)
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_Huks_GetKeyItemParamSet0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_Huks_GetKeyItemParamSet0100 start====");
          let result: number = nativehuksndk.GetKeyItemParamSetTest_001();
          console.info(`====>testOH_Huks_GetKeyItemParamSet0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_Huks_GetKeyItemParamSet0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_Huks_GetKeyItemParamSet_0200
       * @tc.name    testOH_Huks_GetKeyItemParamSet0200
       * @tc.desc    testing OH_Huks_GetKeyItemParamSet interface OH_HUKS_ERR_CODE_ITEM_NOT_EXIST(12000011)
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_Huks_GetKeyItemParamSet0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_Huks_GetKeyItemParamSet0200 start====");
          let result: number = nativehuksndk.GetKeyItemParamSetTest_002();
          console.info(`====>testOH_Huks_GetKeyItemParamSet0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_Huks_GetKeyItemParamSet0200 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
   * @tc.number  SUB_SECURITY_HUKS_OH_Huks_IsKeyItemExist_0100
   * @tc.name    testOH_Huks_IsKeyItemExist0100
   * @tc.desc    testing OH_Huks_IsKeyItemExist interface OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT(401)
   * @tc.size    MediumTest
   * @tc.type    Function
   * @tc.level   Level 1
   */
    it('testOH_Huks_IsKeyItemExist0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_Huks_IsKeyItemExist0100 start====");
          let result: number = nativehuksndk.IsKeyItemExistTest_001();
          console.info(`====>testOH_Huks_IsKeyItemExist0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_Huks_IsKeyItemExist0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_Huks_IsKeyItemExist_0200
       * @tc.name    testOH_Huks_IsKeyItemExist0200
       * @tc.desc    testing OH_Huks_IsKeyItemExist interface OH_HUKS_ERR_CODE_ITEM_NOT_EXIST(12000011)
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_Huks_IsKeyItemExist0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_Huks_IsKeyItemExist0200 start====");
          let result: number = nativehuksndk.IsKeyItemExistTest_002();
          console.info(`====>testOH_Huks_IsKeyItemExist0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_Huks_IsKeyItemExist0200 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.number  SUB_SECURITY_HUKS_OH_Huks_AttestKeyItem_0100
     * @tc.name    testOH_Huks_AttestKeyItem0100
     * @tc.desc    testing OH_Huks_AttestKeyItem interface OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT(401)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
   */
    it('testOH_Huks_AttestKeyItem0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_Huks_AttestKeyItem0100 start====");
          let result: number = nativehuksndk.AttestKeyItemTest_001();
          console.info(`====>testOH_Huks_AttestKeyItem0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_Huks_AttestKeyItem0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.number  SUB_SECURITY_HUKS_OH_Huks_AnonAttestKeyItem_0100
     * @tc.name    testOH_Huks_AnonAttestKeyItem0100
     * @tc.desc    testing OH_Huks_AnonAttestKeyItem interface OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT(401)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
   */
    it('testOH_Huks_AnonAttestKeyItem0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_Huks_AnonAttestKeyItem0100 start====");
          let result: number = nativehuksndk.AnonAttestKeyItemTest_001();
          console.info(`====>testOH_Huks_AnonAttestKeyItem0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_Huks_AnonAttestKeyItem0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_Huks_AnonAttestKeyItem_0200
       * @tc.name    testOH_Huks_AnonAttestKeyItem0200
       * @tc.desc    testing OH_Huks_AnonAttestKeyItem interface OH_HUKS_ERR_CODE_ITEM_NOT_EXIST(12000011)
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_Huks_AnonAttestKeyItem0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_Huks_AnonAttestKeyItem0200 start====");
          let result: number = nativehuksndk.AnonAttestKeyItemTest_002();
          console.info(`====>testOH_Huks_AnonAttestKeyItem0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_Huks_AnonAttestKeyItem0200 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.number  SUB_SECURITY_HUKS_OH_Huks_InitSession_0100
     * @tc.name    testOH_Huks_InitSession0100
     * @tc.desc    testing OH_Huks_InitSession interface OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT(401)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
   */
    it('testOH_Huks_InitSession0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_Huks_InitSession0100 start====");
          let result: number = nativehuksndk.InitSessionTest_001();
          console.info(`====>testOH_Huks_InitSession0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_Huks_InitSession0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_Huks_InitSession_0200
       * @tc.name    testOH_Huks_InitSession0200
       * @tc.desc    testing OH_Huks_InitSession interface OH_HUKS_ERR_CODE_ITEM_NOT_EXIST(12000011)
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_Huks_InitSession0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_Huks_InitSession0200 start====");
          let result: number = nativehuksndk.InitSessionTest_002();
          console.info(`====>testOH_Huks_InitSession0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_Huks_InitSession0200 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_Huks_InitSession_0300
       * @tc.name    testOH_Huks_InitSession0300
       * @tc.desc    testing OH_Huks_InitSession interface OH_HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT(12000003)
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_Huks_InitSession0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_Huks_InitSession0300 start====");
          let result: number = nativehuksndk.InitSessionTest_003();
          console.info(`====>testOH_Huks_InitSession0300 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_Huks_InitSession0300 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.number  SUB_SECURITY_HUKS_OH_Huks_UpdateSession_0100
     * @tc.name    testOH_Huks_UpdateSession0100
     * @tc.desc    testing OH_Huks_UpdateSession interface OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT(401)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
   */
    it('testOH_Huks_UpdateSession0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_Huks_UpdateSession0100 start====");
          let result: number = nativehuksndk.UpdateSessionTest_001();
          console.info(`====>testOH_Huks_UpdateSession0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_Huks_UpdateSession0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_Huks_UpdateSession_0200
       * @tc.name    testOH_Huks_UpdateSession0200
       * @tc.desc    testing OH_Huks_UpdateSession interface OH_HUKS_ERR_CODE_ITEM_NOT_EXIST(12000011)
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_Huks_UpdateSession0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_Huks_UpdateSession0200 start====");
          let result: number = nativehuksndk.UpdateSessionTest_002();
          console.info(`====>testOH_Huks_UpdateSession0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_Huks_UpdateSession0200 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.number  SUB_SECURITY_HUKS_OH_Huks_FinishSession_0100
     * @tc.name    testOH_Huks_FinishSession0100
     * @tc.desc    testing OH_Huks_FinishSession interface OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT(401)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
   */
    it('testOH_Huks_FinishSession0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_Huks_FinishSession0100 start====");
          let result: number = nativehuksndk.FinishSessionTest_001();
          console.info(`====>testOH_Huks_FinishSession0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_Huks_FinishSession0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_Huks_FinishSession_0200
       * @tc.name    testOH_Huks_FinishSession0200
       * @tc.desc    testing OH_Huks_FinishSession interface OH_HUKS_ERR_CODE_ITEM_NOT_EXIST(12000011)
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_Huks_FinishSession0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_Huks_FinishSession0200 start====");
          let result: number = nativehuksndk.FinishSessionTest_002();
          console.info(`====>testOH_Huks_FinishSession0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_Huks_FinishSession0200 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.number  SUB_SECURITY_HUKS_OH_Huks_AbortSession_0100
     * @tc.name    testOH_Huks_AbortSession0100
     * @tc.desc    testing OH_Huks_AbortSession interface OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT(401)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
    */
    it('testOH_Huks_AbortSession0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_Huks_AbortSession0100 start====");
          let result: number = nativehuksndk.AbortSessionTest_001();
          console.info(`====>testOH_Huks_AbortSession0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_Huks_AbortSession0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.number  SUB_SECURITY_HUKS_OH_Huks_ListAliases_0100
     * @tc.name    testOH_Huks_ListAliases0100
     * @tc.desc    testing OH_Huks_ListAliases interface OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT(401)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
    */
    it('testOH_Huks_ListAliases0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_Huks_ListAliases0100 start====");
          let result: number = nativehuksndk.ListAliasesTest_001();
          console.info(`====>testOH_Huks_ListAliases0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_Huks_ListAliases0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.number  SUB_SECURITY_HUKS_OH_Huks_WrapKey_0200
     * @tc.name    testOH_Huks_WrapKey0200
     * @tc.desc    testing OH_Huks_WrapKey interface OH_HUKS_ERR_CODE_INVALID_ARGUMENT(12000018)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
    */
    it('testOH_Huks_WrapKey0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_Huks_WrapKey0200 start====");
          let result: number = nativehuksndk.WrapKeyTest_002();
          console.info(`====>testOH_Huks_WrapKey0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_Huks_WrapKey0200 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.number  SUB_SECURITY_HUKS_OH_Huks_WrapKey_0300
     * @tc.name    testOH_Huks_WrapKey0300
     * @tc.desc    testing OH_Huks_WrapKey interface OH_HUKS_ERR_CODE_ITEM_NOT_EXIST(12000011)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
    */
    it('testOH_Huks_WrapKey0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_Huks_WrapKey0300 start====");
          let result: number = nativehuksndk.WrapKeyTest_003();
          console.info(`====>testOH_Huks_WrapKey0300 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_Huks_WrapKey0300 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.number  SUB_SECURITY_HUKS_OH_Huks_UnwrapKey_0200
     * @tc.name    testOH_Huks_UnwrapKey0200
     * @tc.desc    testing OH_Huks_UnwrapKey interface OH_HUKS_ERR_CODE_INVALID_ARGUMENT(12000018)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
    */
    it('testOH_Huks_UnwrapKey0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_Huks_UnwrapKey0200 start====");
          let result: number = nativehuksndk.UnwrapKeyTest_001();
          console.info(`====>testOH_Huks_UnwrapKey0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_Huks_UnwrapKey0200 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.number  SUB_SECURITY_HUKS_OH_Huks_InitParamSet_0100
     * @tc.name    testOH_Huks_InitParamSet0100
     * @tc.desc    testing OH_Huks_InitParamSet interface OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT(401)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
    */
    it('testOH_Huks_InitParamSet0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_Huks_InitParamSet0100 start====");
          let result: number = nativehuksndk.InitParamSetTest_001();
          console.info(`====>testOH_Huks_InitParamSet0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_Huks_InitParamSet0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.number  SUB_SECURITY_HUKS_OH_Huks_AddParams_0100
     * @tc.name    testOH_Huks_AddParams0100
     * @tc.desc    testing OH_Huks_AddParams interface OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT(401)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
    */
    it('testOH_Huks_AddParams0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_Huks_AddParams0100 start====");
          let result: number = nativehuksndk.AddParamsTest_001();
          console.info(`====>testOH_Huks_AddParams0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_Huks_AddParams0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.number  SUB_SECURITY_HUKS_OH_Huks_BuildParamSet_0100
     * @tc.name    testOH_Huks_BuildParamSet0100
     * @tc.desc    testing OH_Huks_BuildParamSet interface OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT(401)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
    */
    it('testOH_Huks_BuildParamSet0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_Huks_BuildParamSet0100 start====");
          let result: number = nativehuksndk.BuildParamSetTest_001();
          console.info(`====>testOH_Huks_BuildParamSet0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_Huks_BuildParamSet0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.number  SUB_SECURITY_HUKS_OH_Huks_CopyParamSet_0100
     * @tc.name    testOH_Huks_CopyParamSet0100
     * @tc.desc    testing OH_Huks_CopyParamSet interface OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT(401)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
    */
    it('testOH_Huks_CopyParamSet0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_Huks_CopyParamSet0100 start====");
          let result: number = nativehuksndk.CopyParamSetTest_001();
          console.info(`====>testOH_Huks_CopyParamSet0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_Huks_CopyParamSet0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.number  SUB_SECURITY_HUKS_OH_Huks_GetParam_0100
     * @tc.name    testOH_Huks_GetParam0100
     * @tc.desc    testing OH_Huks_GetParam interface OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT(401)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
    */
    it('testOH_Huks_GetParam0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_Huks_GetParam0100 start====");
          let result: number = nativehuksndk.GetParamTest_001();
          console.info(`====>testOH_Huks_GetParam0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_Huks_GetParam0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.number  SUB_SECURITY_HUKS_OH_Huks_FreshParamSet_0100
     * @tc.name    testOH_Huks_FreshParamSet0100
     * @tc.desc    testing OH_Huks_FreshParamSet interface OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT(401)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
    */
    it('testOH_Huks_FreshParamSet0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_Huks_FreshParamSet0100 start====");
          let result: number = nativehuksndk.FreshParamSetTest_001();
          console.info(`====>testOH_Huks_FreshParamSet0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_Huks_FreshParamSet0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.number  SUB_SECURITY_HUKS_OH_Huks_IsParamSetTagValid_0100
     * @tc.name    testOH_Huks_IsParamSetTagValid0100
     * @tc.desc    testing OH_Huks_IsParamSetTagValid interface OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT(401)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
    */
    it('testOH_Huks_IsParamSetTagValid0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_Huks_IsParamSetTagValid0100 start====");
          let result: number = nativehuksndk.IsParamSetTagValidTest_001();
          console.info(`====>testOH_Huks_IsParamSetTagValid0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_Huks_IsParamSetTagValid0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.number  SUB_SECURITY_HUKS_OH_Huks_IsParamSetValid_0100
     * @tc.name    testOH_Huks_IsParamSetValid0100
     * @tc.desc    testing OH_Huks_IsParamSetValid interface OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT(401)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
    */
    it('testOH_Huks_IsParamSetValid0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_Huks_IsParamSetValid0100 start====");
          let result: number = nativehuksndk.IsParamSetValidTest_001();
          console.info(`====>testOH_Huks_IsParamSetValid0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_Huks_IsParamSetValid0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.number  SUB_SECURITY_HUKS_OH_Huks_CheckParamMatch_0100
     * @tc.name    testOH_Huks_CheckParamMatch0100
     * @tc.desc    testing OH_Huks_CheckParamMatch interface OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT(401)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
    */
    it('testOH_Huks_CheckParamMatch0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_Huks_CheckParamMatch0100 start====");
          let result: number = nativehuksndk.CheckParamMatchTest_001();
          console.info(`====>testOH_Huks_CheckParamMatch0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_Huks_CheckParamMatch0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })
  })
}