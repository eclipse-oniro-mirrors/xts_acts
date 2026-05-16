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

#include "include/HuksMiscTest.h"
#include <cstddef>
#include <cstdint>
#include <huks/native_huks_api.h>
#include <huks/native_huks_param.h>
#include <huks/native_huks_type.h>

namespace Acts {
namespace Huks {

// ==================== 常量定义区域 ====================

// TAG 基础 ID - 通用 TAG (与 TAG_TYPE 位运算使用)
const uint32_t TAG_ALGORITHM_ID = 1;
const uint32_t TAG_PURPOSE_ID = 2;
const uint32_t TAG_KEY_SIZE_ID = 3;
const uint32_t TAG_DIGEST_ID = 4;
const uint32_t TAG_PADDING_ID = 5;
const uint32_t TAG_BLOCK_MODE_ID = 6;
const uint32_t TAG_KEY_TYPE_ID = 7;
const uint32_t TAG_ASSOCIATED_DATA_ID = 8;
const uint32_t TAG_NONCE_ID = 9;
const uint32_t TAG_IV_ID = 10;
const uint32_t TAG_INFO_ID = 11;
const uint32_t TAG_SALT_ID = 12;
const uint32_t TAG_ITERATION_ID = 14;
const uint32_t TAG_KEY_GENERATE_TYPE_ID = 15;
const uint32_t TAG_AGREE_ALG_ID = 19;
const uint32_t TAG_AGREE_PUBLIC_KEY_IS_KEY_ALIAS_ID = 20;
const uint32_t TAG_AGREE_PRIVATE_KEY_ALIAS_ID = 21;
const uint32_t TAG_AGREE_PUBLIC_KEY_ID = 22;
const uint32_t TAG_KEY_ALIAS_ID = 23;
const uint32_t TAG_DERIVE_KEY_SIZE_ID = 24;
const uint32_t TAG_IMPORT_KEY_TYPE_ID = 25;
const uint32_t TAG_UNWRAP_ALGORITHM_SUITE_ID = 26;

// TAG 基础 ID - 用户认证 TAG
const uint32_t TAG_ALL_USERS_ID = 301;
const uint32_t TAG_USER_ID_ID = 302;
const uint32_t TAG_NO_AUTH_REQUIRED_ID = 303;
const uint32_t TAG_USER_AUTH_TYPE_ID = 304;
const uint32_t TAG_AUTH_TIMEOUT_ID = 305;
const uint32_t TAG_AUTH_TOKEN_ID = 306;
const uint32_t TAG_KEY_AUTH_ACCESS_TYPE_ID = 307;
const uint32_t TAG_KEY_SECURE_SIGN_TYPE_ID = 308;
const uint32_t TAG_CHALLENGE_TYPE_ID = 309;
const uint32_t TAG_CHALLENGE_POS_ID = 310;

// TAG 基础 ID - 认证 TAG
const uint32_t TAG_ATTESTATION_CHALLENGE_ID = 501;
const uint32_t TAG_ATTESTATION_APPLICATION_ID = 502;
const uint32_t TAG_ATTESTATION_ID_ALIAS_ID = 511;
const uint32_t TAG_ATTESTATION_ID_SEC_LEVEL_INFO_ID = 514;
const uint32_t TAG_ATTESTATION_ID_VERSION_INFO_ID = 515;

// TAG 基础 ID - 密钥管理 TAG
const uint32_t TAG_IS_KEY_ALIAS_ID = 1001;
const uint32_t TAG_KEY_STORAGE_FLAG_ID = 1002;
const uint32_t TAG_IS_ALLOWED_WRAP_ID = 1003;
const uint32_t TAG_KEY_WRAP_TYPE_ID = 1004;
const uint32_t TAG_KEY_AUTH_ID_ID = 1005;
const uint32_t TAG_KEY_ROLE_ID = 1006;
const uint32_t TAG_KEY_FLAG_ID = 1007;
const uint32_t TAG_IS_ASYNCHRONIZED_ID = 1008;
const uint32_t TAG_KEY_DOMAIN_ID = 1011;
const uint32_t TAG_SYMMETRIC_KEY_DATA_ID = 20001;
const uint32_t TAG_ASYMMETRIC_PUBLIC_KEY_DATA_ID = 20002;
const uint32_t TAG_ASYMMETRIC_PRIVATE_KEY_DATA_ID = 20003;

// 枚举值 - DIGEST
const uint32_t DIGEST_NONE_VALUE = 0;
const uint32_t DIGEST_MD5_VALUE = 1;
const uint32_t DIGEST_SM3_VALUE = 2;
const uint32_t DIGEST_SHA1_VALUE = 10;
const uint32_t DIGEST_SHA224_VALUE = 11;
const uint32_t DIGEST_SHA256_VALUE = 12;
const uint32_t DIGEST_SHA384_VALUE = 13;
const uint32_t DIGEST_SHA512_VALUE = 14;

// 枚举值 - PADDING
const uint32_t PADDING_NONE_VALUE = 0;
const uint32_t PADDING_OAEP_VALUE = 1;
const uint32_t PADDING_PSS_VALUE = 2;
const uint32_t PADDING_PKCS1_V1_5_VALUE = 3;
const uint32_t PADDING_PKCS5_VALUE = 4;
const uint32_t PADDING_PKCS7_VALUE = 5;

// 枚举值 - MODE
const uint32_t MODE_ECB_VALUE = 1;
const uint32_t MODE_CBC_VALUE = 2;
const uint32_t MODE_CTR_VALUE = 3;
const uint32_t MODE_OFB_VALUE = 4;
const uint32_t MODE_CCM_VALUE = 31;
const uint32_t MODE_GCM_VALUE = 32;

// 枚举值 - KEY_PURPOSE
const uint32_t KEY_PURPOSE_ENCRYPT_VALUE = 1;
const uint32_t KEY_PURPOSE_DECRYPT_VALUE = 2;
const uint32_t KEY_PURPOSE_SIGN_VALUE = 4;
const uint32_t KEY_PURPOSE_VERIFY_VALUE = 8;
const uint32_t KEY_PURPOSE_DERIVE_VALUE = 16;
const uint32_t KEY_PURPOSE_WRAP_VALUE = 32;
const uint32_t KEY_PURPOSE_UNWRAP_VALUE = 64;
const uint32_t KEY_PURPOSE_MAC_VALUE = 128;
const uint32_t KEY_PURPOSE_AGREE_VALUE = 256;

// 枚举值 - ALG
const uint32_t ALG_RSA_VALUE = 1;
const uint32_t ALG_ECC_VALUE = 2;
const uint32_t ALG_DSA_VALUE = 3;
const uint32_t ALG_AES_VALUE = 20;
const uint32_t ALG_HMAC_VALUE = 50;
const uint32_t ALG_HKDF_VALUE = 51;
const uint32_t ALG_PBKDF2_VALUE = 52;
const uint32_t ALG_ECDH_VALUE = 100;
const uint32_t ALG_X25519_VALUE = 101;
const uint32_t ALG_ED25519_VALUE = 102;
const uint32_t ALG_DH_VALUE = 103;
const uint32_t ALG_SM2_VALUE = 150;
const uint32_t ALG_SM3_VALUE = 151;
const uint32_t ALG_SM4_VALUE = 152;

// 枚举值 - UNWRAP_SUITE
const uint32_t UNWRAP_SUITE_X25519_AES_256_GCM_NOPADDING_VALUE = 1;
const uint32_t UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING_VALUE = 2;

// 枚举值 - KEY_GENERATE_TYPE
const uint32_t KEY_GENERATE_TYPE_DEFAULT_VALUE = 0;
const uint32_t KEY_GENERATE_TYPE_DERIVE_VALUE = 1;
const uint32_t KEY_GENERATE_TYPE_AGREE_VALUE = 2;

// 枚举值 - KEY_FLAG
const uint32_t KEY_FLAG_IMPORT_KEY_VALUE = 1;
const uint32_t KEY_FLAG_GENERATE_KEY_VALUE = 2;
const uint32_t KEY_FLAG_AGREE_KEY_VALUE = 3;
const uint32_t KEY_FLAG_DERIVE_KEY_VALUE = 4;

// 枚举值 - STORAGE
const uint32_t STORAGE_TEMP_VALUE = 0;
const uint32_t STORAGE_PERSISTENT_VALUE = 1;

// 枚举值 - KEY_TYPE
const uint32_t KEY_TYPE_PUBLIC_KEY_VALUE = 0;
const uint32_t KEY_TYPE_PRIVATE_KEY_VALUE = 1;
const uint32_t KEY_TYPE_KEY_PAIR_VALUE = 2;

// 枚举值 - ERROR_CODE
const uint32_t SUCCESS_VALUE = 0;
const uint32_t ERR_CODE_PERMISSION_FAIL_VALUE = 201;
const uint32_t ERR_CODE_ILLEGAL_ARGUMENT_VALUE = 401;
const uint32_t ERR_CODE_NOT_SUPPORTED_API_VALUE = 801;
const uint32_t ERR_CODE_FEATURE_NOT_SUPPORTED_VALUE = 12000001;
const uint32_t ERR_CODE_MISSING_CRYPTO_ALG_ARGUMENT_VALUE = 12000002;
const uint32_t ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT_VALUE = 12000003;
const uint32_t ERR_CODE_FILE_OPERATION_FAIL_VALUE = 12000004;
const uint32_t ERR_CODE_COMMUNICATION_FAIL_VALUE = 12000005;
const uint32_t ERR_CODE_CRYPTO_FAIL_VALUE = 12000006;
const uint32_t ERR_CODE_KEY_AUTH_PERMANENTLY_INVALIDATED_VALUE = 12000007;
const uint32_t ERR_CODE_KEY_AUTH_VERIFY_FAILED_VALUE = 12000008;
const uint32_t ERR_CODE_KEY_AUTH_TIME_OUT_VALUE = 12000009;
const uint32_t ERR_CODE_SESSION_LIMIT_VALUE = 12000010;
const uint32_t ERR_CODE_ITEM_NOT_EXIST_VALUE = 12000011;
const uint32_t ERR_CODE_INTERNAL_ERROR_VALUE = 12000012;
const uint32_t ERR_CODE_CREDENTIAL_NOT_EXIST_VALUE = 12000013;

// 枚举值 - CHALLENGE
const uint32_t CHALLENGE_TYPE_NORMAL_VALUE = 0;
const uint32_t CHALLENGE_TYPE_CUSTOM_VALUE = 1;
const uint32_t CHALLENGE_TYPE_NONE_VALUE = 2;
const uint32_t CHALLENGE_POS_0_VALUE = 0;
const uint32_t CHALLENGE_POS_1_VALUE = 1;
const uint32_t CHALLENGE_POS_2_VALUE = 2;
const uint32_t CHALLENGE_POS_3_VALUE = 3;

// 枚举值 - SECURE_SIGN
const uint32_t SECURE_SIGN_WITH_AUTHINFO_VALUE = 1;

// 密钥大小常量 - RSA
const uint32_t RSA_KEY_SIZE_512 = 512;
const uint32_t RSA_KEY_SIZE_768 = 768;
const uint32_t RSA_KEY_SIZE_1024 = 1024;
const uint32_t RSA_KEY_SIZE_2048 = 2048;
const uint32_t RSA_KEY_SIZE_3072 = 3072;
const uint32_t RSA_KEY_SIZE_4096 = 4096;

// 密钥大小常量 - ECC
const uint32_t ECC_KEY_SIZE_224 = 224;
const uint32_t ECC_KEY_SIZE_256 = 256;
const uint32_t ECC_KEY_SIZE_384 = 384;
const uint32_t ECC_KEY_SIZE_521 = 521;

// 密钥大小常量 - AES
const uint32_t AES_KEY_SIZE_128 = 128;
const uint32_t AES_KEY_SIZE_192 = 192;
const uint32_t AES_KEY_SIZE_256 = 256;
const uint32_t AES_KEY_SIZE_512 = 512;

// 密钥大小常量 - DH
const uint32_t DH_KEY_SIZE_2048 = 2048;
const uint32_t DH_KEY_SIZE_3072 = 3072;
const uint32_t DH_KEY_SIZE_4096 = 4096;

// 密钥大小常量 - SM2/SM4
const uint32_t SM2_KEY_SIZE_256 = 256;
const uint32_t SM4_KEY_SIZE_128 = 128;

// 位移操作常量 - TAG_TYPE
const uint32_t TAG_TYPE_INVALID_SHIFT = 0;
const uint32_t TAG_TYPE_INT_SHIFT = 1;
const uint32_t TAG_TYPE_UINT_SHIFT = 2;
const uint32_t TAG_TYPE_ULONG_SHIFT = 3;
const uint32_t TAG_TYPE_BOOL_SHIFT = 4;
const uint32_t TAG_TYPE_BYTES_SHIFT = 5;
const uint32_t TAG_TYPE_SHIFT_BITS = 28;

// 位移操作常量 - USER_AUTH_TYPE
const uint32_t USER_AUTH_TYPE_FINGERPRINT_BIT = 0;
const uint32_t USER_AUTH_TYPE_FACE_BIT = 1;
const uint32_t USER_AUTH_TYPE_PIN_BIT = 2;

// 位移操作常量 - AUTH_ACCESS_INVALID
const uint32_t AUTH_ACCESS_INVALID_CLEAR_PASSWORD_BIT = 0;
const uint32_t AUTH_ACCESS_INVALID_NEW_BIO_ENROLL_BIT = 1;

// 内存分配上限常量
static const size_t MAX_ALLOC_SIZE = SIZE_MAX / 2; // size_t 最大值的一半，防止整数溢出

// ==================== 辅助函数 ====================

// Helper function: 安全的内存分配函数
static void* HksMalloc(size_t size)
{
    // G.MEM.01: 内存申请前，必须对申请内存大小进行合法性校验
    if (size == 0 || size > MAX_ALLOC_SIZE) {
        return nullptr;
    }
    return malloc(size);
}

// ==================== 常量验证辅助函数 ====================

// Helper function: Verify digest algorithm constants
static int VerifyDigestConstants()
{
    if (((uint32_t)OH_HUKS_DIGEST_NONE != DIGEST_NONE_VALUE) || ((uint32_t)OH_HUKS_DIGEST_MD5 != DIGEST_MD5_VALUE) ||
        ((uint32_t)OH_HUKS_DIGEST_SM3 != DIGEST_SM3_VALUE) || ((uint32_t)OH_HUKS_DIGEST_SHA1 != DIGEST_SHA1_VALUE) ||
        ((uint32_t)OH_HUKS_DIGEST_SHA224 != DIGEST_SHA224_VALUE) ||
        ((uint32_t)OH_HUKS_DIGEST_SHA256 != DIGEST_SHA256_VALUE) ||
        ((uint32_t)OH_HUKS_DIGEST_SHA384 != DIGEST_SHA384_VALUE) ||
        ((uint32_t)OH_HUKS_DIGEST_SHA512 != DIGEST_SHA512_VALUE)) {
        return -1;
    }
    return 0;
}

// Helper function: Verify padding and mode constants
static int VerifyPaddingAndModeConstants()
{
    // Padding constants
    if (((uint32_t)OH_HUKS_PADDING_NONE != PADDING_NONE_VALUE) ||
        ((uint32_t)OH_HUKS_PADDING_OAEP != PADDING_OAEP_VALUE) ||
        ((uint32_t)OH_HUKS_PADDING_PSS != PADDING_PSS_VALUE) ||
        ((uint32_t)OH_HUKS_PADDING_PKCS1_V1_5 != PADDING_PKCS1_V1_5_VALUE) ||
        ((uint32_t)OH_HUKS_PADDING_PKCS5 != PADDING_PKCS5_VALUE) ||
        ((uint32_t)OH_HUKS_PADDING_PKCS7 != PADDING_PKCS7_VALUE)) {
        return -1;
    }

    // Mode constants
    if (((uint32_t)OH_HUKS_MODE_ECB != MODE_ECB_VALUE) || ((uint32_t)OH_HUKS_MODE_CBC != MODE_CBC_VALUE) ||
        ((uint32_t)OH_HUKS_MODE_CTR != MODE_CTR_VALUE) || ((uint32_t)OH_HUKS_MODE_OFB != MODE_OFB_VALUE) ||
        ((uint32_t)OH_HUKS_MODE_CCM != MODE_CCM_VALUE) || ((uint32_t)OH_HUKS_MODE_GCM != MODE_GCM_VALUE)) {
        return -1;
    }

    return 0;
}

// Helper function: Verify key purpose constants
static int VerifyKeyPurposeConstants()
{
    if (((uint32_t)OH_HUKS_KEY_PURPOSE_ENCRYPT != KEY_PURPOSE_ENCRYPT_VALUE) ||
        ((uint32_t)OH_HUKS_KEY_PURPOSE_DECRYPT != KEY_PURPOSE_DECRYPT_VALUE) ||
        ((uint32_t)OH_HUKS_KEY_PURPOSE_SIGN != KEY_PURPOSE_SIGN_VALUE) ||
        ((uint32_t)OH_HUKS_KEY_PURPOSE_VERIFY != KEY_PURPOSE_VERIFY_VALUE) ||
        ((uint32_t)OH_HUKS_KEY_PURPOSE_DERIVE != KEY_PURPOSE_DERIVE_VALUE) ||
        ((uint32_t)OH_HUKS_KEY_PURPOSE_WRAP != KEY_PURPOSE_WRAP_VALUE) ||
        ((uint32_t)OH_HUKS_KEY_PURPOSE_UNWRAP != KEY_PURPOSE_UNWRAP_VALUE) ||
        ((uint32_t)OH_HUKS_KEY_PURPOSE_MAC != KEY_PURPOSE_MAC_VALUE) ||
        ((uint32_t)OH_HUKS_KEY_PURPOSE_AGREE != KEY_PURPOSE_AGREE_VALUE)) {
        return -1;
    }
    return 0;
}

// Helper function: Verify key size constants
static int VerifyKeySizeConstants()
{
    if (((uint32_t)OH_HUKS_RSA_KEY_SIZE_512 != RSA_KEY_SIZE_512) ||
        ((uint32_t)OH_HUKS_RSA_KEY_SIZE_768 != RSA_KEY_SIZE_768) ||
        ((uint32_t)OH_HUKS_RSA_KEY_SIZE_1024 != RSA_KEY_SIZE_1024) ||
        ((uint32_t)OH_HUKS_RSA_KEY_SIZE_2048 != RSA_KEY_SIZE_2048) ||
        ((uint32_t)OH_HUKS_RSA_KEY_SIZE_3072 != RSA_KEY_SIZE_3072) ||
        ((uint32_t)OH_HUKS_RSA_KEY_SIZE_4096 != RSA_KEY_SIZE_4096) ||
        ((uint32_t)OH_HUKS_ECC_KEY_SIZE_224 != ECC_KEY_SIZE_224) ||
        ((uint32_t)OH_HUKS_ECC_KEY_SIZE_256 != ECC_KEY_SIZE_256) ||
        ((uint32_t)OH_HUKS_ECC_KEY_SIZE_384 != ECC_KEY_SIZE_384) ||
        ((uint32_t)OH_HUKS_ECC_KEY_SIZE_521 != ECC_KEY_SIZE_521) ||
        ((uint32_t)OH_HUKS_AES_KEY_SIZE_128 != AES_KEY_SIZE_128) ||
        ((uint32_t)OH_HUKS_AES_KEY_SIZE_192 != AES_KEY_SIZE_192) ||
        ((uint32_t)OH_HUKS_AES_KEY_SIZE_256 != AES_KEY_SIZE_256) ||
        ((uint32_t)OH_HUKS_AES_KEY_SIZE_512 != AES_KEY_SIZE_512) ||
        ((uint32_t)OH_HUKS_DH_KEY_SIZE_2048 != DH_KEY_SIZE_2048) ||
        ((uint32_t)OH_HUKS_DH_KEY_SIZE_3072 != DH_KEY_SIZE_3072) ||
        ((uint32_t)OH_HUKS_DH_KEY_SIZE_4096 != DH_KEY_SIZE_4096) ||
        ((uint32_t)OH_HUKS_SM2_KEY_SIZE_256 != SM2_KEY_SIZE_256) ||
        ((uint32_t)OH_HUKS_SM4_KEY_SIZE_128 != SM4_KEY_SIZE_128)) {
        return -1;
    }
    return 0;
}

// Helper function: Verify algorithm constants
static int VerifyAlgorithmConstants()
{
    if (((uint32_t)OH_HUKS_ALG_RSA != ALG_RSA_VALUE) || ((uint32_t)OH_HUKS_ALG_ECC != ALG_ECC_VALUE) ||
        ((uint32_t)OH_HUKS_ALG_DSA != ALG_DSA_VALUE) || ((uint32_t)OH_HUKS_ALG_AES != ALG_AES_VALUE) ||
        ((uint32_t)OH_HUKS_ALG_HMAC != ALG_HMAC_VALUE) || ((uint32_t)OH_HUKS_ALG_HKDF != ALG_HKDF_VALUE) ||
        ((uint32_t)OH_HUKS_ALG_PBKDF2 != ALG_PBKDF2_VALUE) || ((uint32_t)OH_HUKS_ALG_ECDH != ALG_ECDH_VALUE) ||
        ((uint32_t)OH_HUKS_ALG_X25519 != ALG_X25519_VALUE) || ((uint32_t)OH_HUKS_ALG_ED25519 != ALG_ED25519_VALUE) ||
        ((uint32_t)OH_HUKS_ALG_DH != ALG_DH_VALUE) || ((uint32_t)OH_HUKS_ALG_SM2 != ALG_SM2_VALUE) ||
        ((uint32_t)OH_HUKS_ALG_SM3 != ALG_SM3_VALUE) || ((uint32_t)OH_HUKS_ALG_SM4 != ALG_SM4_VALUE)) {
        return -1;
    }
    return 0;
}

// Helper function: Verify other enum constants
static int VerifyOtherEnumConstants()
{
    if (((uint32_t)OH_HUKS_UNWRAP_SUITE_X25519_AES_256_GCM_NOPADDING !=
         UNWRAP_SUITE_X25519_AES_256_GCM_NOPADDING_VALUE) ||
        ((uint32_t)OH_HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING != UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING_VALUE) ||
        ((uint32_t)OH_HUKS_KEY_GENERATE_TYPE_DEFAULT != KEY_GENERATE_TYPE_DEFAULT_VALUE) ||
        ((uint32_t)OH_HUKS_KEY_GENERATE_TYPE_DERIVE != KEY_GENERATE_TYPE_DERIVE_VALUE) ||
        ((uint32_t)OH_HUKS_KEY_GENERATE_TYPE_AGREE != KEY_GENERATE_TYPE_AGREE_VALUE) ||
        ((uint32_t)OH_HUKS_KEY_FLAG_IMPORT_KEY != KEY_FLAG_IMPORT_KEY_VALUE) ||
        ((uint32_t)OH_HUKS_KEY_FLAG_GENERATE_KEY != KEY_FLAG_GENERATE_KEY_VALUE) ||
        ((uint32_t)OH_HUKS_KEY_FLAG_AGREE_KEY != KEY_FLAG_AGREE_KEY_VALUE) ||
        ((uint32_t)OH_HUKS_KEY_FLAG_DERIVE_KEY != KEY_FLAG_DERIVE_KEY_VALUE) ||
        ((uint32_t)OH_HUKS_STORAGE_TEMP != STORAGE_TEMP_VALUE) ||
        ((uint32_t)OH_HUKS_STORAGE_PERSISTENT != STORAGE_PERSISTENT_VALUE) ||
        ((uint32_t)OH_HUKS_KEY_TYPE_PUBLIC_KEY != KEY_TYPE_PUBLIC_KEY_VALUE) ||
        ((uint32_t)OH_HUKS_KEY_TYPE_PRIVATE_KEY != KEY_TYPE_PRIVATE_KEY_VALUE) ||
        ((uint32_t)OH_HUKS_KEY_TYPE_KEY_PAIR != KEY_TYPE_KEY_PAIR_VALUE)) {
        return -1;
    }
    return 0;
}
// Helper function: Verify basic error code constants
static int VerifyBasicErrorCodes()
{
    if (((uint32_t)OH_HUKS_SUCCESS != SUCCESS_VALUE) ||
        ((uint32_t)OH_HUKS_ERR_CODE_PERMISSION_FAIL != ERR_CODE_PERMISSION_FAIL_VALUE) ||
        ((uint32_t)OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT != ERR_CODE_ILLEGAL_ARGUMENT_VALUE) ||
        ((uint32_t)OH_HUKS_ERR_CODE_NOT_SUPPORTED_API != ERR_CODE_NOT_SUPPORTED_API_VALUE) ||
        ((uint32_t)OH_HUKS_ERR_CODE_FEATURE_NOT_SUPPORTED != ERR_CODE_FEATURE_NOT_SUPPORTED_VALUE) ||
        ((uint32_t)OH_HUKS_ERR_CODE_MISSING_CRYPTO_ALG_ARGUMENT != ERR_CODE_MISSING_CRYPTO_ALG_ARGUMENT_VALUE) ||
        ((uint32_t)OH_HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT != ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT_VALUE) ||
        ((uint32_t)OH_HUKS_ERR_CODE_FILE_OPERATION_FAIL != ERR_CODE_FILE_OPERATION_FAIL_VALUE) ||
        ((uint32_t)OH_HUKS_ERR_CODE_COMMUNICATION_FAIL != ERR_CODE_COMMUNICATION_FAIL_VALUE) ||
        ((uint32_t)OH_HUKS_ERR_CODE_CRYPTO_FAIL != ERR_CODE_CRYPTO_FAIL_VALUE) ||
        ((uint32_t)OH_HUKS_ERR_CODE_KEY_AUTH_PERMANENTLY_INVALIDATED !=
         ERR_CODE_KEY_AUTH_PERMANENTLY_INVALIDATED_VALUE) ||
        ((uint32_t)OH_HUKS_ERR_CODE_KEY_AUTH_VERIFY_FAILED != ERR_CODE_KEY_AUTH_VERIFY_FAILED_VALUE) ||
        ((uint32_t)OH_HUKS_ERR_CODE_KEY_AUTH_TIME_OUT != ERR_CODE_KEY_AUTH_TIME_OUT_VALUE) ||
        ((uint32_t)OH_HUKS_ERR_CODE_SESSION_LIMIT != ERR_CODE_SESSION_LIMIT_VALUE) ||
        ((uint32_t)OH_HUKS_ERR_CODE_ITEM_NOT_EXIST != ERR_CODE_ITEM_NOT_EXIST_VALUE) ||
        ((uint32_t)OH_HUKS_ERR_CODE_INTERNAL_ERROR != ERR_CODE_INTERNAL_ERROR_VALUE) ||
        ((uint32_t)OH_HUKS_ERR_CODE_CREDENTIAL_NOT_EXIST != ERR_CODE_CREDENTIAL_NOT_EXIST_VALUE)) {
        return -1;
    }
    return 0;
}

// Helper function: Verify tag type constants
static int VerifyTagTypeConstants()
{
    if (((uint32_t)OH_HUKS_TAG_TYPE_INVALID != (TAG_TYPE_INVALID_SHIFT << TAG_TYPE_SHIFT_BITS)) ||
        ((uint32_t)OH_HUKS_TAG_TYPE_INT != (TAG_TYPE_INT_SHIFT << TAG_TYPE_SHIFT_BITS)) ||
        ((uint32_t)OH_HUKS_TAG_TYPE_UINT != (TAG_TYPE_UINT_SHIFT << TAG_TYPE_SHIFT_BITS)) ||
        ((uint32_t)OH_HUKS_TAG_TYPE_ULONG != (TAG_TYPE_ULONG_SHIFT << TAG_TYPE_SHIFT_BITS)) ||
        ((uint32_t)OH_HUKS_TAG_TYPE_BOOL != (TAG_TYPE_BOOL_SHIFT << TAG_TYPE_SHIFT_BITS)) ||
        ((uint32_t)OH_HUKS_TAG_TYPE_BYTES != (TAG_TYPE_BYTES_SHIFT << TAG_TYPE_SHIFT_BITS))) {
        return -1;
    }
    return 0;
}

// Helper function: Verify user authentication type constants
static int VerifyUserAuthTypeConstants()
{
    if (((uint32_t)OH_HUKS_USER_AUTH_TYPE_FINGERPRINT != (1 << USER_AUTH_TYPE_FINGERPRINT_BIT)) ||
        ((uint32_t)OH_HUKS_USER_AUTH_TYPE_FACE != (1 << USER_AUTH_TYPE_FACE_BIT)) ||
        ((uint32_t)OH_HUKS_USER_AUTH_TYPE_PIN != (1 << USER_AUTH_TYPE_PIN_BIT))) {
        return -1;
    }
    return 0;
}

// Helper function: Verify authentication access invalid constants
static int VerifyAuthAccessInvalidConstants()
{
    if (((uint32_t)OH_HUKS_AUTH_ACCESS_INVALID_CLEAR_PASSWORD != (1 << AUTH_ACCESS_INVALID_CLEAR_PASSWORD_BIT)) ||
        ((uint32_t)OH_HUKS_AUTH_ACCESS_INVALID_NEW_BIO_ENROLL != (1 << AUTH_ACCESS_INVALID_NEW_BIO_ENROLL_BIT))) {
        return -1;
    }
    return 0;
}

// Helper function: Verify challenge constants
static int VerifyChallengeConstants()
{
    if (((uint32_t)OH_HUKS_CHALLENGE_TYPE_NORMAL != CHALLENGE_TYPE_NORMAL_VALUE) ||
        ((uint32_t)OH_HUKS_CHALLENGE_TYPE_CUSTOM != CHALLENGE_TYPE_CUSTOM_VALUE) ||
        ((uint32_t)OH_HUKS_CHALLENGE_TYPE_NONE != CHALLENGE_TYPE_NONE_VALUE) ||
        ((uint32_t)OH_HUKS_CHALLENGE_POS_0 != CHALLENGE_POS_0_VALUE) ||
        ((uint32_t)OH_HUKS_CHALLENGE_POS_1 != CHALLENGE_POS_1_VALUE) ||
        ((uint32_t)OH_HUKS_CHALLENGE_POS_2 != CHALLENGE_POS_2_VALUE) ||
        ((uint32_t)OH_HUKS_CHALLENGE_POS_3 != CHALLENGE_POS_3_VALUE)) {
        return -1;
    }
    return 0;
}

// Helper function: Verify secure sign constants
static int VerifySecureSignConstants()
{
    if ((uint32_t)OH_HUKS_SECURE_SIGN_WITH_AUTHINFO != SECURE_SIGN_WITH_AUTHINFO_VALUE) {
        return -1;
    }
    return 0;
}

// Helper function: Verify error code and tag type constants
static int VerifyErrorCodeConstants()
{
    if (VerifyBasicErrorCodes() != 0) {
        return -1;
    }
    if (VerifyTagTypeConstants() != 0) {
        return -1;
    }
    if (VerifyUserAuthTypeConstants() != 0) {
        return -1;
    }
    if (VerifyAuthAccessInvalidConstants() != 0) {
        return -1;
    }
    if (VerifyChallengeConstants() != 0) {
        return -1;
    }
    if (VerifySecureSignConstants() != 0) {
        return -1;
    }
    return 0;
}

// Helper function: Verify basic tag constants
static int VerifyBasicTagConstants()
{
    if (((uint32_t)OH_HUKS_TAG_ALGORITHM != (OH_HUKS_TAG_TYPE_UINT | TAG_ALGORITHM_ID)) ||
        ((uint32_t)OH_HUKS_TAG_PURPOSE != (OH_HUKS_TAG_TYPE_UINT | TAG_PURPOSE_ID)) ||
        ((uint32_t)OH_HUKS_TAG_KEY_SIZE != (OH_HUKS_TAG_TYPE_UINT | TAG_KEY_SIZE_ID)) ||
        ((uint32_t)OH_HUKS_TAG_DIGEST != (OH_HUKS_TAG_TYPE_UINT | TAG_DIGEST_ID)) ||
        ((uint32_t)OH_HUKS_TAG_PADDING != (OH_HUKS_TAG_TYPE_UINT | TAG_PADDING_ID)) ||
        ((uint32_t)OH_HUKS_TAG_BLOCK_MODE != (OH_HUKS_TAG_TYPE_UINT | TAG_BLOCK_MODE_ID)) ||
        ((uint32_t)OH_HUKS_TAG_KEY_TYPE != (OH_HUKS_TAG_TYPE_UINT | TAG_KEY_TYPE_ID))) {
        return -1;
    }
    return 0;
}

// Helper function: Verify data tag constants
static int VerifyDataTagConstants()
{
    if (((uint32_t)OH_HUKS_TAG_ASSOCIATED_DATA != (OH_HUKS_TAG_TYPE_BYTES | TAG_ASSOCIATED_DATA_ID)) ||
        ((uint32_t)OH_HUKS_TAG_NONCE != (OH_HUKS_TAG_TYPE_BYTES | TAG_NONCE_ID)) ||
        ((uint32_t)OH_HUKS_TAG_IV != (OH_HUKS_TAG_TYPE_BYTES | TAG_IV_ID)) ||
        ((uint32_t)OH_HUKS_TAG_INFO != (OH_HUKS_TAG_TYPE_BYTES | TAG_INFO_ID)) ||
        ((uint32_t)OH_HUKS_TAG_SALT != (OH_HUKS_TAG_TYPE_BYTES | TAG_SALT_ID)) ||
        ((uint32_t)OH_HUKS_TAG_ITERATION != (OH_HUKS_TAG_TYPE_UINT | TAG_ITERATION_ID))) {
        return -1;
    }
    return 0;
}

// Helper function: Verify key agreement tag constants
static int VerifyKeyAgreementTagConstants()
{
    if (((uint32_t)OH_HUKS_TAG_KEY_GENERATE_TYPE != (OH_HUKS_TAG_TYPE_UINT | TAG_KEY_GENERATE_TYPE_ID)) ||
        ((uint32_t)OH_HUKS_TAG_AGREE_ALG != (OH_HUKS_TAG_TYPE_UINT | TAG_AGREE_ALG_ID)) ||
        ((uint32_t)OH_HUKS_TAG_AGREE_PUBLIC_KEY_IS_KEY_ALIAS !=
         (OH_HUKS_TAG_TYPE_BOOL | TAG_AGREE_PUBLIC_KEY_IS_KEY_ALIAS_ID)) ||
        ((uint32_t)OH_HUKS_TAG_AGREE_PRIVATE_KEY_ALIAS != (OH_HUKS_TAG_TYPE_BYTES | TAG_AGREE_PRIVATE_KEY_ALIAS_ID)) ||
        ((uint32_t)OH_HUKS_TAG_AGREE_PUBLIC_KEY != (OH_HUKS_TAG_TYPE_BYTES | TAG_AGREE_PUBLIC_KEY_ID)) ||
        ((uint32_t)OH_HUKS_TAG_KEY_ALIAS != (OH_HUKS_TAG_TYPE_BYTES | TAG_KEY_ALIAS_ID)) ||
        ((uint32_t)OH_HUKS_TAG_DERIVE_KEY_SIZE != (OH_HUKS_TAG_TYPE_UINT | TAG_DERIVE_KEY_SIZE_ID)) ||
        ((uint32_t)OH_HUKS_TAG_IMPORT_KEY_TYPE != (OH_HUKS_TAG_TYPE_UINT | TAG_IMPORT_KEY_TYPE_ID)) ||
        ((uint32_t)OH_HUKS_TAG_UNWRAP_ALGORITHM_SUITE != (OH_HUKS_TAG_TYPE_UINT | TAG_UNWRAP_ALGORITHM_SUITE_ID))) {
        return -1;
    }
    return 0;
}

// Helper function: Verify authentication tag constants
static int VerifyAuthTagConstants()
{
    if (((uint32_t)OH_HUKS_TAG_ALL_USERS != (OH_HUKS_TAG_TYPE_BOOL | TAG_ALL_USERS_ID)) ||
        ((uint32_t)OH_HUKS_TAG_USER_ID != (OH_HUKS_TAG_TYPE_UINT | TAG_USER_ID_ID)) ||
        ((uint32_t)OH_HUKS_TAG_NO_AUTH_REQUIRED != (OH_HUKS_TAG_TYPE_BOOL | TAG_NO_AUTH_REQUIRED_ID)) ||
        ((uint32_t)OH_HUKS_TAG_USER_AUTH_TYPE != (OH_HUKS_TAG_TYPE_UINT | TAG_USER_AUTH_TYPE_ID)) ||
        ((uint32_t)OH_HUKS_TAG_AUTH_TIMEOUT != (OH_HUKS_TAG_TYPE_UINT | TAG_AUTH_TIMEOUT_ID)) ||
        ((uint32_t)OH_HUKS_TAG_AUTH_TOKEN != (OH_HUKS_TAG_TYPE_BYTES | TAG_AUTH_TOKEN_ID)) ||
        ((uint32_t)OH_HUKS_TAG_KEY_AUTH_ACCESS_TYPE != (OH_HUKS_TAG_TYPE_UINT | TAG_KEY_AUTH_ACCESS_TYPE_ID)) ||
        ((uint32_t)OH_HUKS_TAG_KEY_SECURE_SIGN_TYPE != (OH_HUKS_TAG_TYPE_UINT | TAG_KEY_SECURE_SIGN_TYPE_ID))) {
        return -1;
    }
    return 0;
}

// Helper function: Verify attestation tag constants
static int VerifyAttestationTagConstants()
{
    if (((uint32_t)OH_HUKS_TAG_CHALLENGE_TYPE != (OH_HUKS_TAG_TYPE_UINT | TAG_CHALLENGE_TYPE_ID)) ||
        ((uint32_t)OH_HUKS_TAG_CHALLENGE_POS != (OH_HUKS_TAG_TYPE_UINT | TAG_CHALLENGE_POS_ID)) ||
        ((uint32_t)OH_HUKS_TAG_ATTESTATION_CHALLENGE != (OH_HUKS_TAG_TYPE_BYTES | TAG_ATTESTATION_CHALLENGE_ID)) ||
        ((uint32_t)OH_HUKS_TAG_ATTESTATION_APPLICATION_ID !=
         (OH_HUKS_TAG_TYPE_BYTES | TAG_ATTESTATION_APPLICATION_ID)) ||
        ((uint32_t)OH_HUKS_TAG_ATTESTATION_ID_ALIAS != (OH_HUKS_TAG_TYPE_BYTES | TAG_ATTESTATION_ID_ALIAS_ID)) ||
        ((uint32_t)OH_HUKS_TAG_ATTESTATION_ID_SEC_LEVEL_INFO !=
         (OH_HUKS_TAG_TYPE_BYTES | TAG_ATTESTATION_ID_SEC_LEVEL_INFO_ID)) ||
        ((uint32_t)OH_HUKS_TAG_ATTESTATION_ID_VERSION_INFO !=
         (OH_HUKS_TAG_TYPE_BYTES | TAG_ATTESTATION_ID_VERSION_INFO_ID))) {
        return -1;
    }
    return 0;
}

// Helper function: Verify key management tag constants
static int VerifyKeyManagementTagConstants()
{
    if (((uint32_t)OH_HUKS_TAG_IS_KEY_ALIAS != (OH_HUKS_TAG_TYPE_BOOL | TAG_IS_KEY_ALIAS_ID)) ||
        ((uint32_t)OH_HUKS_TAG_KEY_STORAGE_FLAG != (OH_HUKS_TAG_TYPE_UINT | TAG_KEY_STORAGE_FLAG_ID)) ||
        ((uint32_t)OH_HUKS_TAG_IS_ALLOWED_WRAP != (OH_HUKS_TAG_TYPE_BOOL | TAG_IS_ALLOWED_WRAP_ID)) ||
        ((uint32_t)OH_HUKS_TAG_KEY_WRAP_TYPE != (OH_HUKS_TAG_TYPE_UINT | TAG_KEY_WRAP_TYPE_ID)) ||
        ((uint32_t)OH_HUKS_TAG_KEY_AUTH_ID != (OH_HUKS_TAG_TYPE_BYTES | TAG_KEY_AUTH_ID_ID)) ||
        ((uint32_t)OH_HUKS_TAG_KEY_ROLE != (OH_HUKS_TAG_TYPE_UINT | TAG_KEY_ROLE_ID)) ||
        ((uint32_t)OH_HUKS_TAG_KEY_FLAG != (OH_HUKS_TAG_TYPE_UINT | TAG_KEY_FLAG_ID)) ||
        ((uint32_t)OH_HUKS_TAG_IS_ASYNCHRONIZED != (OH_HUKS_TAG_TYPE_UINT | TAG_IS_ASYNCHRONIZED_ID)) ||
        ((uint32_t)OH_HUKS_TAG_KEY_DOMAIN != (OH_HUKS_TAG_TYPE_UINT | TAG_KEY_DOMAIN_ID)) ||
        ((uint32_t)OH_HUKS_TAG_SYMMETRIC_KEY_DATA != (OH_HUKS_TAG_TYPE_BYTES | TAG_SYMMETRIC_KEY_DATA_ID)) ||
        ((uint32_t)OH_HUKS_TAG_ASYMMETRIC_PUBLIC_KEY_DATA !=
         (OH_HUKS_TAG_TYPE_BYTES | TAG_ASYMMETRIC_PUBLIC_KEY_DATA_ID)) ||
        ((uint32_t)OH_HUKS_TAG_ASYMMETRIC_PRIVATE_KEY_DATA !=
         (OH_HUKS_TAG_TYPE_BYTES | TAG_ASYMMETRIC_PRIVATE_KEY_DATA_ID))) {
        return -1;
    }
    return 0;
}

// Helper function: Verify tag constants
static int VerifyTagConstants()
{
    if (VerifyBasicTagConstants() != 0) {
        return -1;
    }
    if (VerifyDataTagConstants() != 0) {
        return -1;
    }
    if (VerifyKeyAgreementTagConstants() != 0) {
        return -1;
    }
    if (VerifyAuthTagConstants() != 0) {
        return -1;
    }
    if (VerifyAttestationTagConstants() != 0) {
        return -1;
    }
    if (VerifyKeyManagementTagConstants() != 0) {
        return -1;
    }
    return 0;
}

// Inline helper: Check if a field has uint32_t size
// Returns true if the field size matches uint32_t, false otherwise
// This is a standard type validation pattern used in C/C++ for runtime size checks
inline bool IsUint32Type(size_t fieldSize)
{
    return fieldSize == sizeof(uint32_t);
}

// Helper function: Verify basic struct field sizes
static int VerifyBasicStructSizes()
{
    struct OH_Huks_Result result;
    struct OH_Huks_Blob blob;

    if ((sizeof(result.errorCode) != sizeof(int32_t)) || (sizeof(result.errorMsg) != sizeof(const char*)) ||
        (sizeof(result.data) != sizeof(uint8_t*)) || !IsUint32Type(sizeof(blob.size)) ||
        (sizeof(blob.data) != sizeof(uint8_t*))) {
        return -1;
    }
    return 0;
}

// Helper function: Verify param struct field sizes
static int VerifyParamStructSizes()
{
    struct OH_Huks_Param param;
    struct OH_Huks_ParamSet paramset;

    if (!IsUint32Type(sizeof(param.tag)) || (sizeof(param.boolParam) != sizeof(bool)) ||
        (sizeof(param.int32Param) != sizeof(int32_t)) || !IsUint32Type(sizeof(param.uint32Param)) ||
        (sizeof(param.uint64Param) != sizeof(uint64_t)) || (sizeof(param.blob) != sizeof(struct OH_Huks_Blob)) ||
        !IsUint32Type(sizeof(paramset.paramSetSize)) || !IsUint32Type(sizeof(paramset.paramsCnt)) ||
        (sizeof(paramset.params[0]) != sizeof(struct OH_Huks_Param))) {
        return -1;
    }
    return 0;
}

// Helper function: Verify certificate and key info struct field sizes
static int VerifyCertAndKeyInfoSizes()
{
    struct OH_Huks_CertChain certChain;
    struct OH_Huks_KeyInfo keyInfo;
    struct OH_Huks_PubKeyInfo pubKeyInfo;

    if ((sizeof(certChain.certs) != sizeof(struct OH_Huks_Blob*)) || !IsUint32Type(sizeof(certChain.certsCount)) ||
        (sizeof(keyInfo.alias) != sizeof(struct OH_Huks_Blob)) ||
        (sizeof(keyInfo.paramSet) != sizeof(struct OH_Huks_ParamSet*)) ||
        (sizeof(pubKeyInfo.keyAlg) != sizeof(OH_Huks_KeyAlg)) || !IsUint32Type(sizeof(pubKeyInfo.keySize)) ||
        !IsUint32Type(sizeof(pubKeyInfo.nOrXSize)) || !IsUint32Type(sizeof(pubKeyInfo.eOrYSize)) ||
        !IsUint32Type(sizeof(pubKeyInfo.placeHolder))) {
        return -1;
    }
    return 0;
}

// Helper function: Verify RSA and ECC key material struct field sizes
static int VerifyRsaAndEccMaterialSizes()
{
    struct OH_Huks_KeyMaterialRsa keyMaterialRsa;
    struct OH_Huks_KeyMaterialEcc keyMaterialEcc;

    if ((sizeof(keyMaterialRsa.keyAlg) != sizeof(OH_Huks_KeyAlg)) || !IsUint32Type(sizeof(keyMaterialRsa.keySize)) ||
        !IsUint32Type(sizeof(keyMaterialRsa.nSize)) || !IsUint32Type(sizeof(keyMaterialRsa.eSize)) ||
        !IsUint32Type(sizeof(keyMaterialRsa.dSize)) || (sizeof(keyMaterialEcc.keyAlg) != sizeof(OH_Huks_KeyAlg)) ||
        !IsUint32Type(sizeof(keyMaterialEcc.keySize)) || !IsUint32Type(sizeof(keyMaterialEcc.xSize)) ||
        !IsUint32Type(sizeof(keyMaterialEcc.ySize)) || !IsUint32Type(sizeof(keyMaterialEcc.zSize))) {
        return -1;
    }
    return 0;
}

// Helper function: Verify DSA (Digital Signature Algorithm) key material field sizes
// Verifies that each field in OH_Huks_KeyMaterialDsa has the correct size
// Returns 0 on success, -1 if any field size is incorrect
static int VerifyDsaMaterialSizes(const struct OH_Huks_KeyMaterialDsa* keyMaterial)
{
    // Verify algorithm type field
    if (sizeof(keyMaterial->keyAlg) != sizeof(OH_Huks_KeyAlg)) {
        return -1;
    }

    // Verify key size field
    if (!IsUint32Type(sizeof(keyMaterial->keySize))) {
        return -1;
    }

    // Verify DSA parameter sizes: private exponent (x), public key (y)
    if (!IsUint32Type(sizeof(keyMaterial->xSize)) || !IsUint32Type(sizeof(keyMaterial->ySize))) {
        return -1;
    }
    
    // Verify DSA domain parameter: subgroup order (q)
    if (!IsUint32Type(sizeof(keyMaterial->qSize))) {
        return -1;
    }

    // Verify DSA domain parameter: generator (g)
    if (!IsUint32Type(sizeof(keyMaterial->gSize))) {
        return -1;
    }

    return 0;
}

// Helper function: Verify DH (Diffie-Hellman) key material field sizes
// Verifies that each field in OH_Huks_KeyMaterialDh has the correct size
// Returns 0 on success, -1 if any field size is incorrect
static int VerifyDhMaterialSizes(const struct OH_Huks_KeyMaterialDh* keyMaterial)
{
    // Verify algorithm type and key size fields
    if (sizeof(keyMaterial->keyAlg) != sizeof(OH_Huks_KeyAlg) || !IsUint32Type(sizeof(keyMaterial->keySize))) {
        return -1;
    }

    // Verify DH key component sizes: public key and private key
    if (!IsUint32Type(sizeof(keyMaterial->pubKeySize)) || !IsUint32Type(sizeof(keyMaterial->priKeySize))) {
        return -1;
    }

    // Verify reserved field
    if (!IsUint32Type(sizeof(keyMaterial->reserved))) {
        return -1;
    }

    return 0;
}

// Helper function: Verify X25519 (Curve25519) key material field sizes
// Verifies that each field in OH_Huks_KeyMaterial25519 has the correct size
// Returns 0 on success, -1 if any field size is incorrect
static int VerifyX25519MaterialSizes(const struct OH_Huks_KeyMaterial25519* keyMaterial)
{
    // Verify algorithm type and key size fields
    if (sizeof(keyMaterial->keyAlg) != sizeof(OH_Huks_KeyAlg) || !IsUint32Type(sizeof(keyMaterial->keySize))) {
        return -1;
    }

    // Verify X25519 key component sizes: public key and private key
    if (!IsUint32Type(sizeof(keyMaterial->pubKeySize)) || !IsUint32Type(sizeof(keyMaterial->priKeySize))) {
        return -1;
    }

    // Verify reserved field
    if (!IsUint32Type(sizeof(keyMaterial->reserved))) {
        return -1;
    }

    return 0;
}

// Helper function: Verify DSA, DH and X25519 key material struct field sizes
static int VerifyDsaDhAndX25519MaterialSizes()
{
    struct OH_Huks_KeyMaterialDsa dsaMaterial;
    struct OH_Huks_KeyMaterialDh dhMaterial;
    struct OH_Huks_KeyMaterial25519 x25519Material;

    if (VerifyDsaMaterialSizes(&dsaMaterial) != 0) {
        return -1;
    }

    if (VerifyDhMaterialSizes(&dhMaterial) != 0) {
        return -1;
    }

    if (VerifyX25519MaterialSizes(&x25519Material) != 0) {
        return -1;
    }

    return 0;
}

// Helper function: Verify struct field sizes
static int VerifyStructSizes()
{
    if (VerifyBasicStructSizes() != 0) {
        return -1;
    }
    if (VerifyParamStructSizes() != 0) {
        return -1;
    }
    if (VerifyCertAndKeyInfoSizes() != 0) {
        return -1;
    }
    if (VerifyRsaAndEccMaterialSizes() != 0) {
        return -1;
    }
    if (VerifyDsaDhAndX25519MaterialSizes() != 0) {
        return -1;
    }
    return 0;
}

// ==================== 测试函数 ====================

/**
 * @tc.name   SecurityHuksNapiMisc0100
 * @tc.number Security_HUKS_NAPI_Misc_0100
 * @tc.desc   misc test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SecurityHuksNapiMisc0100()
{
    if (VerifyDigestConstants() != 0) {
        return -1;
    }
    if (VerifyPaddingAndModeConstants() != 0) {
        return -1;
    }
    if (VerifyKeyPurposeConstants() != 0) {
        return -1;
    }
    if (VerifyKeySizeConstants() != 0) {
        return -1;
    }
    if (VerifyAlgorithmConstants() != 0) {
        return -1;
    }
    if (VerifyOtherEnumConstants() != 0) {
        return -1;
    }
    if (VerifyErrorCodeConstants() != 0) {
        return -1;
    }
    if (VerifyTagConstants() != 0) {
        return -1;
    }
    if (VerifyStructSizes() != 0) {
        return -1;
    }

    return 0;
}

} // namespace Huks
} // namespace Acts
