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
     * @tc.name   testOH_HUKS_AUTH_ACCESS_INVALID_CLEAR_PASSWORD0100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_AUTH_ACCESS_INVALID_CLEAR_PASSWORD_0100
     * @tc.desc   testing OH_HUKS_AUTH_ACCESS_INVALID_CLEAR_PASSWORD interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_AUTH_ACCESS_INVALID_CLEAR_PASSWORD0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_AUTH_ACCESS_INVALID_CLEAR_PASSWORD0100 start====");
          let result: number = nativehuksndk.AuthAccessTypeTest_001();
          console.info(`====>testOH_HUKS_AUTH_ACCESS_INVALID_CLEAR_PASSWORD0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_AUTH_ACCESS_INVALID_CLEAR_PASSWORD0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_AUTH_ACCESS_INVALID_NEW_BIO_ENROLL0100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_AUTH_ACCESS_INVALID_NEW_BIO_ENROLL_0100
     * @tc.desc   testing OH_HUKS_AUTH_ACCESS_INVALID_NEW_BIO_ENROLL interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_AUTH_ACCESS_INVALID_NEW_BIO_ENROLL0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_AUTH_ACCESS_INVALID_NEW_BIO_ENROLL0100 start====");
          let result: number = nativehuksndk.AuthAccessTypeTest_002();
          console.info(`====>testOH_HUKS_AUTH_ACCESS_INVALID_NEW_BIO_ENROLL0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_AUTH_ACCESS_INVALID_NEW_BIO_ENROLL0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_AUTH_ACCESS_ALWAYS_VALID0100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_AUTH_ACCESS_ALWAYS_VALID_0100
     * @tc.desc   testing OH_HUKS_AUTH_ACCESS_ALWAYS_VALID interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_AUTH_ACCESS_ALWAYS_VALID0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_AUTH_ACCESS_ALWAYS_VALID0100 start====");
          let result: number = nativehuksndk.AuthAccessTypeTest_003();
          console.info(`====>testOH_HUKS_AUTH_ACCESS_ALWAYS_VALID0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_AUTH_ACCESS_ALWAYS_VALID0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_USER_AUTH_MODE_LOCAL0100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_USER_AUTH_MODE_LOCAL_0100
     * @tc.desc   testing OH_HUKS_USER_AUTH_MODE_LOCAL interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_USER_AUTH_MODE_LOCAL0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_USER_AUTH_MODE_LOCAL0100 start====");
          let result: number = nativehuksndk.UserAuthModeTest_001();
          console.info(`====>testOH_HUKS_USER_AUTH_MODE_LOCAL0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_USER_AUTH_MODE_LOCAL0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_USER_AUTH_MODE_COAUTH0100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_USER_AUTH_MODE_COAUTH_0100
     * @tc.desc   testing OH_HUKS_USER_AUTH_MODE_COAUTH interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_USER_AUTH_MODE_COAUTH0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_USER_AUTH_MODE_COAUTH0100 start====");
          let result: number = nativehuksndk.UserAuthModeTest_002();
          console.info(`====>testOH_HUKS_USER_AUTH_MODE_COAUTH0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_USER_AUTH_MODE_COAUTH0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.name   testOH_HUKS_TAG_NO_AUTH_REQUIRED0100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_TAG_NO_AUTH_REQUIRED_0100
     * @tc.desc   testing OH_HUKS_TAG_NO_AUTH_REQUIRED interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_TAG_NO_AUTH_REQUIRED0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_TAG_NO_AUTH_REQUIRED0100 start====");
          let result: number = nativehuksndk.TagTest_012();
          console.info(`====>testOH_HUKS_TAG_NO_AUTH_REQUIRED0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_TAG_NO_AUTH_REQUIRED0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_TAG_USER_AUTH_TYPE0100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_TAG_USER_AUTH_TYPE_0100
     * @tc.desc   testing OH_HUKS_TAG_USER_AUTH_TYPE interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_TAG_USER_AUTH_TYPE0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_TAG_USER_AUTH_TYPE0100 start====");
          let result: number = nativehuksndk.TagTest_013();
          console.info(`====>testOH_HUKS_TAG_USER_AUTH_TYPE0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_TAG_USER_AUTH_TYPE0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_TAG_AUTH_TIMEOUT0100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_TAG_AUTH_TIMEOUT_0100
     * @tc.desc   testing OH_HUKS_TAG_AUTH_TIMEOUT interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_TAG_AUTH_TIMEOUT0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_TAG_AUTH_TIMEOUT0100 start====");
          let result: number = nativehuksndk.TagTest_014();
          console.info(`====>testOH_HUKS_TAG_AUTH_TIMEOUT0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_TAG_AUTH_TIMEOUT0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_TAG_AUTH_TOKEN0100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_TAG_AUTH_TOKEN_0100
     * @tc.desc   testing OH_HUKS_TAG_AUTH_TOKEN interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_TAG_AUTH_TOKEN0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_TAG_AUTH_TOKEN0100 start====");
          let result: number = nativehuksndk.TagTest_015();
          console.info(`====>testOH_HUKS_TAG_AUTH_TOKEN0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_TAG_AUTH_TOKEN0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_TAG_KEY_AUTH_ACCESS_TYPE0100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_TAG_KEY_AUTH_ACCESS_TYPE_0100
     * @tc.desc   testing OH_HUKS_TAG_KEY_AUTH_ACCESS_TYPE interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_TAG_KEY_AUTH_ACCESS_TYPE0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_TAG_KEY_AUTH_ACCESS_TYPE0100 start====");
          let result: number = nativehuksndk.TagTest_016();
          console.info(`====>testOH_HUKS_TAG_KEY_AUTH_ACCESS_TYPE0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_TAG_KEY_AUTH_ACCESS_TYPE0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_TAG_USER_AUTH_MODE0100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_TAG_USER_AUTH_MODE_0100
     * @tc.desc   testing OH_HUKS_TAG_USER_AUTH_MODE interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_TAG_USER_AUTH_MODE0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_TAG_USER_AUTH_MODE0100 start====");
          let result: number = nativehuksndk.TagTest_021();
          console.info(`====>testOH_HUKS_TAG_USER_AUTH_MODE0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_TAG_USER_AUTH_MODE0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_TAG_KEY_AUTH_ID0100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_TAG_KEY_AUTH_ID_0100
     * @tc.desc   testing OH_HUKS_TAG_KEY_AUTH_ID interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_TAG_KEY_AUTH_ID0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_TAG_KEY_AUTH_ID0100 start====");
          let result: number = nativehuksndk.TagTest_026();
          console.info(`====>testOH_HUKS_TAG_KEY_AUTH_ID0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_TAG_KEY_AUTH_ID0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_TAG_RSA_PSS_SALT_LEN_TYPE0100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_TAG_RSA_PSS_SALT_LEN_TYPE_0100
     * @tc.desc   testing OH_HUKS_TAG_RSA_PSS_SALT_LEN_TYPE interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_TAG_RSA_PSS_SALT_LEN_TYPE0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_TAG_RSA_PSS_SALT_LEN_TYPE0100 start====");
          let result: number = nativehuksndk.TagTest_009();
          console.info(`====>testOH_HUKS_TAG_RSA_PSS_SALT_LEN_TYPE0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_TAG_RSA_PSS_SALT_LEN_TYPE0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.name   testOH_HUKS_TAG_KEY_SECURE_SIGN_TYPE0100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_TAG_KEY_SECURE_SIGN_TYPE_0100
     * @tc.desc   testing OH_HUKS_TAG_KEY_SECURE_SIGN_TYPE interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_TAG_KEY_SECURE_SIGN_TYPE0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_TAG_KEY_SECURE_SIGN_TYPE0100 start====");
          let result: number = nativehuksndk.TagTest_017();
          console.info(`====>testOH_HUKS_TAG_KEY_SECURE_SIGN_TYPE0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_TAG_KEY_SECURE_SIGN_TYPE0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_SECURE_SIGN_WITH_AUTHINFO0100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_SECURE_SIGN_WITH_AUTHINFO_0100
     * @tc.desc   testing OH_HUKS_SECURE_SIGN_WITH_AUTHINFO interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_SECURE_SIGN_WITH_AUTHINFO0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_SECURE_SIGN_WITH_AUTHINFO0100 start====");
          let result: number = nativehuksndk.SecureSignTypeTest_001();
          console.info(`====>testOH_HUKS_SECURE_SIGN_WITH_AUTHINFO0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_SECURE_SIGN_WITH_AUTHINFO0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_USER_AUTH_TYPE_FINGERPRINT0100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_USER_AUTH_TYPE_FINGERPRINT_0100
     * @tc.desc   testing OH_HUKS_USER_AUTH_TYPE_FINGERPRINT interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_USER_AUTH_TYPE_FINGERPRINT0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_USER_AUTH_TYPE_FINGERPRINT0100 start====");
          let result: number = nativehuksndk.UserAuthTypeTest_001();
          console.info(`====>testOH_HUKS_USER_AUTH_TYPE_FINGERPRINT0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_USER_AUTH_TYPE_FINGERPRINT0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_USER_AUTH_TYPE_FACE0100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_USER_AUTH_TYPE_FACE_0100
     * @tc.desc   testing OH_HUKS_USER_AUTH_TYPE_FACE interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_USER_AUTH_TYPE_FACE0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_USER_AUTH_TYPE_FACE0100 start====");
          let result: number = nativehuksndk.UserAuthTypeTest_002();
          console.info(`====>testOH_HUKS_USER_AUTH_TYPE_FACE0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_USER_AUTH_TYPE_FACE0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_USER_AUTH_TYPE_PIN0100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_USER_AUTH_TYPE_PIN_0100
     * @tc.desc   testing OH_HUKS_USER_AUTH_TYPE_PIN interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_USER_AUTH_TYPE_PIN0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_USER_AUTH_TYPE_PIN0100 start====");
          let result: number = nativehuksndk.UserAuthTypeTest_003();
          console.info(`====>testOH_HUKS_USER_AUTH_TYPE_PIN0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_USER_AUTH_TYPE_PIN0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_HUKS_USER_AUTH_TYPE_TUI_PIN0100
     * @tc.number SUB_SECURITY_HUKS_OH_HUKS_USER_AUTH_TYPE_TUI_PIN_0100
     * @tc.desc   testing OH_HUKS_USER_AUTH_TYPE_TUI_PIN interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_HUKS_USER_AUTH_TYPE_TUI_PIN0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_USER_AUTH_TYPE_TUI_PIN0100 start====");
          let result: number = nativehuksndk.UserAuthTypeTest_004();
          console.info(`====>testOH_HUKS_USER_AUTH_TYPE_TUI_PIN0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_USER_AUTH_TYPE_TUI_PIN0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })
  })
}