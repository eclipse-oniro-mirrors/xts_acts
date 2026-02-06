/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { huks } from '@kit.UniversalKeystoreKit';

export default function SecurityHuksApiTest() {

  describe('SecurityHuksApiTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number : SUB_Security_HUKS_Api_API20_Interface_0100
     * @tc.name   : SUB_Security_HUKS_Api_API20_Interface_0100
     * @tc.desc   : test huks.HuksExceptionErrCode api
     * @tc.type   : Compatibility
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_Api_API20_Interface_0100', TestType.COMPATIBILITY | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(huks.HuksExceptionErrCode.HUKS_ERR_CODE_PERMISSION_FAIL).assertEqual(201);
      expect(huks.HuksExceptionErrCode.HUKS_ERR_CODE_NOT_SYSTEM_APP).assertEqual(202);
      expect(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT).assertEqual(401);
      expect(huks.HuksExceptionErrCode.HUKS_ERR_CODE_NOT_SUPPORTED_API).assertEqual(801);
      expect(huks.HuksExceptionErrCode.HUKS_ERR_CODE_FEATURE_NOT_SUPPORTED).assertEqual(12000001);
      expect(huks.HuksExceptionErrCode.HUKS_ERR_CODE_MISSING_CRYPTO_ALG_ARGUMENT).assertEqual(12000002);
      expect(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT).assertEqual(12000003);
      expect(huks.HuksExceptionErrCode.HUKS_ERR_CODE_FILE_OPERATION_FAIL).assertEqual(12000004);
      expect(huks.HuksExceptionErrCode.HUKS_ERR_CODE_COMMUNICATION_FAIL).assertEqual(12000005);
      expect(huks.HuksExceptionErrCode.HUKS_ERR_CODE_CRYPTO_FAIL).assertEqual(12000006);
      expect(huks.HuksExceptionErrCode.HUKS_ERR_CODE_KEY_AUTH_PERMANENTLY_INVALIDATED).assertEqual(12000007);
      expect(huks.HuksExceptionErrCode.HUKS_ERR_CODE_KEY_AUTH_VERIFY_FAILED).assertEqual(12000008);
      expect(huks.HuksExceptionErrCode.HUKS_ERR_CODE_KEY_AUTH_TIME_OUT).assertEqual(12000009);
      expect(huks.HuksExceptionErrCode.HUKS_ERR_CODE_SESSION_LIMIT).assertEqual(12000010);
      expect(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ITEM_NOT_EXIST).assertEqual(12000011);
      expect(huks.HuksExceptionErrCode.HUKS_ERR_CODE_EXTERNAL_ERROR).assertEqual(12000012);
      expect(huks.HuksExceptionErrCode.HUKS_ERR_CODE_CREDENTIAL_NOT_EXIST).assertEqual(12000013);
      expect(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INSUFFICIENT_MEMORY).assertEqual(12000014);
      expect(huks.HuksExceptionErrCode.HUKS_ERR_CODE_CALL_SERVICE_FAILED).assertEqual(12000015);
      expect(huks.HuksExceptionErrCode.HUKS_ERR_CODE_DEVICE_PASSWORD_UNSET).assertEqual(12000016);
      expect(huks.HuksExceptionErrCode.HUKS_ERR_CODE_KEY_ALREADY_EXIST).assertEqual(12000017);
      expect(huks.HuksExceptionErrCode.HUKS_ERR_CODE_INVALID_ARGUMENT).assertEqual(12000018);
    })

    /**
     * @tc.number : SUB_Security_HUKS_Api_API20_Interface_0200
     * @tc.name   : SUB_Security_HUKS_Api_API20_Interface_0200
     * @tc.desc   : test huks.HuksErrorCode api
     * @tc.type   : Compatibility
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_Api_API20_Interface_0200', TestType.COMPATIBILITY | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(huks.HuksErrorCode.HUKS_SUCCESS).assertEqual(0);
      expect(huks.HuksErrorCode.HUKS_FAILURE).assertEqual(-1);
      expect(huks.HuksErrorCode.HUKS_ERROR_BAD_STATE).assertEqual(-2);
      expect(huks.HuksErrorCode.HUKS_ERROR_INVALID_ARGUMENT).assertEqual(-3);
      expect(huks.HuksErrorCode.HUKS_ERROR_NOT_SUPPORTED).assertEqual(-4);
      expect(huks.HuksErrorCode.HUKS_ERROR_NO_PERMISSION).assertEqual(-5);
      expect(huks.HuksErrorCode.HUKS_ERROR_INSUFFICIENT_DATA).assertEqual(-6);
      expect(huks.HuksErrorCode.HUKS_ERROR_BUFFER_TOO_SMALL).assertEqual(-7);
      expect(huks.HuksErrorCode.HUKS_ERROR_INSUFFICIENT_MEMORY).assertEqual(-8);
      expect(huks.HuksErrorCode.HUKS_ERROR_COMMUNICATION_FAILURE).assertEqual(-9);
      expect(huks.HuksErrorCode.HUKS_ERROR_STORAGE_FAILURE).assertEqual(-10);
      expect(huks.HuksErrorCode.HUKS_ERROR_HARDWARE_FAILURE).assertEqual(-11);
      expect(huks.HuksErrorCode.HUKS_ERROR_ALREADY_EXISTS).assertEqual(-12);
      expect(huks.HuksErrorCode.HUKS_ERROR_NOT_EXIST).assertEqual(-13);
      expect(huks.HuksErrorCode.HUKS_ERROR_NULL_POINTER).assertEqual(-14);
      expect(huks.HuksErrorCode.HUKS_ERROR_FILE_SIZE_FAIL).assertEqual(-15);
      expect(huks.HuksErrorCode.HUKS_ERROR_READ_FILE_FAIL).assertEqual(-16);
      expect(huks.HuksErrorCode.HUKS_ERROR_INVALID_PUBLIC_KEY).assertEqual(-17);
      expect(huks.HuksErrorCode.HUKS_ERROR_INVALID_PRIVATE_KEY).assertEqual(-18);
      expect(huks.HuksErrorCode.HUKS_ERROR_INVALID_KEY_INFO).assertEqual(-19);
      expect(huks.HuksErrorCode.HUKS_ERROR_HASH_NOT_EQUAL).assertEqual(-20);
      expect(huks.HuksErrorCode.HUKS_ERROR_MALLOC_FAIL).assertEqual(-21);
      expect(huks.HuksErrorCode.HUKS_ERROR_WRITE_FILE_FAIL).assertEqual(-22);
      expect(huks.HuksErrorCode.HUKS_ERROR_REMOVE_FILE_FAIL).assertEqual(-23);
      expect(huks.HuksErrorCode.HUKS_ERROR_OPEN_FILE_FAIL).assertEqual(-24);
      expect(huks.HuksErrorCode.HUKS_ERROR_CLOSE_FILE_FAIL).assertEqual(-25);
      expect(huks.HuksErrorCode.HUKS_ERROR_MAKE_DIR_FAIL).assertEqual(-26);
      expect(huks.HuksErrorCode.HUKS_ERROR_INVALID_KEY_FILE).assertEqual(-27);
      expect(huks.HuksErrorCode.HUKS_ERROR_IPC_MSG_FAIL).assertEqual(-28);
      expect(huks.HuksErrorCode.HUKS_ERROR_REQUEST_OVERFLOWS).assertEqual(-29);
      expect(huks.HuksErrorCode.HUKS_ERROR_PARAM_NOT_EXIST).assertEqual(-30);
      expect(huks.HuksErrorCode.HUKS_ERROR_CRYPTO_ENGINE_ERROR).assertEqual(-31);
      expect(huks.HuksErrorCode.HUKS_ERROR_COMMUNICATION_TIMEOUT).assertEqual(-32);
      expect(huks.HuksErrorCode.HUKS_ERROR_IPC_INIT_FAIL).assertEqual(-33);
      expect(huks.HuksErrorCode.HUKS_ERROR_IPC_DLOPEN_FAIL).assertEqual(-34);
      expect(huks.HuksErrorCode.HUKS_ERROR_EFUSE_READ_FAIL).assertEqual(-35);
      expect(huks.HuksErrorCode.HUKS_ERROR_NEW_ROOT_KEY_MATERIAL_EXIST).assertEqual(-36);
      expect(huks.HuksErrorCode.HUKS_ERROR_UPDATE_ROOT_KEY_MATERIAL_FAIL).assertEqual(-37);
      expect(huks.HuksErrorCode.HUKS_ERROR_VERIFICATION_FAILED).assertEqual(-38);
      expect(huks.HuksErrorCode.HUKS_ERROR_CHECK_GET_ALG_FAIL).assertEqual(-100);
      expect(huks.HuksErrorCode.HUKS_ERROR_CHECK_GET_KEY_SIZE_FAIL).assertEqual(-101);
      expect(huks.HuksErrorCode.HUKS_ERROR_CHECK_GET_PADDING_FAIL).assertEqual(-102);
      expect(huks.HuksErrorCode.HUKS_ERROR_CHECK_GET_PURPOSE_FAIL).assertEqual(-103);
      expect(huks.HuksErrorCode.HUKS_ERROR_CHECK_GET_DIGEST_FAIL).assertEqual(-104);
      expect(huks.HuksErrorCode.HUKS_ERROR_CHECK_GET_MODE_FAIL).assertEqual(-105);
      expect(huks.HuksErrorCode.HUKS_ERROR_CHECK_GET_NONCE_FAIL).assertEqual(-106);
      expect(huks.HuksErrorCode.HUKS_ERROR_CHECK_GET_AAD_FAIL).assertEqual(-107);
      expect(huks.HuksErrorCode.HUKS_ERROR_CHECK_GET_IV_FAIL).assertEqual(-108);
      expect(huks.HuksErrorCode.HUKS_ERROR_CHECK_GET_AE_TAG_FAIL).assertEqual(-109);
      expect(huks.HuksErrorCode.HUKS_ERROR_CHECK_GET_SALT_FAIL).assertEqual(-110);
      expect(huks.HuksErrorCode.HUKS_ERROR_CHECK_GET_ITERATION_FAIL).assertEqual(-111);
      expect(huks.HuksErrorCode.HUKS_ERROR_INVALID_ALGORITHM).assertEqual(-112);
      expect(huks.HuksErrorCode.HUKS_ERROR_INVALID_KEY_SIZE).assertEqual(-113);
      expect(huks.HuksErrorCode.HUKS_ERROR_INVALID_PADDING).assertEqual(-114);
      expect(huks.HuksErrorCode.HUKS_ERROR_INVALID_PURPOSE).assertEqual(-115);
      expect(huks.HuksErrorCode.HUKS_ERROR_INVALID_MODE).assertEqual(-116);
      expect(huks.HuksErrorCode.HUKS_ERROR_INVALID_DIGEST).assertEqual(-117);
      expect(huks.HuksErrorCode.HUKS_ERROR_INVALID_SIGNATURE_SIZE).assertEqual(-118);
      expect(huks.HuksErrorCode.HUKS_ERROR_INVALID_IV).assertEqual(-119);
      expect(huks.HuksErrorCode.HUKS_ERROR_INVALID_AAD).assertEqual(-120);
      expect(huks.HuksErrorCode.HUKS_ERROR_INVALID_NONCE).assertEqual(-121);
      expect(huks.HuksErrorCode.HUKS_ERROR_INVALID_AE_TAG).assertEqual(-122);
      expect(huks.HuksErrorCode.HUKS_ERROR_INVALID_SALT).assertEqual(-123);
      expect(huks.HuksErrorCode.HUKS_ERROR_INVALID_ITERATION).assertEqual(-124);
      expect(huks.HuksErrorCode.HUKS_ERROR_INVALID_OPERATION).assertEqual(-125);
      expect(huks.HuksErrorCode.HUKS_ERROR_INTERNAL_ERROR).assertEqual(-999);
      expect(huks.HuksErrorCode.HUKS_ERROR_UNKNOWN_ERROR).assertEqual(-1000);
    })

    /**
     * @tc.number : SUB_Security_HUKS_Api_API20_Interface_0300
     * @tc.name   : SUB_Security_HUKS_Api_API20_Interface_0300
     * @tc.desc   : test huks.HuksKeyPurpose api
     * @tc.type   : Compatibility
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_Api_API20_Interface_0300', TestType.COMPATIBILITY | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT).assertEqual(1);
      expect(huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT).assertEqual(2);
      expect(huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN).assertEqual(4);
      expect(huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY).assertEqual(8);
      expect(huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE).assertEqual(16);
      expect(huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_WRAP).assertEqual(32);
      expect(huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_UNWRAP).assertEqual(64);
      expect(huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_MAC).assertEqual(128);
      expect(huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_AGREE).assertEqual(256);
    })

    /**
     * @tc.number : SUB_Security_HUKS_Api_API20_Interface_0400
     * @tc.name   : SUB_Security_HUKS_Api_API20_Interface_0400
     * @tc.desc   : test huks.HuksKeyDigest api
     * @tc.type   : Compatibility
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_Api_API20_Interface_0400', TestType.COMPATIBILITY | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(huks.HuksKeyDigest.HUKS_DIGEST_NONE).assertEqual(0);
      expect(huks.HuksKeyDigest.HUKS_DIGEST_MD5).assertEqual(1);
      expect(huks.HuksKeyDigest.HUKS_DIGEST_SM3).assertEqual(2);
      expect(huks.HuksKeyDigest.HUKS_DIGEST_SHA1).assertEqual(10);
      expect(huks.HuksKeyDigest.HUKS_DIGEST_SHA224).assertEqual(11);
      expect(huks.HuksKeyDigest.HUKS_DIGEST_SHA256).assertEqual(12);
      expect(huks.HuksKeyDigest.HUKS_DIGEST_SHA384).assertEqual(13);
      expect(huks.HuksKeyDigest.HUKS_DIGEST_SHA512).assertEqual(14);
    })

    /**
     * @tc.number : SUB_Security_HUKS_Api_API20_Interface_0500
     * @tc.name   : SUB_Security_HUKS_Api_API20_Interface_0500
     * @tc.desc   : test huks.HuksKeyPadding api
     * @tc.type   : Compatibility
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_Api_API20_Interface_0500', TestType.COMPATIBILITY | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(huks.HuksKeyPadding.HUKS_PADDING_NONE).assertEqual(0);
      expect(huks.HuksKeyPadding.HUKS_PADDING_OAEP).assertEqual(1);
      expect(huks.HuksKeyPadding.HUKS_PADDING_PSS).assertEqual(2);
      expect(huks.HuksKeyPadding.HUKS_PADDING_PKCS1_V1_5).assertEqual(3);
      expect(huks.HuksKeyPadding.HUKS_PADDING_PKCS5).assertEqual(4);
      expect(huks.HuksKeyPadding.HUKS_PADDING_PKCS7).assertEqual(5);
      expect(huks.HuksKeyPadding.HUKS_PADDING_ISO_IEC_9796_2).assertEqual(6);
      expect(huks.HuksKeyPadding.HUKS_PADDING_ISO_IEC_9797_1).assertEqual(7);
    })

    /**
     * @tc.number : SUB_Security_HUKS_Api_API20_Interface_0600
     * @tc.name   : SUB_Security_HUKS_Api_API20_Interface_0600
     * @tc.desc   : test huks.HuksCipherMode api
     * @tc.type   : Compatibility
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_Api_API20_Interface_0600', TestType.COMPATIBILITY | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(huks.HuksCipherMode.HUKS_MODE_ECB).assertEqual(1);
      expect(huks.HuksCipherMode.HUKS_MODE_CBC).assertEqual(2);
      expect(huks.HuksCipherMode.HUKS_MODE_CTR).assertEqual(3);
      expect(huks.HuksCipherMode.HUKS_MODE_OFB).assertEqual(4);
      expect(huks.HuksCipherMode.HUKS_MODE_CFB).assertEqual(5);
      expect(huks.HuksCipherMode.HUKS_MODE_CCM).assertEqual(31);
      expect(huks.HuksCipherMode.HUKS_MODE_GCM).assertEqual(32);
    })

    /**
     * @tc.number : SUB_Security_HUKS_Api_API20_Interface_0700
     * @tc.name   : SUB_Security_HUKS_Api_API20_Interface_0700
     * @tc.desc   : test huks.HuksKeySize api
     * @tc.type   : Compatibility
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_Api_API20_Interface_0700', TestType.COMPATIBILITY | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(huks.HuksKeySize.HUKS_RSA_KEY_SIZE_512).assertEqual(512);
      expect(huks.HuksKeySize.HUKS_RSA_KEY_SIZE_768).assertEqual(768);
      expect(huks.HuksKeySize.HUKS_RSA_KEY_SIZE_1024).assertEqual(1024);
      expect(huks.HuksKeySize.HUKS_RSA_KEY_SIZE_2048).assertEqual(2048);
      expect(huks.HuksKeySize.HUKS_RSA_KEY_SIZE_3072).assertEqual(3072);
      expect(huks.HuksKeySize.HUKS_RSA_KEY_SIZE_4096).assertEqual(4096);
      expect(huks.HuksKeySize.HUKS_ECC_KEY_SIZE_224).assertEqual(224);
      expect(huks.HuksKeySize.HUKS_ECC_KEY_SIZE_256).assertEqual(256);
      expect(huks.HuksKeySize.HUKS_ECC_KEY_SIZE_384).assertEqual(384);
      expect(huks.HuksKeySize.HUKS_ECC_KEY_SIZE_521).assertEqual(521);
      expect(huks.HuksKeySize.HUKS_AES_KEY_SIZE_128).assertEqual(128);
      expect(huks.HuksKeySize.HUKS_AES_KEY_SIZE_192).assertEqual(192);
      expect(huks.HuksKeySize.HUKS_AES_KEY_SIZE_256).assertEqual(256);
      expect(huks.HuksKeySize.HUKS_AES_KEY_SIZE_512).assertEqual(512);
      expect(huks.HuksKeySize.HUKS_CURVE25519_KEY_SIZE_256).assertEqual(256);
      expect(huks.HuksKeySize.HUKS_DH_KEY_SIZE_2048).assertEqual(2048);
      expect(huks.HuksKeySize.HUKS_DH_KEY_SIZE_3072).assertEqual(3072);
      expect(huks.HuksKeySize.HUKS_DH_KEY_SIZE_4096).assertEqual(4096);
      expect(huks.HuksKeySize.HUKS_SM2_KEY_SIZE_256).assertEqual(256);
      expect(huks.HuksKeySize.HUKS_SM4_KEY_SIZE_128).assertEqual(128);
      expect(huks.HuksKeySize.HUKS_DES_KEY_SIZE_64).assertEqual(64);
      expect(huks.HuksKeySize.HUKS_3DES_KEY_SIZE_128).assertEqual(128);
      expect(huks.HuksKeySize.HUKS_3DES_KEY_SIZE_192).assertEqual(192);
    })

    /**
     * @tc.number : SUB_Security_HUKS_Api_API20_Interface_0800
     * @tc.name   : SUB_Security_HUKS_Api_API20_Interface_0800
     * @tc.desc   : test huks.HuksKeyAlg api
     * @tc.type   : Compatibility
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_Api_API20_Interface_0800', TestType.COMPATIBILITY | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(huks.HuksKeyAlg.HUKS_ALG_RSA).assertEqual(1);
      expect(huks.HuksKeyAlg.HUKS_ALG_ECC).assertEqual(2);
      expect(huks.HuksKeyAlg.HUKS_ALG_DSA).assertEqual(3);
      expect(huks.HuksKeyAlg.HUKS_ALG_AES).assertEqual(20);
      expect(huks.HuksKeyAlg.HUKS_ALG_HMAC).assertEqual(50);
      expect(huks.HuksKeyAlg.HUKS_ALG_HKDF).assertEqual(51);
      expect(huks.HuksKeyAlg.HUKS_ALG_PBKDF2).assertEqual(52);
      expect(huks.HuksKeyAlg.HUKS_ALG_ECDH).assertEqual(100);
      expect(huks.HuksKeyAlg.HUKS_ALG_X25519).assertEqual(101);
      expect(huks.HuksKeyAlg.HUKS_ALG_ED25519).assertEqual(102);
      expect(huks.HuksKeyAlg.HUKS_ALG_DH).assertEqual(103);
      expect(huks.HuksKeyAlg.HUKS_ALG_SM2).assertEqual(150);
      expect(huks.HuksKeyAlg.HUKS_ALG_SM3).assertEqual(151);
      expect(huks.HuksKeyAlg.HUKS_ALG_SM4).assertEqual(152);
      expect(huks.HuksKeyAlg.HUKS_ALG_DES).assertEqual(160);
      expect(huks.HuksKeyAlg.HUKS_ALG_3DES).assertEqual(161);
      expect(huks.HuksKeyAlg.HUKS_ALG_CMAC).assertEqual(162);
    })

    /**
     * @tc.number : SUB_Security_HUKS_Api_API20_Interface_0900
     * @tc.name   : SUB_Security_HUKS_Api_API20_Interface_0900
     * @tc.desc   : test huks.HuksUnwrapSuite api
     * @tc.type   : Compatibility
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_Api_API20_Interface_0900', TestType.COMPATIBILITY | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_X25519_AES_256_GCM_NOPADDING).assertEqual(1);
      expect(huks.HuksUnwrapSuite.HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING).assertEqual(2);
    })

    /**
     * @tc.number : SUB_Security_HUKS_Api_API20_Interface_1000
     * @tc.name   : SUB_Security_HUKS_Api_API20_Interface_1000
     * @tc.desc   : test huks.HuksKeyGenerateType api
     * @tc.type   : Compatibility
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_Api_API20_Interface_1000', TestType.COMPATIBILITY | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(huks.HuksKeyGenerateType.HUKS_KEY_GENERATE_TYPE_DEFAULT).assertEqual(0);
      expect(huks.HuksKeyGenerateType.HUKS_KEY_GENERATE_TYPE_DERIVE).assertEqual(1);
      expect(huks.HuksKeyGenerateType.HUKS_KEY_GENERATE_TYPE_AGREE).assertEqual(2);
    })

    /**
     * @tc.number : SUB_Security_HUKS_Api_API20_Interface_1100
     * @tc.name   : SUB_Security_HUKS_Api_API20_Interface_1100
     * @tc.desc   : test huks.HuksKeyFlag api
     * @tc.type   : Compatibility
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_Api_API20_Interface_1100', TestType.COMPATIBILITY | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(huks.HuksKeyFlag.HUKS_KEY_FLAG_IMPORT_KEY).assertEqual(1);
      expect(huks.HuksKeyFlag.HUKS_KEY_FLAG_GENERATE_KEY).assertEqual(2);
      expect(huks.HuksKeyFlag.HUKS_KEY_FLAG_AGREE_KEY).assertEqual(3);
      expect(huks.HuksKeyFlag.HUKS_KEY_FLAG_DERIVE_KEY).assertEqual(4);
    })

    /**
     * @tc.number : SUB_Security_HUKS_Api_API20_Interface_1200
     * @tc.name   : SUB_Security_HUKS_Api_API20_Interface_1200
     * @tc.desc   : test huks.HuksKeyStorageType api
     * @tc.type   : Compatibility
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_Api_API20_Interface_1200', TestType.COMPATIBILITY | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(huks.HuksKeyStorageType.HUKS_STORAGE_TEMP).assertEqual(0);
      expect(huks.HuksKeyStorageType.HUKS_STORAGE_PERSISTENT).assertEqual(1);
      expect(huks.HuksKeyStorageType.HUKS_STORAGE_ONLY_USED_IN_HUKS).assertEqual(2);
      expect(huks.HuksKeyStorageType.HUKS_STORAGE_KEY_EXPORT_ALLOWED).assertEqual(3);
    })

    /**
     * @tc.number : SUB_Security_HUKS_Api_API20_Interface_1300
     * @tc.name   : SUB_Security_HUKS_Api_API20_Interface_1300
     * @tc.desc   : test huks.HuksImportKeyType api
     * @tc.type   : Compatibility
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_Api_API20_Interface_1300', TestType.COMPATIBILITY | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(huks.HuksImportKeyType.HUKS_KEY_TYPE_PUBLIC_KEY).assertEqual(0);
      expect(huks.HuksImportKeyType.HUKS_KEY_TYPE_PRIVATE_KEY).assertEqual(1);
      expect(huks.HuksImportKeyType.HUKS_KEY_TYPE_KEY_PAIR).assertEqual(2);
    })

    /**
     * @tc.number : SUB_Security_HUKS_Api_API20_Interface_1400
     * @tc.name   : SUB_Security_HUKS_Api_API20_Interface_1400
     * @tc.desc   : test huks.HuksRsaPssSaltLenType api
     * @tc.type   : Compatibility
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_Api_API20_Interface_1400', TestType.COMPATIBILITY | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(huks.HuksRsaPssSaltLenType.HUKS_RSA_PSS_SALT_LEN_DIGEST).assertEqual(0);
      expect(huks.HuksRsaPssSaltLenType.HUKS_RSA_PSS_SALT_LEN_MAX).assertEqual(1);
    })

    /**
     * @tc.number : SUB_Security_HUKS_Api_API20_Interface_1500
     * @tc.name   : SUB_Security_HUKS_Api_API20_Interface_1500
     * @tc.desc   : test huks.HuksUserAuthType api
     * @tc.type   : Compatibility
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_Api_API20_Interface_1500', TestType.COMPATIBILITY | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(huks.HuksUserAuthType.HUKS_USER_AUTH_TYPE_FINGERPRINT).assertEqual(1 << 0);
      expect(huks.HuksUserAuthType.HUKS_USER_AUTH_TYPE_FACE).assertEqual(1 << 1);
      expect(huks.HuksUserAuthType.HUKS_USER_AUTH_TYPE_PIN).assertEqual(1 << 2);
      expect(huks.HuksUserAuthType.HUKS_USER_AUTH_TYPE_TUI_PIN).assertEqual(1 << 5);
    })

    /**
     * @tc.number : SUB_Security_HUKS_Api_API20_Interface_1600
     * @tc.name   : SUB_Security_HUKS_Api_API20_Interface_1600
     * @tc.desc   : test huks.HuksAuthAccessType api
     * @tc.type   : Compatibility
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_Api_API20_Interface_1600', TestType.COMPATIBILITY | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(huks.HuksAuthAccessType.HUKS_AUTH_ACCESS_INVALID_CLEAR_PASSWORD).assertEqual(1 << 0);
      expect(huks.HuksAuthAccessType.HUKS_AUTH_ACCESS_INVALID_NEW_BIO_ENROLL).assertEqual(1 << 1);
      expect(huks.HuksAuthAccessType.HUKS_AUTH_ACCESS_ALWAYS_VALID).assertEqual(1 << 2);
    })

    /**
     * @tc.number : SUB_Security_HUKS_Api_API20_Interface_1700
     * @tc.name   : SUB_Security_HUKS_Api_API20_Interface_1700
     * @tc.desc   : test huks.HuksUserAuthMode api
     * @tc.type   : Compatibility
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_Api_API20_Interface_1700', TestType.COMPATIBILITY | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(huks.HuksUserAuthMode.HUKS_USER_AUTH_MODE_LOCAL).assertEqual(0);
      expect(huks.HuksUserAuthMode.HUKS_USER_AUTH_MODE_COAUTH).assertEqual(1);
    })

    /**
     * @tc.number : SUB_Security_HUKS_Api_API20_Interface_1800
     * @tc.name   : SUB_Security_HUKS_Api_API20_Interface_1800
     * @tc.desc   : test huks.HuksAuthStorageLevel api
     * @tc.type   : Compatibility
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_Api_API20_Interface_1800', TestType.COMPATIBILITY | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_DE).assertEqual(0);
      expect(huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_CE).assertEqual(1);
      expect(huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_ECE).assertEqual(2);
    })

    /**
     * @tc.number : SUB_Security_HUKS_Api_API20_Interface_1900
     * @tc.name   : SUB_Security_HUKS_Api_API20_Interface_1900
     * @tc.desc   : test huks.HuksChallengeType api
     * @tc.type   : Compatibility
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_Api_API20_Interface_1900', TestType.COMPATIBILITY | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(huks.HuksChallengeType.HUKS_CHALLENGE_TYPE_NORMAL).assertEqual(0);
      expect(huks.HuksChallengeType.HUKS_CHALLENGE_TYPE_CUSTOM).assertEqual(1);
      expect(huks.HuksChallengeType.HUKS_CHALLENGE_TYPE_NONE).assertEqual(2);
    })


    /**
     * @tc.number : SUB_Security_HUKS_Api_API20_Interface_2000
     * @tc.name   : SUB_Security_HUKS_Api_API20_Interface_2000
     * @tc.desc   : test huks.HuksChallengePosition api
     * @tc.type   : Compatibility
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_Api_API20_Interface_2000', TestType.COMPATIBILITY | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(huks.HuksChallengePosition.HUKS_CHALLENGE_POS_0).assertEqual(0);
      expect(huks.HuksChallengePosition.HUKS_CHALLENGE_POS_1).assertEqual(1);
      expect(huks.HuksChallengePosition.HUKS_CHALLENGE_POS_2).assertEqual(2);
      expect(huks.HuksChallengePosition.HUKS_CHALLENGE_POS_3).assertEqual(3);
    })

    /**
     * @tc.number : SUB_Security_HUKS_Api_API20_Interface_2100
     * @tc.name   : SUB_Security_HUKS_Api_API20_Interface_2100
     * @tc.desc   : test huks.HuksSecureSignType api
     * @tc.type   : Compatibility
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_Api_API20_Interface_2100', TestType.COMPATIBILITY | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(huks.HuksSecureSignType.HUKS_SECURE_SIGN_WITH_AUTHINFO).assertEqual(1);
    })

    /**
     * @tc.number : SUB_Security_HUKS_Api_API20_Interface_2200
     * @tc.name   : SUB_Security_HUKS_Api_API20_Interface_2200
     * @tc.desc   : test huks.HuksSendType api
     * @tc.type   : Compatibility
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_Api_API20_Interface_2200', TestType.COMPATIBILITY | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(huks.HuksSendType.HUKS_SEND_TYPE_ASYNC).assertEqual(0);
      expect(huks.HuksSendType.HUKS_SEND_TYPE_SYNC).assertEqual(1);
    })

    /**
     * @tc.number : SUB_Security_HUKS_Api_API20_Interface_2300
     * @tc.name   : SUB_Security_HUKS_Api_API20_Interface_2300
     * @tc.desc   : test huks.HuksKeyWrapType api
     * @tc.type   : Compatibility
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_Api_API20_Interface_2300', TestType.COMPATIBILITY | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(huks.HuksKeyWrapType.HUKS_KEY_WRAP_TYPE_HUK_BASED).assertEqual(2);
    })

    /**
     * @tc.number : SUB_Security_HUKS_Api_API20_Interface_2400
     * @tc.name   : SUB_Security_HUKS_Api_API20_Interface_2400
     * @tc.desc   : test huks.HuksTagType api
     * @tc.type   : Compatibility
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_Api_API20_Interface_2400', TestType.COMPATIBILITY | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(huks.HuksTagType.HUKS_TAG_TYPE_INVALID).assertEqual(0 << 28);
      expect(huks.HuksTagType.HUKS_TAG_TYPE_INT).assertEqual(1 << 28);
      expect(huks.HuksTagType.HUKS_TAG_TYPE_UINT).assertEqual(2 << 28);
      expect(huks.HuksTagType.HUKS_TAG_TYPE_ULONG).assertEqual(3 << 28);
      expect(huks.HuksTagType.HUKS_TAG_TYPE_BOOL).assertEqual(4 << 28);
      expect(huks.HuksTagType.HUKS_TAG_TYPE_BYTES).assertEqual(5 << 28);
    })

    /**
     * @tc.number : SUB_Security_HUKS_Api_API20_Interface_2500
     * @tc.name   : SUB_Security_HUKS_Api_API20_Interface_2500
     * @tc.desc   : test huks.HuksTag api
     * @tc.type   : Compatibility
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_HUKS_Api_API20_Interface_2500', TestType.COMPATIBILITY | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(huks.HuksTag.HUKS_TAG_INVALID).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_INVALID | 0);
      expect(huks.HuksTag.HUKS_TAG_ALGORITHM).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_UINT | 1);
      expect(huks.HuksTag.HUKS_TAG_PURPOSE).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_UINT | 2);
      expect(huks.HuksTag.HUKS_TAG_KEY_SIZE).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_UINT | 3);
      expect(huks.HuksTag.HUKS_TAG_DIGEST).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_UINT | 4);
      expect(huks.HuksTag.HUKS_TAG_PADDING).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_UINT | 5);
      expect(huks.HuksTag.HUKS_TAG_BLOCK_MODE).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_UINT | 6);
      expect(huks.HuksTag.HUKS_TAG_KEY_TYPE).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_UINT | 7);
      expect(huks.HuksTag.HUKS_TAG_ASSOCIATED_DATA).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_BYTES | 8);
      expect(huks.HuksTag.HUKS_TAG_NONCE).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_BYTES | 9);
      expect(huks.HuksTag.HUKS_TAG_IV).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_BYTES | 10);
      expect(huks.HuksTag.HUKS_TAG_INFO).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_BYTES | 11);
      expect(huks.HuksTag.HUKS_TAG_SALT).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_BYTES | 12);
      expect(huks.HuksTag.HUKS_TAG_PWD).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_BYTES | 13);
      expect(huks.HuksTag.HUKS_TAG_ITERATION).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_UINT | 14);
      expect(huks.HuksTag.HUKS_TAG_KEY_GENERATE_TYPE).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_UINT | 15);
      expect(huks.HuksTag.HUKS_TAG_DERIVE_MAIN_KEY).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_BYTES | 16);
      expect(huks.HuksTag.HUKS_TAG_DERIVE_FACTOR).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_BYTES | 17);
      expect(huks.HuksTag.HUKS_TAG_DERIVE_ALG).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_UINT | 18);
      expect(huks.HuksTag.HUKS_TAG_AGREE_ALG).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_UINT | 19);
      expect(huks.HuksTag.HUKS_TAG_AGREE_PUBLIC_KEY_IS_KEY_ALIAS).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_BOOL | 20);
      expect(huks.HuksTag.HUKS_TAG_AGREE_PRIVATE_KEY_ALIAS).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_BYTES | 21);
      expect(huks.HuksTag.HUKS_TAG_AGREE_PUBLIC_KEY).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_BYTES | 22);
      expect(huks.HuksTag.HUKS_TAG_KEY_ALIAS).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_BYTES | 23);
      expect(huks.HuksTag.HUKS_TAG_DERIVE_KEY_SIZE).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_UINT | 24);
      expect(huks.HuksTag.HUKS_TAG_IMPORT_KEY_TYPE).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_UINT | 25);
      expect(huks.HuksTag.HUKS_TAG_UNWRAP_ALGORITHM_SUITE).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_UINT | 26);
      expect(huks.HuksTag.HUKS_TAG_DERIVED_AGREED_KEY_STORAGE_FLAG).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_UINT | 29);
      expect(huks.HuksTag.HUKS_TAG_RSA_PSS_SALT_LEN_TYPE).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_UINT | 30);
      expect(huks.HuksTag.HUKS_TAG_ACTIVE_DATETIME).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_ULONG | 201);
      expect(huks.HuksTag.HUKS_TAG_ORIGINATION_EXPIRE_DATETIME).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_ULONG | 202);
      expect(huks.HuksTag.HUKS_TAG_USAGE_EXPIRE_DATETIME).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_ULONG | 203);
      expect(huks.HuksTag.HUKS_TAG_CREATION_DATETIME).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_ULONG | 204);
      expect(huks.HuksTag.HUKS_TAG_ALL_USERS).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_BOOL | 301);
      expect(huks.HuksTag.HUKS_TAG_USER_ID).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_UINT | 302);
      expect(huks.HuksTag.HUKS_TAG_NO_AUTH_REQUIRED).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_BOOL | 303);
      expect(huks.HuksTag.HUKS_TAG_USER_AUTH_TYPE).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_UINT | 304);
      expect(huks.HuksTag.HUKS_TAG_AUTH_TIMEOUT).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_UINT | 305);
      expect(huks.HuksTag.HUKS_TAG_AUTH_TOKEN).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_BYTES | 306);
      expect(huks.HuksTag.HUKS_TAG_KEY_AUTH_ACCESS_TYPE).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_UINT | 307);
      expect(huks.HuksTag.HUKS_TAG_KEY_SECURE_SIGN_TYPE).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_UINT | 308);
      expect(huks.HuksTag.HUKS_TAG_CHALLENGE_TYPE).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_UINT | 309);
      expect(huks.HuksTag.HUKS_TAG_CHALLENGE_POS).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_UINT | 310);
      expect(huks.HuksTag.HUKS_TAG_KEY_AUTH_PURPOSE).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_UINT | 311);
      expect(huks.HuksTag.HUKS_TAG_AUTH_STORAGE_LEVEL).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_UINT | 316);
      expect(huks.HuksTag.HUKS_TAG_USER_AUTH_MODE).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_UINT | 319);
      expect(huks.HuksTag.HUKS_TAG_ATTESTATION_CHALLENGE).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_BYTES | 501);
      expect(huks.HuksTag.HUKS_TAG_ATTESTATION_APPLICATION_ID).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_BYTES | 502);
      expect(huks.HuksTag.HUKS_TAG_ATTESTATION_ID_BRAND).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_BYTES | 503);
      expect(huks.HuksTag.HUKS_TAG_ATTESTATION_ID_DEVICE).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_BYTES | 504);
      expect(huks.HuksTag.HUKS_TAG_ATTESTATION_ID_PRODUCT).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_BYTES | 505);
      expect(huks.HuksTag.HUKS_TAG_ATTESTATION_ID_SERIAL).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_BYTES | 506);
      expect(huks.HuksTag.HUKS_TAG_ATTESTATION_ID_IMEI).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_BYTES | 507);
      expect(huks.HuksTag.HUKS_TAG_ATTESTATION_ID_MEID).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_BYTES | 508);
      expect(huks.HuksTag.HUKS_TAG_ATTESTATION_ID_MANUFACTURER).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_BYTES | 509);
      expect(huks.HuksTag.HUKS_TAG_ATTESTATION_ID_MODEL).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_BYTES | 510);
      expect(huks.HuksTag.HUKS_TAG_ATTESTATION_ID_ALIAS).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_BYTES | 511);
      expect(huks.HuksTag.HUKS_TAG_ATTESTATION_ID_SOCID).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_BYTES | 512);
      expect(huks.HuksTag.HUKS_TAG_ATTESTATION_ID_UDID).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_BYTES | 513);
      expect(huks.HuksTag.HUKS_TAG_ATTESTATION_ID_SEC_LEVEL_INFO).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_BYTES | 514);
      expect(huks.HuksTag.HUKS_TAG_ATTESTATION_ID_VERSION_INFO).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_BYTES | 515);
      expect(huks.HuksTag.HUKS_TAG_KEY_OVERRIDE).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_BOOL | 520);
      expect(huks.HuksTag.HUKS_TAG_IS_KEY_ALIAS).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_BOOL | 1001);
      expect(huks.HuksTag.HUKS_TAG_KEY_STORAGE_FLAG).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_UINT | 1002);
      expect(huks.HuksTag.HUKS_TAG_IS_ALLOWED_WRAP).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_BOOL | 1003);
      expect(huks.HuksTag.HUKS_TAG_KEY_WRAP_TYPE).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_UINT | 1004);
      expect(huks.HuksTag.HUKS_TAG_KEY_AUTH_ID).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_BYTES | 1005);
      expect(huks.HuksTag.HUKS_TAG_KEY_ROLE).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_UINT | 1006);
      expect(huks.HuksTag.HUKS_TAG_KEY_FLAG).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_UINT | 1007);
      expect(huks.HuksTag.HUKS_TAG_IS_ASYNCHRONIZED).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_UINT | 1008);
      expect(huks.HuksTag.HUKS_TAG_SECURE_KEY_ALIAS).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_BOOL | 1009);
      expect(huks.HuksTag.HUKS_TAG_SECURE_KEY_UUID).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_BYTES | 1010);
      expect(huks.HuksTag.HUKS_TAG_KEY_DOMAIN).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_UINT | 1011);
      expect(huks.HuksTag.HUKS_TAG_IS_DEVICE_PASSWORD_SET).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_BOOL | 1012);
      expect(huks.HuksTag.HUKS_TAG_PROCESS_NAME).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_BYTES | 10001);
      expect(huks.HuksTag.HUKS_TAG_PACKAGE_NAME).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_BYTES | 10002);
      expect(huks.HuksTag.HUKS_TAG_ACCESS_TIME).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_UINT | 10003);
      expect(huks.HuksTag.HUKS_TAG_USES_TIME).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_UINT | 10004);
      expect(huks.HuksTag.HUKS_TAG_CRYPTO_CTX).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_ULONG | 10005);
      expect(huks.HuksTag.HUKS_TAG_KEY).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_BYTES | 10006);
      expect(huks.HuksTag.HUKS_TAG_KEY_VERSION).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_UINT | 10007);
      expect(huks.HuksTag.HUKS_TAG_PAYLOAD_LEN).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_UINT | 10008);
      expect(huks.HuksTag.HUKS_TAG_AE_TAG).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_BYTES | 10009);
      expect(huks.HuksTag.HUKS_TAG_IS_KEY_HANDLE).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_ULONG | 10010);
      expect(huks.HuksTag.HUKS_TAG_OS_VERSION).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_UINT | 10101);
      expect(huks.HuksTag.HUKS_TAG_OS_PATCHLEVEL).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_UINT | 10102);
      expect(huks.HuksTag.HUKS_TAG_SYMMETRIC_KEY_DATA).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_BYTES | 20001);
      expect(huks.HuksTag.HUKS_TAG_ASYMMETRIC_PUBLIC_KEY_DATA).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_BYTES | 20002);
      expect(huks.HuksTag.HUKS_TAG_ASYMMETRIC_PRIVATE_KEY_DATA).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_BYTES | 20003);
    })

  }
  )
}