/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "huks_misc_test.h"

#include <gtest/gtest.h>

using namespace testing::ext;
namespace Unittest::HuksMisc
{
class HuksMiscTest : public testing::Test
{
   public:
    static void SetUpTestCase(void);

    static void TearDownTestCase(void);

    void SetUp();

    void TearDown();
};

void HuksMiscTest::SetUpTestCase(void) {}

void HuksMiscTest::TearDownTestCase(void) {}

void HuksMiscTest::SetUp() {}

void HuksMiscTest::TearDown() {}

/**
 * @tc.name: HuksMiscTest.Security_HUKS_NAPI_Misc_0100
 * @tc.desc: misc test
 * @tc.type: FUNC
 */
HWTEST_F(HuksMiscTest, Security_HUKS_NAPI_Misc_0100, TestSize.Level0)
{
    ASSERT_EQ((uint32_t)OH_HUKS_DIGEST_NONE == 0, true);
    ASSERT_EQ((uint32_t)OH_HUKS_DIGEST_MD5 == 1, true);
    ASSERT_EQ((uint32_t)OH_HUKS_DIGEST_SM3 == 2, true);
    ASSERT_EQ((uint32_t)OH_HUKS_DIGEST_SHA1 == 10, true);
    ASSERT_EQ((uint32_t)OH_HUKS_DIGEST_SHA224 == 11, true);
    ASSERT_EQ((uint32_t)OH_HUKS_DIGEST_SHA256 == 12, true);
    ASSERT_EQ((uint32_t)OH_HUKS_DIGEST_SHA384 == 13, true);
    ASSERT_EQ((uint32_t)OH_HUKS_DIGEST_SHA512 == 14, true);
    ASSERT_EQ((uint32_t)OH_HUKS_PADDING_NONE == 0, true);
    ASSERT_EQ((uint32_t)OH_HUKS_PADDING_OAEP == 1, true);
    ASSERT_EQ((uint32_t)OH_HUKS_PADDING_PSS == 2, true);
    ASSERT_EQ((uint32_t)OH_HUKS_PADDING_PKCS1_V1_5 == 3, true);
    ASSERT_EQ((uint32_t)OH_HUKS_PADDING_PKCS5 == 4, true);
    ASSERT_EQ((uint32_t)OH_HUKS_PADDING_PKCS7 == 5, true);
    ASSERT_EQ((uint32_t)OH_HUKS_MODE_ECB == 1, true);
    ASSERT_EQ((uint32_t)OH_HUKS_MODE_CBC == 2, true);
    ASSERT_EQ((uint32_t)OH_HUKS_MODE_CTR == 3, true);
    ASSERT_EQ((uint32_t)OH_HUKS_MODE_OFB == 4, true);
    ASSERT_EQ((uint32_t)OH_HUKS_MODE_CCM == 31, true);
    ASSERT_EQ((uint32_t)OH_HUKS_MODE_GCM == 32, true);
    ASSERT_EQ((uint32_t)OH_HUKS_KEY_PURPOSE_ENCRYPT == 1, true);
    ASSERT_EQ((uint32_t)OH_HUKS_KEY_PURPOSE_DECRYPT == 2, true);
    ASSERT_EQ((uint32_t)OH_HUKS_KEY_PURPOSE_SIGN == 4, true);
    ASSERT_EQ((uint32_t)OH_HUKS_KEY_PURPOSE_VERIFY == 8, true);
    ASSERT_EQ((uint32_t)OH_HUKS_KEY_PURPOSE_DERIVE == 16, true);
    ASSERT_EQ((uint32_t)OH_HUKS_KEY_PURPOSE_WRAP == 32, true);
    ASSERT_EQ((uint32_t)OH_HUKS_KEY_PURPOSE_UNWRAP == 64, true);
    ASSERT_EQ((uint32_t)OH_HUKS_KEY_PURPOSE_MAC == 128, true);
    ASSERT_EQ((uint32_t)OH_HUKS_KEY_PURPOSE_AGREE == 256, true);
    ASSERT_EQ((uint32_t)OH_HUKS_RSA_KEY_SIZE_512 == 512, true);
    ASSERT_EQ((uint32_t)OH_HUKS_RSA_KEY_SIZE_768 == 768, true);
    ASSERT_EQ((uint32_t)OH_HUKS_RSA_KEY_SIZE_1024 == 1024, true);
    ASSERT_EQ((uint32_t)OH_HUKS_RSA_KEY_SIZE_2048 == 2048, true);
    ASSERT_EQ((uint32_t)OH_HUKS_RSA_KEY_SIZE_3072 == 3072, true);
    ASSERT_EQ((uint32_t)OH_HUKS_RSA_KEY_SIZE_4096 == 4096, true);
    ASSERT_EQ((uint32_t)OH_HUKS_ECC_KEY_SIZE_224 == 224, true);
    ASSERT_EQ((uint32_t)OH_HUKS_ECC_KEY_SIZE_256 == 256, true);
    ASSERT_EQ((uint32_t)OH_HUKS_ECC_KEY_SIZE_384 == 384, true);
    ASSERT_EQ((uint32_t)OH_HUKS_ECC_KEY_SIZE_521 == 521, true);
    ASSERT_EQ((uint32_t)OH_HUKS_AES_KEY_SIZE_128 == 128, true);
    ASSERT_EQ((uint32_t)OH_HUKS_AES_KEY_SIZE_192 == 192, true);
    ASSERT_EQ((uint32_t)OH_HUKS_AES_KEY_SIZE_256 == 256, true);
    ASSERT_EQ((uint32_t)OH_HUKS_AES_KEY_SIZE_512 == 512, true);
    ASSERT_EQ((uint32_t)OH_HUKS_DH_KEY_SIZE_2048 == 2048, true);
    ASSERT_EQ((uint32_t)OH_HUKS_DH_KEY_SIZE_3072 == 3072, true);
    ASSERT_EQ((uint32_t)OH_HUKS_DH_KEY_SIZE_4096 == 4096, true);
    ASSERT_EQ((uint32_t)OH_HUKS_SM2_KEY_SIZE_256 == 256, true);
    ASSERT_EQ((uint32_t)OH_HUKS_SM4_KEY_SIZE_128 == 128, true);
    ASSERT_EQ((uint32_t)OH_HUKS_ALG_RSA == 1, true);
    ASSERT_EQ((uint32_t)OH_HUKS_ALG_ECC == 2, true);
    ASSERT_EQ((uint32_t)OH_HUKS_ALG_DSA == 3, true);
    ASSERT_EQ((uint32_t)OH_HUKS_ALG_AES == 20, true);
    ASSERT_EQ((uint32_t)OH_HUKS_ALG_HMAC == 50, true);
    ASSERT_EQ((uint32_t)OH_HUKS_ALG_HKDF == 51, true);
    ASSERT_EQ((uint32_t)OH_HUKS_ALG_PBKDF2 == 52, true);
    ASSERT_EQ((uint32_t)OH_HUKS_ALG_ECDH == 100, true);
    ASSERT_EQ((uint32_t)OH_HUKS_ALG_X25519 == 101, true);
    ASSERT_EQ((uint32_t)OH_HUKS_ALG_ED25519 == 102, true);
    ASSERT_EQ((uint32_t)OH_HUKS_ALG_DH == 103, true);
    ASSERT_EQ((uint32_t)OH_HUKS_ALG_SM2 == 150, true);
    ASSERT_EQ((uint32_t)OH_HUKS_ALG_SM3 == 151, true);
    ASSERT_EQ((uint32_t)OH_HUKS_ALG_SM4 == 152, true);
    ASSERT_EQ((uint32_t)OH_HUKS_UNWRAP_SUITE_X25519_AES_256_GCM_NOPADDING == 1, true);
    ASSERT_EQ((uint32_t)OH_HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING == 2, true);
    ASSERT_EQ((uint32_t)OH_HUKS_KEY_GENERATE_TYPE_DEFAULT == 0, true);
    ASSERT_EQ((uint32_t)OH_HUKS_KEY_GENERATE_TYPE_DERIVE == 1, true);
    ASSERT_EQ((uint32_t)OH_HUKS_KEY_GENERATE_TYPE_AGREE == 2, true);
    ASSERT_EQ((uint32_t)OH_HUKS_KEY_FLAG_IMPORT_KEY == 1, true);
    ASSERT_EQ((uint32_t)OH_HUKS_KEY_FLAG_GENERATE_KEY == 2, true);
    ASSERT_EQ((uint32_t)OH_HUKS_KEY_FLAG_AGREE_KEY == 3, true);
    ASSERT_EQ((uint32_t)OH_HUKS_KEY_FLAG_DERIVE_KEY == 4, true);
    ASSERT_EQ((uint32_t)OH_HUKS_STORAGE_TEMP == 0, true);
    ASSERT_EQ((uint32_t)OH_HUKS_STORAGE_PERSISTENT == 1, true);
    ASSERT_EQ((uint32_t)OH_HUKS_KEY_TYPE_PUBLIC_KEY == 0, true);
    ASSERT_EQ((uint32_t)OH_HUKS_KEY_TYPE_PRIVATE_KEY == 1, true);
    ASSERT_EQ((uint32_t)OH_HUKS_KEY_TYPE_KEY_PAIR == 2, true);
    ASSERT_EQ((uint32_t)OH_HUKS_SUCCESS == 0, true);
    ASSERT_EQ((uint32_t)OH_HUKS_ERR_CODE_PERMISSION_FAIL == 201, true);
    ASSERT_EQ((uint32_t)OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT == 401, true);
    ASSERT_EQ((uint32_t)OH_HUKS_ERR_CODE_NOT_SUPPORTED_API == 801, true);
    ASSERT_EQ((uint32_t)OH_HUKS_ERR_CODE_FEATURE_NOT_SUPPORTED == 12000001, true);
    ASSERT_EQ((uint32_t)OH_HUKS_ERR_CODE_MISSING_CRYPTO_ALG_ARGUMENT == 12000002, true);
    ASSERT_EQ((uint32_t)OH_HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT == 12000003, true);
    ASSERT_EQ((uint32_t)OH_HUKS_ERR_CODE_FILE_OPERATION_FAIL == 12000004, true);
    ASSERT_EQ((uint32_t)OH_HUKS_ERR_CODE_COMMUNICATION_FAIL == 12000005, true);
    ASSERT_EQ((uint32_t)OH_HUKS_ERR_CODE_CRYPTO_FAIL == 12000006, true);
    ASSERT_EQ((uint32_t)OH_HUKS_ERR_CODE_KEY_AUTH_PERMANENTLY_INVALIDATED == 12000007, true);
    ASSERT_EQ((uint32_t)OH_HUKS_ERR_CODE_KEY_AUTH_VERIFY_FAILED == 12000008, true);
    ASSERT_EQ((uint32_t)OH_HUKS_ERR_CODE_KEY_AUTH_TIME_OUT == 12000009, true);
    ASSERT_EQ((uint32_t)OH_HUKS_ERR_CODE_SESSION_LIMIT == 12000010, true);
    ASSERT_EQ((uint32_t)OH_HUKS_ERR_CODE_ITEM_NOT_EXIST == 12000011, true);
    ASSERT_EQ((uint32_t)OH_HUKS_ERR_CODE_INTERNAL_ERROR == 12000012, true);
    ASSERT_EQ((uint32_t)OH_HUKS_ERR_CODE_CREDENTIAL_NOT_EXIST == 12000013, true);
    ASSERT_EQ((uint32_t)OH_HUKS_TAG_TYPE_INVALID == 0 << 28, true);
    ASSERT_EQ((uint32_t)OH_HUKS_TAG_TYPE_INT == 1 << 28, true);
    ASSERT_EQ((uint32_t)OH_HUKS_TAG_TYPE_UINT == 2 << 28, true);
    ASSERT_EQ((uint32_t)OH_HUKS_TAG_TYPE_ULONG == 3 << 28, true);
    ASSERT_EQ((uint32_t)OH_HUKS_TAG_TYPE_BOOL == 4 << 28, true);
    ASSERT_EQ((uint32_t)OH_HUKS_TAG_TYPE_BYTES == 5 << 28, true);
    ASSERT_EQ((uint32_t)OH_HUKS_USER_AUTH_TYPE_FINGERPRINT == 1 << 0, true);
    ASSERT_EQ((uint32_t)OH_HUKS_USER_AUTH_TYPE_FACE == 1 << 1, true);
    ASSERT_EQ((uint32_t)OH_HUKS_USER_AUTH_TYPE_PIN == 1 << 2, true);
    ASSERT_EQ((uint32_t)OH_HUKS_AUTH_ACCESS_INVALID_CLEAR_PASSWORD == 1 << 0, true);
    ASSERT_EQ((uint32_t)OH_HUKS_AUTH_ACCESS_INVALID_NEW_BIO_ENROLL == 1 << 1, true);
    ASSERT_EQ((uint32_t)OH_HUKS_CHALLENGE_TYPE_NORMAL == 0, true);
    ASSERT_EQ((uint32_t)OH_HUKS_CHALLENGE_TYPE_CUSTOM == 1, true);
    ASSERT_EQ((uint32_t)OH_HUKS_CHALLENGE_TYPE_NONE == 2, true);
    ASSERT_EQ((uint32_t)OH_HUKS_CHALLENGE_POS_0 == 0, true);
    ASSERT_EQ((uint32_t)OH_HUKS_CHALLENGE_POS_1 == 1, true);
    ASSERT_EQ((uint32_t)OH_HUKS_CHALLENGE_POS_2 == 2, true);
    ASSERT_EQ((uint32_t)OH_HUKS_CHALLENGE_POS_3 == 3, true);
    ASSERT_EQ((uint32_t)OH_HUKS_SECURE_SIGN_WITH_AUTHINFO == 1, true);
    ASSERT_EQ((uint32_t)OH_HUKS_TAG_ALGORITHM == (OH_HUKS_TAG_TYPE_UINT | 1), true);
    ASSERT_EQ((uint32_t)OH_HUKS_TAG_PURPOSE == (OH_HUKS_TAG_TYPE_UINT | 2), true);
    ASSERT_EQ((uint32_t)OH_HUKS_TAG_KEY_SIZE == (OH_HUKS_TAG_TYPE_UINT | 3), true);
    ASSERT_EQ((uint32_t)OH_HUKS_TAG_DIGEST == (OH_HUKS_TAG_TYPE_UINT | 4), true);
    ASSERT_EQ((uint32_t)OH_HUKS_TAG_PADDING == (OH_HUKS_TAG_TYPE_UINT | 5), true);
    ASSERT_EQ((uint32_t)OH_HUKS_TAG_BLOCK_MODE == (OH_HUKS_TAG_TYPE_UINT | 6), true);
    ASSERT_EQ((uint32_t)OH_HUKS_TAG_KEY_TYPE == (OH_HUKS_TAG_TYPE_UINT | 7), true);
    ASSERT_EQ((uint32_t)OH_HUKS_TAG_ASSOCIATED_DATA == (OH_HUKS_TAG_TYPE_BYTES | 8), true);
    ASSERT_EQ((uint32_t)OH_HUKS_TAG_NONCE == (OH_HUKS_TAG_TYPE_BYTES | 9), true);
    ASSERT_EQ((uint32_t)OH_HUKS_TAG_IV == (OH_HUKS_TAG_TYPE_BYTES | 10), true);
    ASSERT_EQ((uint32_t)OH_HUKS_TAG_INFO == (OH_HUKS_TAG_TYPE_BYTES | 11), true);
    ASSERT_EQ((uint32_t)OH_HUKS_TAG_SALT == (OH_HUKS_TAG_TYPE_BYTES | 12), true);
    ASSERT_EQ((uint32_t)OH_HUKS_TAG_ITERATION == (OH_HUKS_TAG_TYPE_UINT | 14), true);
    ASSERT_EQ((uint32_t)OH_HUKS_TAG_KEY_GENERATE_TYPE == (OH_HUKS_TAG_TYPE_UINT | 15), true);
    ASSERT_EQ((uint32_t)OH_HUKS_TAG_AGREE_ALG == (OH_HUKS_TAG_TYPE_UINT | 19), true);
    ASSERT_EQ((uint32_t)OH_HUKS_TAG_AGREE_PUBLIC_KEY_IS_KEY_ALIAS == (OH_HUKS_TAG_TYPE_BOOL | 20), true);
    ASSERT_EQ((uint32_t)OH_HUKS_TAG_AGREE_PRIVATE_KEY_ALIAS == (OH_HUKS_TAG_TYPE_BYTES | 21), true);
    ASSERT_EQ((uint32_t)OH_HUKS_TAG_AGREE_PUBLIC_KEY == (OH_HUKS_TAG_TYPE_BYTES | 22), true);
    ASSERT_EQ((uint32_t)OH_HUKS_TAG_KEY_ALIAS == (OH_HUKS_TAG_TYPE_BYTES | 23), true);
    ASSERT_EQ((uint32_t)OH_HUKS_TAG_DERIVE_KEY_SIZE == (OH_HUKS_TAG_TYPE_UINT | 24), true);
    ASSERT_EQ((uint32_t)OH_HUKS_TAG_IMPORT_KEY_TYPE == (OH_HUKS_TAG_TYPE_UINT | 25), true);
    ASSERT_EQ((uint32_t)OH_HUKS_TAG_UNWRAP_ALGORITHM_SUITE == (OH_HUKS_TAG_TYPE_UINT | 26), true);
    ASSERT_EQ((uint32_t)OH_HUKS_TAG_ALL_USERS == (OH_HUKS_TAG_TYPE_BOOL | 301), true);
    ASSERT_EQ((uint32_t)OH_HUKS_TAG_USER_ID == (OH_HUKS_TAG_TYPE_UINT | 302), true);
    ASSERT_EQ((uint32_t)OH_HUKS_TAG_NO_AUTH_REQUIRED == (OH_HUKS_TAG_TYPE_BOOL | 303), true);
    ASSERT_EQ((uint32_t)OH_HUKS_TAG_USER_AUTH_TYPE == (OH_HUKS_TAG_TYPE_UINT | 304), true);
    ASSERT_EQ((uint32_t)OH_HUKS_TAG_AUTH_TIMEOUT == (OH_HUKS_TAG_TYPE_UINT | 305), true);
    ASSERT_EQ((uint32_t)OH_HUKS_TAG_AUTH_TOKEN == (OH_HUKS_TAG_TYPE_BYTES | 306), true);
    ASSERT_EQ((uint32_t)OH_HUKS_TAG_KEY_AUTH_ACCESS_TYPE == (OH_HUKS_TAG_TYPE_UINT | 307), true);
    ASSERT_EQ((uint32_t)OH_HUKS_TAG_KEY_SECURE_SIGN_TYPE == (OH_HUKS_TAG_TYPE_UINT | 308), true);
    ASSERT_EQ((uint32_t)OH_HUKS_TAG_CHALLENGE_TYPE == (OH_HUKS_TAG_TYPE_UINT | 309), true);
    ASSERT_EQ((uint32_t)OH_HUKS_TAG_CHALLENGE_POS == (OH_HUKS_TAG_TYPE_UINT | 310), true);

    ASSERT_EQ((uint32_t)OH_HUKS_TAG_ATTESTATION_CHALLENGE == (OH_HUKS_TAG_TYPE_BYTES | 501), true);
    ASSERT_EQ((uint32_t)OH_HUKS_TAG_ATTESTATION_APPLICATION_ID == (OH_HUKS_TAG_TYPE_BYTES | 502), true);
    ASSERT_EQ((uint32_t)OH_HUKS_TAG_ATTESTATION_ID_ALIAS == (OH_HUKS_TAG_TYPE_BYTES | 511), true);
    ASSERT_EQ((uint32_t)OH_HUKS_TAG_ATTESTATION_ID_SEC_LEVEL_INFO == (OH_HUKS_TAG_TYPE_BYTES | 514), true);
    ASSERT_EQ((uint32_t)OH_HUKS_TAG_ATTESTATION_ID_VERSION_INFO == (OH_HUKS_TAG_TYPE_BYTES | 515), true);

    ASSERT_EQ((uint32_t)OH_HUKS_TAG_IS_KEY_ALIAS == (OH_HUKS_TAG_TYPE_BOOL | 1001), true);
    ASSERT_EQ((uint32_t)OH_HUKS_TAG_KEY_STORAGE_FLAG == (OH_HUKS_TAG_TYPE_UINT | 1002), true);
    ASSERT_EQ((uint32_t)OH_HUKS_TAG_IS_ALLOWED_WRAP == (OH_HUKS_TAG_TYPE_BOOL | 1003), true);
    ASSERT_EQ((uint32_t)OH_HUKS_TAG_KEY_WRAP_TYPE == (OH_HUKS_TAG_TYPE_UINT | 1004), true);
    ASSERT_EQ((uint32_t)OH_HUKS_TAG_KEY_AUTH_ID == (OH_HUKS_TAG_TYPE_BYTES | 1005), true);
    ASSERT_EQ((uint32_t)OH_HUKS_TAG_KEY_ROLE == (OH_HUKS_TAG_TYPE_UINT | 1006), true);
    ASSERT_EQ((uint32_t)OH_HUKS_TAG_KEY_FLAG == (OH_HUKS_TAG_TYPE_UINT | 1007), true);
    ASSERT_EQ((uint32_t)OH_HUKS_TAG_IS_ASYNCHRONIZED == (OH_HUKS_TAG_TYPE_UINT | 1008), true);
    ASSERT_EQ((uint32_t)OH_HUKS_TAG_KEY_DOMAIN == (OH_HUKS_TAG_TYPE_UINT | 1011), true);
    ASSERT_EQ((uint32_t)OH_HUKS_TAG_SYMMETRIC_KEY_DATA == (OH_HUKS_TAG_TYPE_BYTES | 20001), true);
    ASSERT_EQ((uint32_t)OH_HUKS_TAG_ASYMMETRIC_PUBLIC_KEY_DATA == (OH_HUKS_TAG_TYPE_BYTES | 20002), true);
    ASSERT_EQ((uint32_t)OH_HUKS_TAG_ASYMMETRIC_PRIVATE_KEY_DATA == (OH_HUKS_TAG_TYPE_BYTES | 20003), true);

    struct OH_Huks_Result result;
    ASSERT_EQ(sizeof(result.errorCode) == sizeof(int32_t), true);
    ASSERT_EQ(sizeof(result.errorMsg) == sizeof(const char *), true);
    ASSERT_EQ(sizeof(result.data) == sizeof(uint8_t *), true);

    struct OH_Huks_Blob blob;
    ASSERT_EQ(sizeof(blob.size) == sizeof(uint32_t), true);
    ASSERT_EQ(sizeof(blob.data) == sizeof(uint8_t *), true);

    struct OH_Huks_Param param;
    ASSERT_EQ(sizeof(param.tag) == sizeof(uint32_t), true);
    ASSERT_EQ(sizeof(param.boolParam) == sizeof(bool), true);
    ASSERT_EQ(sizeof(param.int32Param) == sizeof(int32_t), true);
    ASSERT_EQ(sizeof(param.uint32Param) == sizeof(uint32_t), true);
    ASSERT_EQ(sizeof(param.uint64Param) == sizeof(uint64_t), true);
    ASSERT_EQ(sizeof(param.blob) == sizeof(struct OH_Huks_Blob), true);

    struct OH_Huks_ParamSet paramset;
    ASSERT_EQ(sizeof(paramset.paramSetSize) == sizeof(uint32_t), true);
    ASSERT_EQ(sizeof(paramset.paramsCnt) == sizeof(uint32_t), true);
    ASSERT_EQ(sizeof(paramset.params[0]) == sizeof(struct OH_Huks_Param), true);

    struct OH_Huks_CertChain certChain;
    ASSERT_EQ(sizeof(certChain.certs) == sizeof(struct OH_Huks_Blob *), true);
    ASSERT_EQ(sizeof(certChain.certsCount) == sizeof(uint32_t), true);

    struct OH_Huks_KeyInfo keyInfo;
    ASSERT_EQ(sizeof(keyInfo.alias) == sizeof(struct OH_Huks_Blob), true);
    ASSERT_EQ(sizeof(keyInfo.paramSet) == sizeof(struct OH_Huks_ParamSet *), true);

    struct OH_Huks_PubKeyInfo pubKeyInfo;
    ASSERT_EQ(sizeof(pubKeyInfo.keyAlg) == sizeof(OH_Huks_KeyAlg), true);
    ASSERT_EQ(sizeof(pubKeyInfo.keySize) == sizeof(uint32_t), true);
    ASSERT_EQ(sizeof(pubKeyInfo.nOrXSize) == sizeof(uint32_t), true);
    ASSERT_EQ(sizeof(pubKeyInfo.eOrYSize) == sizeof(uint32_t), true);
    ASSERT_EQ(sizeof(pubKeyInfo.placeHolder) == sizeof(uint32_t), true);

    struct OH_Huks_KeyMaterialRsa keyMaterialRsa;
    ASSERT_EQ(sizeof(keyMaterialRsa.keyAlg) == sizeof(OH_Huks_KeyAlg), true);
    ASSERT_EQ(sizeof(keyMaterialRsa.keySize) == sizeof(uint32_t), true);
    ASSERT_EQ(sizeof(keyMaterialRsa.nSize) == sizeof(uint32_t), true);
    ASSERT_EQ(sizeof(keyMaterialRsa.eSize) == sizeof(uint32_t), true);
    ASSERT_EQ(sizeof(keyMaterialRsa.dSize) == sizeof(uint32_t), true);

    struct OH_Huks_KeyMaterialEcc keyMaterialEcc;
    ASSERT_EQ(sizeof(keyMaterialEcc.keyAlg) == sizeof(OH_Huks_KeyAlg), true);
    ASSERT_EQ(sizeof(keyMaterialEcc.keySize) == sizeof(uint32_t), true);
    ASSERT_EQ(sizeof(keyMaterialEcc.xSize) == sizeof(uint32_t), true);
    ASSERT_EQ(sizeof(keyMaterialEcc.ySize) == sizeof(uint32_t), true);
    ASSERT_EQ(sizeof(keyMaterialEcc.zSize) == sizeof(uint32_t), true);

    struct OH_Huks_KeyMaterialDsa keyMaterialDsa;
    ASSERT_EQ(sizeof(keyMaterialDsa.keyAlg) == sizeof(OH_Huks_KeyAlg), true);
    ASSERT_EQ(sizeof(keyMaterialDsa.keySize) == sizeof(uint32_t), true);
    ASSERT_EQ(sizeof(keyMaterialDsa.xSize) == sizeof(uint32_t), true);
    ASSERT_EQ(sizeof(keyMaterialDsa.ySize) == sizeof(uint32_t), true);
    ASSERT_EQ(sizeof(keyMaterialDsa.pSize) == sizeof(uint32_t), true);
    ASSERT_EQ(sizeof(keyMaterialDsa.qSize) == sizeof(uint32_t), true);
    ASSERT_EQ(sizeof(keyMaterialDsa.gSize) == sizeof(uint32_t), true);

    struct OH_Huks_KeyMaterialDh keyMaterialDh;
    ASSERT_EQ(sizeof(keyMaterialDh.keyAlg) == sizeof(OH_Huks_KeyAlg), true);
    ASSERT_EQ(sizeof(keyMaterialDh.keySize) == sizeof(uint32_t), true);
    ASSERT_EQ(sizeof(keyMaterialDh.pubKeySize) == sizeof(uint32_t), true);
    ASSERT_EQ(sizeof(keyMaterialDh.priKeySize) == sizeof(uint32_t), true);
    ASSERT_EQ(sizeof(keyMaterialDh.reserved) == sizeof(uint32_t), true);

    struct OH_Huks_KeyMaterial25519 keyMaterial25519;
    ASSERT_EQ(sizeof(keyMaterial25519.keyAlg) == sizeof(OH_Huks_KeyAlg), true);
    ASSERT_EQ(sizeof(keyMaterial25519.keySize) == sizeof(uint32_t), true);
    ASSERT_EQ(sizeof(keyMaterial25519.pubKeySize) == sizeof(uint32_t), true);
    ASSERT_EQ(sizeof(keyMaterial25519.priKeySize) == sizeof(uint32_t), true);
    ASSERT_EQ(sizeof(keyMaterial25519.reserved) == sizeof(uint32_t), true);
}
}  // namespace Unittest::HuksMisc
