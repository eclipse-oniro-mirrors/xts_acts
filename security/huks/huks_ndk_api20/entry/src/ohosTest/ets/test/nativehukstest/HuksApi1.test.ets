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

export default function HuksApiTest1() {
  describe('HuksApiTest1', () => {
    let developmentDevice: boolean = false;
    beforeAll(async () => {
      developmentDevice = nativehuksndk.KeySizeTest_004() == 0;
      console.info("====>testHuksApiTest1 start====");
    });

    /**
     * @tc.name   testOH_HUKS_KEY_PURPOSE_MAC0100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_KEY_PURPOSE_MAC_0100
     * @tc.desc   testing OH_HUKS_KEY_PURPOSE_MAC interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_KEY_PURPOSE_MAC0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_KEY_PURPOSE_MAC0100 start====");
          let result: number = nativehuksndk.KeyPurposeTest_002();
          console.info(`====>testOH_HUKS_KEY_PURPOSE_MAC0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_KEY_PURPOSE_MAC0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_DIGEST_SM30100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_DIGEST_SM3_0100
     * @tc.desc   testing OH_HUKS_DIGEST_SM3 interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_DIGEST_SM30100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_DIGEST_SM30100 start====");
          let result: number = nativehuksndk.KeyDigestTest_002();
          console.info(`====>testOH_HUKS_DIGEST_SM30100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_DIGEST_SM30100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_DIGEST_SHA2240100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_DIGEST_SHA224_0100
     * @tc.desc   testing OH_HUKS_DIGEST_SHA224 interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_DIGEST_SHA2240100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_DIGEST_SHA2240100 start====");
          let result: number = nativehuksndk.KeyDigestTest_003();
          console.info(`====>testOH_HUKS_DIGEST_SHA2240100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_DIGEST_SHA2240100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_DIGEST_SHA5120100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_DIGEST_SHA512_0100
     * @tc.desc   testing OH_HUKS_DIGEST_SHA512 interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_DIGEST_SHA5120100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_DIGEST_SHA5120100 start====");
          let result: number = nativehuksndk.KeyDigestTest_004();
          console.info(`====>testOH_HUKS_DIGEST_SHA5120100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_DIGEST_SHA5120100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_PADDING_PKCS1_V1_50100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_PADDING_PKCS1_V1_5_0100
     * @tc.desc   testing OH_HUKS_PADDING_PKCS1_V1_5 interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_PADDING_PKCS1_V1_50100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_PADDING_PKCS1_V1_50100 start====");
          let result: number = nativehuksndk.KeyPaddingTest_001();
          console.info(`====>testOH_HUKS_PADDING_PKCS1_V1_50100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_PADDING_PKCS1_V1_50100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_PADDING_PKCS50100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_PADDING_PKCS5_0100
     * @tc.desc   testing OH_HUKS_PADDING_PKCS5 interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_PADDING_PKCS50100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_PADDING_PKCS50100 start====");
          let result: number = nativehuksndk.KeyPaddingTest_002();
          console.info(`====>testOH_HUKS_PADDING_PKCS50100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_PADDING_PKCS50100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_PADDING_PKCS70100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_PADDING_PKCS7_0100
     * @tc.desc   testing OH_HUKS_PADDING_PKCS7 interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_PADDING_PKCS70100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_PADDING_PKCS70100 start====");
          let result: number = nativehuksndk.KeyPaddingTest_003();
          console.info(`====>testOH_HUKS_PADDING_PKCS70100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_PADDING_PKCS70100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_PADDING_ISO_IEC_9796_20100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_PADDING_ISO_IEC_9796_2_0100
     * @tc.desc   testing OH_HUKS_PADDING_ISO_IEC_9796_2 interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_PADDING_ISO_IEC_9796_20100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_PADDING_ISO_IEC_9796_20100 start====");
          let result: number = nativehuksndk.KeyPaddingTest_004();
          console.info(`====>testOH_HUKS_PADDING_ISO_IEC_9796_20100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_PADDING_ISO_IEC_9796_20100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_PADDING_ISO_IEC_9797_10100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_PADDING_ISO_IEC_9797_1_0100
     * @tc.desc   testing OH_HUKS_PADDING_ISO_IEC_9797_1 interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_PADDING_ISO_IEC_9797_10100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_PADDING_ISO_IEC_9797_10100 start====");
          let result: number = nativehuksndk.KeyPaddingTest_005();
          console.info(`====>testOH_HUKS_PADDING_ISO_IEC_9797_10100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_PADDING_ISO_IEC_9797_10100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_MODE_CBC0100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_MODE_CBC_0100
     * @tc.desc   testing OH_HUKS_MODE_CBC interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_MODE_CBC0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_MODE_CBC0100 start====");
          let result: number = nativehuksndk.CipherModeTest_001();
          console.info(`====>testOH_HUKS_MODE_CBC0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_MODE_CBC0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_MODE_CTR0100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_MODE_CTR_0100
     * @tc.desc   testing OH_HUKS_MODE_CTR interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_MODE_CTR0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_MODE_CTR0100 start====");
          let result: number = nativehuksndk.CipherModeTest_002();
          console.info(`====>testOH_HUKS_MODE_CTR0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_MODE_CTR0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_MODE_OFB0100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_MODE_OFB_0100
     * @tc.desc   testing OH_HUKS_MODE_OFB interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_MODE_OFB0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_MODE_OFB0100 start====");
          let result: number = nativehuksndk.CipherModeTest_003();
          console.info(`====>testOH_HUKS_MODE_OFB0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_MODE_OFB0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_MODE_CFB0100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_MODE_CFB_0100
     * @tc.desc   testing OH_HUKS_MODE_CFB interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_MODE_CFB0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_MODE_CFB0100 start====");
          let result: number = nativehuksndk.CipherModeTest_004();
          console.info(`====>testOH_HUKS_MODE_CFB0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_MODE_CFB0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_MODE_CCM0100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_MODE_CCM_0100
     * @tc.desc   testing OH_HUKS_MODE_CCM interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_MODE_CCM0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_MODE_CCM0100 start====");
          let result: number = nativehuksndk.CipherModeTest_005();
          console.info(`====>testOH_HUKS_MODE_CCM0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_MODE_CCM0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_RSA_KEY_SIZE_5120100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_RSA_KEY_SIZE_512_0100
     * @tc.desc   testing OH_HUKS_RSA_KEY_SIZE_512 interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_RSA_KEY_SIZE_5120100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_RSA_KEY_SIZE_5120100 start====");
          let result: number = nativehuksndk.KeySizeTest_001();
          console.info(`====>testOH_HUKS_RSA_KEY_SIZE_5120100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_RSA_KEY_SIZE_5120100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_RSA_KEY_SIZE_7680100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_RSA_KEY_SIZE_768_0100
     * @tc.desc   testing OH_HUKS_RSA_KEY_SIZE_768 interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_RSA_KEY_SIZE_7680100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_RSA_KEY_SIZE_7680100 start====");
          let result: number = nativehuksndk.KeySizeTest_002();
          console.info(`====>testOH_HUKS_RSA_KEY_SIZE_7680100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_RSA_KEY_SIZE_7680100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_RSA_KEY_SIZE_30720100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_RSA_KEY_SIZE_3072_0100
     * @tc.desc   testing OH_HUKS_RSA_KEY_SIZE_3072 interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_RSA_KEY_SIZE_30720100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_RSA_KEY_SIZE_30720100 start====");
          let result: number = nativehuksndk.KeySizeTest_003();
          console.info(`====>testOH_HUKS_RSA_KEY_SIZE_30720100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_RSA_KEY_SIZE_30720100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_ECC_KEY_SIZE_2240100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_ECC_KEY_SIZE_224_0100
     * @tc.desc   testing OH_HUKS_ECC_KEY_SIZE_224 interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_ECC_KEY_SIZE_2240100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_ECC_KEY_SIZE_2240100 start====");
          let result: number = nativehuksndk.KeySizeTest_004();
          console.info(`====>testOH_HUKS_ECC_KEY_SIZE_2240100 result====${result}`);
          if (developmentDevice) {
            expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          } else {
            expect(developmentDevice).assertFalse();
          }
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_ECC_KEY_SIZE_2240100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_ECC_KEY_SIZE_2560100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_ECC_KEY_SIZE_256_0100
     * @tc.desc   testing OH_HUKS_ECC_KEY_SIZE_256 interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_ECC_KEY_SIZE_2560100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_ECC_KEY_SIZE_2560100 start====");
          let result: number = nativehuksndk.KeySizeTest_005();
          console.info(`====>testOH_HUKS_ECC_KEY_SIZE_2560100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_ECC_KEY_SIZE_2560100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_ECC_KEY_SIZE_3840100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_ECC_KEY_SIZE_384_0100
     * @tc.desc   testing OH_HUKS_ECC_KEY_SIZE_384 interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_ECC_KEY_SIZE_3840100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_ECC_KEY_SIZE_3840100 start====");
          let result: number = nativehuksndk.KeySizeTest_006();
          console.info(`====>testOH_HUKS_ECC_KEY_SIZE_3840100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_ECC_KEY_SIZE_3840100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_ECC_KEY_SIZE_5210100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_ECC_KEY_SIZE_521_0100
     * @tc.desc   testing OH_HUKS_ECC_KEY_SIZE_521 interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_ECC_KEY_SIZE_5210100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_ECC_KEY_SIZE_5210100 start====");
          let result: number = nativehuksndk.KeySizeTest_007();
          console.info(`====>testOH_HUKS_ECC_KEY_SIZE_5210100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_ECC_KEY_SIZE_5210100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_AES_KEY_SIZE_1280100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_AES_KEY_SIZE_128_0100
     * @tc.desc   testing OH_HUKS_AES_KEY_SIZE_128 interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_AES_KEY_SIZE_1280100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_AES_KEY_SIZE_1280100 start====");
          let result: number = nativehuksndk.KeySizeTest_008();
          console.info(`====>testOH_HUKS_AES_KEY_SIZE_1280100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_AES_KEY_SIZE_1280100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_AES_KEY_SIZE_1920100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_AES_KEY_SIZE_192_0100
     * @tc.desc   testing OH_HUKS_AES_KEY_SIZE_192 interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_AES_KEY_SIZE_1920100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_AES_KEY_SIZE_1920100 start====");
          let result: number = nativehuksndk.KeySizeTest_009();
          console.info(`====>testOH_HUKS_AES_KEY_SIZE_1920100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_AES_KEY_SIZE_1920100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_AES_KEY_SIZE_5120100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_AES_KEY_SIZE_512_0100
     * @tc.desc   testing OH_HUKS_AES_KEY_SIZE_512 interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_AES_KEY_SIZE_5120100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_AES_KEY_SIZE_5120100 start====");
          let result: number = nativehuksndk.KeySizeTest_010();
          console.info(`====>testOH_HUKS_AES_KEY_SIZE_5120100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_AES_KEY_SIZE_5120100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_DH_KEY_SIZE_20480100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_DH_KEY_SIZE_2048_0100
     * @tc.desc   testing OH_HUKS_DH_KEY_SIZE_2048 interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_DH_KEY_SIZE_20480100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_DH_KEY_SIZE_20480100 start====");
          let result: number = nativehuksndk.KeySizeTest_011();
          console.info(`====>testOH_HUKS_DH_KEY_SIZE_20480100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_DH_KEY_SIZE_20480100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_DH_KEY_SIZE_30720100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_DH_KEY_SIZE_3072_0100
     * @tc.desc   testing OH_HUKS_DH_KEY_SIZE_3072 interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_DH_KEY_SIZE_30720100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_DH_KEY_SIZE_30720100 start====");
          let result: number = nativehuksndk.KeySizeTest_012();
          console.info(`====>testOH_HUKS_DH_KEY_SIZE_30720100 result====${result}`);
          if (developmentDevice) {
            expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          } else {
            expect(developmentDevice).assertFalse();
          }
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_DH_KEY_SIZE_30720100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_DH_KEY_SIZE_40960100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_DH_KEY_SIZE_4096_0100
     * @tc.desc   testing OH_HUKS_DH_KEY_SIZE_4096 interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_DH_KEY_SIZE_40960100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_DH_KEY_SIZE_40960100 start====");
          let result: number = nativehuksndk.KeySizeTest_013();
          console.info(`====>testOH_HUKS_DH_KEY_SIZE_40960100 result====${result}`);
          if (developmentDevice) {
            expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          } else {
            expect(developmentDevice).assertFalse();
          }
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_DH_KEY_SIZE_40960100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_SM2_KEY_SIZE_2560100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_SM2_KEY_SIZE_256_0100
     * @tc.desc   testing OH_HUKS_SM2_KEY_SIZE_256 interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_SM2_KEY_SIZE_2560100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_SM2_KEY_SIZE_2560100 start====");
          let result: number = nativehuksndk.KeySizeTest_014();
          console.info(`====>testOH_HUKS_SM2_KEY_SIZE_2560100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_SM2_KEY_SIZE_2560100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_SM4_KEY_SIZE_1280100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_SM4_KEY_SIZE_128_0100
     * @tc.desc   testing OH_HUKS_SM4_KEY_SIZE_128 interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_SM4_KEY_SIZE_1280100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_SM4_KEY_SIZE_1280100 start====");
          let result: number = nativehuksndk.KeySizeTest_015();
          console.info(`====>testOH_HUKS_SM4_KEY_SIZE_1280100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_SM4_KEY_SIZE_1280100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_DES_KEY_SIZE_640100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_DES_KEY_SIZE_64_0100
     * @tc.desc   testing OH_HUKS_DES_KEY_SIZE_64 interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_DES_KEY_SIZE_640100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_DES_KEY_SIZE_640100 start====");
          let result: number = nativehuksndk.KeySizeTest_016();
          console.info(`====>testOH_HUKS_DES_KEY_SIZE_640100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_DES_KEY_SIZE_640100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_3DES_KEY_SIZE_1280100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_3DES_KEY_SIZE_128_0100
     * @tc.desc   testing OH_HUKS_3DES_KEY_SIZE_128 interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_3DES_KEY_SIZE_1280100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_3DES_KEY_SIZE_1280100 start====");
          let result: number = nativehuksndk.KeySizeTest_017();
          console.info(`====>testOH_HUKS_3DES_KEY_SIZE_1280100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_3DES_KEY_SIZE_1280100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_3DES_KEY_SIZE_1920100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_3DES_KEY_SIZE_192_0100
     * @tc.desc   testing OH_HUKS_3DES_KEY_SIZE_192 interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_3DES_KEY_SIZE_1920100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_3DES_KEY_SIZE_1920100 start====");
          let result: number = nativehuksndk.KeySizeTest_018();
          console.info(`====>testOH_HUKS_3DES_KEY_SIZE_1920100 result====${result}`);
          if (developmentDevice) {
            expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          } else {
            expect(developmentDevice).assertFalse();
          }
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_3DES_KEY_SIZE_1920100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_ALG_ECC0100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_ALG_ECC_0100
     * @tc.desc   testing OH_HUKS_ALG_ECC interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_ALG_ECC0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_ALG_ECC0100 start====");
          let result: number = nativehuksndk.KeyAlgTest_001();
          console.info(`====>testOH_HUKS_ALG_ECC0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_ALG_ECC0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_ALG_HMAC0100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_ALG_HMAC_0100
     * @tc.desc   testing OH_HUKS_ALG_HMAC interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_ALG_HMAC0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_ALG_HMAC0100 start====");
          let result: number = nativehuksndk.KeyAlgTest_002();
          console.info(`====>testOH_HUKS_ALG_HMAC0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_ALG_HMAC0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_ALG_ED255190100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_ALG_ED25519_0100
     * @tc.desc   testing OH_HUKS_ALG_ED25519 interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_ALG_ED255190100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_ALG_ED255190100 start====");
          let result: number = nativehuksndk.KeyAlgTest_004();
          console.info(`====>testOH_HUKS_ALG_ED255190100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_ALG_ED255190100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_ALG_DH0100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_ALG_DH_0100
     * @tc.desc   testing OH_HUKS_ALG_DH interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_ALG_DH0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_ALG_DH0100 start====");
          let result: number = nativehuksndk.KeyAlgTest_005();
          console.info(`====>testOH_HUKS_ALG_DH0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_ALG_DH0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_ALG_SM20100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_ALG_SM2_0100
     * @tc.desc   testing OH_HUKS_ALG_SM2 interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_ALG_SM20100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_ALG_SM20100 start====");
          let result: number = nativehuksndk.KeyAlgTest_006();
          console.info(`====>testOH_HUKS_ALG_SM20100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_ALG_SM20100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_ALG_SM30100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_ALG_SM3_0100
     * @tc.desc   testing OH_HUKS_ALG_SM3 interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_ALG_SM30100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_ALG_SM30100 start====");
          let result: number = nativehuksndk.KeyAlgTest_007();
          console.info(`====>testOH_HUKS_ALG_SM30100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_ALG_SM30100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_ALG_SM40100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_ALG_SM4_0100
     * @tc.desc   testing OH_HUKS_ALG_SM4 interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_ALG_SM40100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_ALG_SM40100 start====");
          let result: number = nativehuksndk.KeyAlgTest_008();
          console.info(`====>testOH_HUKS_ALG_SM40100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_ALG_SM40100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_ALG_DES0100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_ALG_DES_0100
     * @tc.desc   testing OH_HUKS_ALG_DES interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_ALG_DES0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_ALG_DES0100 start====");
          let result: number = nativehuksndk.KeyAlgTest_009();
          console.info(`====>testOH_HUKS_ALG_DES0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_ALG_DES0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_ALG_3DES0100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_ALG_3DES_0100
     * @tc.desc   testing OH_HUKS_ALG_3DES interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_ALG_3DES0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_ALG_3DES0100 start====");
          let result: number = nativehuksndk.KeyAlgTest_010();
          console.info(`====>testOH_HUKS_ALG_3DES0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_ALG_3DES0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING0100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING_0100
     * @tc.desc   testing OH_HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING0100 start====");
          let result: number = nativehuksndk.AlgSuiteTest_001();
          console.info(`====>testOH_HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_STORAGE_TEMP0100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_STORAGE_TEMP_0100
     * @tc.desc   testing OH_HUKS_STORAGE_TEMP interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_STORAGE_TEMP0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_STORAGE_TEMP0100 start====");
          let result: number = nativehuksndk.KeyStorageTypeTest_001();
          console.info(`====>testOH_HUKS_STORAGE_TEMP0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_STORAGE_TEMP0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_STORAGE_ONLY_USED_IN_HUKS0100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_STORAGE_ONLY_USED_IN_HUKS_0100
     * @tc.desc   testing OH_HUKS_STORAGE_ONLY_USED_IN_HUKS interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_STORAGE_ONLY_USED_IN_HUKS0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_STORAGE_ONLY_USED_IN_HUKS0100 start====");
          let result: number = nativehuksndk.KeyStorageTypeTest_002();
          console.info(`====>testOH_HUKS_STORAGE_ONLY_USED_IN_HUKS0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_STORAGE_ONLY_USED_IN_HUKS0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_STORAGE_KEY_EXPORT_ALLOWED0100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_STORAGE_KEY_EXPORT_ALLOWED_0100
     * @tc.desc   testing OH_HUKS_STORAGE_KEY_EXPORT_ALLOWED interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_STORAGE_KEY_EXPORT_ALLOWED0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_STORAGE_KEY_EXPORT_ALLOWED0100 start====");
          let result: number = nativehuksndk.KeyStorageTypeTest_003();
          console.info(`====>testOH_HUKS_STORAGE_KEY_EXPORT_ALLOWED0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_STORAGE_KEY_EXPORT_ALLOWED0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_KEY_TYPE_PUBLIC_KEY0100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_KEY_TYPE_PUBLIC_KEY_0100
     * @tc.desc   testing OH_HUKS_KEY_TYPE_PUBLIC_KEY interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_KEY_TYPE_PUBLIC_KEY0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_KEY_TYPE_PUBLIC_KEY0100 start====");
          let result: number = nativehuksndk.ImportKeyTypeTest_001();
          console.info(`====>testOH_HUKS_KEY_TYPE_PUBLIC_KEY0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_KEY_TYPE_PUBLIC_KEY0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_KEY_TYPE_PRIVATE_KEY0100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_KEY_TYPE_PRIVATE_KEY_0100
     * @tc.desc   testing OH_HUKS_KEY_TYPE_PRIVATE_KEY interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_KEY_TYPE_PRIVATE_KEY0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_KEY_TYPE_PRIVATE_KEY0100 start====");
          let result: number = nativehuksndk.ImportKeyTypeTest_002();
          console.info(`====>testOH_HUKS_KEY_TYPE_PRIVATE_KEY0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_KEY_TYPE_PRIVATE_KEY0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_KEY_TYPE_KEY_PAIR0100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_KEY_TYPE_KEY_PAIR_0100
     * @tc.desc   testing OH_HUKS_KEY_TYPE_KEY_PAIR interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_KEY_TYPE_KEY_PAIR0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_KEY_TYPE_KEY_PAIR0100 start====");
          let result: number = nativehuksndk.ImportKeyTypeTest_003();
          console.info(`====>testOH_HUKS_KEY_TYPE_KEY_PAIR0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_KEY_TYPE_KEY_PAIR0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_RSA_PSS_SALT_LEN_DIGEST0100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_RSA_PSS_SALT_LEN_DIGEST_0100
     * @tc.desc   testing OH_HUKS_RSA_PSS_SALT_LEN_DIGEST interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_RSA_PSS_SALT_LEN_DIGEST0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_RSA_PSS_SALT_LEN_DIGEST0100 start====");
          let result: number = nativehuksndk.RsaPssSaltLenTypeTest_001();
          console.info(`====>testOH_HUKS_RSA_PSS_SALT_LEN_DIGEST0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_RSA_PSS_SALT_LEN_DIGEST0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_RSA_PSS_SALT_LEN_MAX0100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_RSA_PSS_SALT_LEN_MAX_0100
     * @tc.desc   testing OH_HUKS_RSA_PSS_SALT_LEN_MAX interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_RSA_PSS_SALT_LEN_MAX0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_RSA_PSS_SALT_LEN_MAX0100 start====");
          let result: number = nativehuksndk.RsaPssSaltLenTypeTest_002();
          console.info(`====>testOH_HUKS_RSA_PSS_SALT_LEN_MAX0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_RSA_PSS_SALT_LEN_MAX0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

  })
}
