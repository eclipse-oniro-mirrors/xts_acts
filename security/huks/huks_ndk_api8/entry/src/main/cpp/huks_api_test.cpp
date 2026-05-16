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

#include "huks_api_test.h"
#include "testcase_utils.h"
#include "huks/native_huks_api.h"
#include "huks/native_huks_type.h"
#include "huks/native_huks_param.h"
#include <cstring>

napi_value OHHuksNativeApi22Type0300(napi_env env, napi_callback_info info)
{
    int res = TEST_FAIL;
    if ((OH_HUKS_SUCCESS == 0) &&
        (OH_HUKS_ERR_CODE_PERMISSION_FAIL == 201) &&
        (OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT == 401) &&
        (OH_HUKS_ERR_CODE_NOT_SUPPORTED_API == 801) &&
        (OH_HUKS_ERR_CODE_FEATURE_NOT_SUPPORTED == 12000001) &&
        (OH_HUKS_ERR_CODE_MISSING_CRYPTO_ALG_ARGUMENT == 12000002) &&
        (OH_HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT == 12000003) &&
        (OH_HUKS_ERR_CODE_FILE_OPERATION_FAIL == 12000004) &&
        (OH_HUKS_ERR_CODE_COMMUNICATION_FAIL == 12000005) &&
        (OH_HUKS_ERR_CODE_CRYPTO_FAIL == 12000006) &&
        (OH_HUKS_ERR_CODE_KEY_AUTH_PERMANENTLY_INVALIDATED == 12000007) &&
        (OH_HUKS_ERR_CODE_KEY_AUTH_VERIFY_FAILED == 12000008) &&
        (OH_HUKS_ERR_CODE_KEY_AUTH_TIME_OUT == 12000009) &&
        (OH_HUKS_ERR_CODE_SESSION_LIMIT == 12000010) &&
        (OH_HUKS_ERR_CODE_ITEM_NOT_EXIST == 12000011) &&
        (OH_HUKS_ERR_CODE_INTERNAL_ERROR == 12000012) &&
        (OH_HUKS_ERR_CODE_CREDENTIAL_NOT_EXIST == 12000013) &&
        (OH_HUKS_ERR_CODE_INSUFFICIENT_MEMORY == 12000014) &&
        (OH_HUKS_ERR_CODE_CALL_SERVICE_FAILED == 12000015) &&
        (OH_HUKS_ERR_CODE_DEVICE_PASSWORD_UNSET == 12000016) &&
        (OH_HUKS_ERR_CODE_KEY_ALREADY_EXIST == 12000017) &&
        (OH_HUKS_ERR_CODE_INVALID_ARGUMENT == 12000018) &&
        (OH_HUKS_ERR_CODE_ITEM_EXISTS == 12000019) &&
        (OH_HUKS_ERR_CODE_EXTERNAL_MODULE == 12000020) &&
        (OH_HUKS_ERR_CODE_PIN_LOCKED == 12000021) &&
        (OH_HUKS_ERR_CODE_PIN_INCORRECT == 12000022) &&
        (OH_HUKS_ERR_CODE_PIN_NO_AUTH == 12000023) &&
        (OH_HUKS_ERR_CODE_BUSY == 12000024) &&
        (OH_HUKS_ERR_CODE_EXCEED_LIMIT == 12000025)) {
        res = TEST_SUCC;
    }
    napi_value ret;
    napi_create_int32(env, res, &ret);
    return ret;
}

napi_value OHHuksNativeApi22Type0400(napi_env env, napi_callback_info info)
{
    int res = TEST_FAIL;
    if ((OH_HUKS_TAG_ALGORITHM == (OH_HUKS_TAG_TYPE_UINT | 1)) &&
        (OH_HUKS_TAG_PURPOSE == (OH_HUKS_TAG_TYPE_UINT | 2)) &&
        (OH_HUKS_TAG_KEY_SIZE == (OH_HUKS_TAG_TYPE_UINT | 3)) &&
        (OH_HUKS_TAG_DIGEST == (OH_HUKS_TAG_TYPE_UINT | 4)) &&
        (OH_HUKS_TAG_PADDING == (OH_HUKS_TAG_TYPE_UINT | 5)) &&
        (OH_HUKS_TAG_BLOCK_MODE == (OH_HUKS_TAG_TYPE_UINT | 6)) &&
        (OH_HUKS_TAG_KEY_TYPE == (OH_HUKS_TAG_TYPE_UINT | 7)) &&
        (OH_HUKS_TAG_ASSOCIATED_DATA == (OH_HUKS_TAG_TYPE_BYTES | 8)) &&
        (OH_HUKS_TAG_NONCE == (OH_HUKS_TAG_TYPE_BYTES | 9)) &&
        (OH_HUKS_TAG_IV == (OH_HUKS_TAG_TYPE_BYTES | 10)) &&
        (OH_HUKS_TAG_INFO == (OH_HUKS_TAG_TYPE_BYTES | 11)) &&
        (OH_HUKS_TAG_SALT == (OH_HUKS_TAG_TYPE_BYTES | 12)) &&
        (OH_HUKS_TAG_ITERATION == (OH_HUKS_TAG_TYPE_UINT | 14)) &&
        (OH_HUKS_TAG_KEY_GENERATE_TYPE == (OH_HUKS_TAG_TYPE_UINT | 15)) &&
        (OH_HUKS_TAG_AGREE_ALG == (OH_HUKS_TAG_TYPE_UINT | 19)) &&
        (OH_HUKS_TAG_AGREE_PUBLIC_KEY_IS_KEY_ALIAS == (OH_HUKS_TAG_TYPE_BOOL | 20)) &&
        (OH_HUKS_TAG_AGREE_PRIVATE_KEY_ALIAS == (OH_HUKS_TAG_TYPE_BYTES | 21)) &&
        (OH_HUKS_TAG_AGREE_PUBLIC_KEY == (OH_HUKS_TAG_TYPE_BYTES | 22)) &&
        (OH_HUKS_TAG_KEY_ALIAS == (OH_HUKS_TAG_TYPE_BYTES | 23)) &&
        (OH_HUKS_TAG_DERIVE_KEY_SIZE == (OH_HUKS_TAG_TYPE_UINT | 24)) &&
        (OH_HUKS_TAG_IMPORT_KEY_TYPE == (OH_HUKS_TAG_TYPE_UINT | 25)) &&
        (OH_HUKS_TAG_UNWRAP_ALGORITHM_SUITE == (OH_HUKS_TAG_TYPE_UINT | 26)) &&
        (OH_HUKS_TAG_DERIVED_AGREED_KEY_STORAGE_FLAG == (OH_HUKS_TAG_TYPE_UINT | 29)) &&
        (OH_HUKS_TAG_RSA_PSS_SALT_LEN_TYPE == (OH_HUKS_TAG_TYPE_UINT | 30)) &&
        (OH_HUKS_TAG_ALL_USERS == (OH_HUKS_TAG_TYPE_BOOL | 301)) &&
        (OH_HUKS_TAG_USER_ID == (OH_HUKS_TAG_TYPE_UINT | 302)) &&
        (OH_HUKS_TAG_NO_AUTH_REQUIRED == (OH_HUKS_TAG_TYPE_BOOL | 303)) &&
        (OH_HUKS_TAG_USER_AUTH_TYPE == (OH_HUKS_TAG_TYPE_UINT | 304)) &&
        (OH_HUKS_TAG_AUTH_TIMEOUT == (OH_HUKS_TAG_TYPE_UINT | 305)) &&
        (OH_HUKS_TAG_AUTH_TOKEN == (OH_HUKS_TAG_TYPE_BYTES | 306)) &&
        (OH_HUKS_TAG_KEY_AUTH_ACCESS_TYPE == (OH_HUKS_TAG_TYPE_UINT | 307)) &&
        (OH_HUKS_TAG_KEY_SECURE_SIGN_TYPE == (OH_HUKS_TAG_TYPE_UINT | 308)) &&
        (OH_HUKS_TAG_CHALLENGE_TYPE == (OH_HUKS_TAG_TYPE_UINT | 309)) &&
        (OH_HUKS_TAG_CHALLENGE_POS == (OH_HUKS_TAG_TYPE_UINT | 310)) &&
        (OH_HUKS_TAG_KEY_AUTH_PURPOSE == (OH_HUKS_TAG_TYPE_UINT | 311)) &&
        (OH_HUKS_TAG_AUTH_STORAGE_LEVEL == (OH_HUKS_TAG_TYPE_UINT | 316)) &&
        (OH_HUKS_TAG_USER_AUTH_MODE == (OH_HUKS_TAG_TYPE_UINT | 319)) &&
        (OH_HUKS_TAG_ATTESTATION_CHALLENGE == (OH_HUKS_TAG_TYPE_BYTES | 501)) &&
        (OH_HUKS_TAG_ATTESTATION_APPLICATION_ID == (OH_HUKS_TAG_TYPE_BYTES | 502)) &&
        (OH_HUKS_TAG_ATTESTATION_ID_ALIAS == (OH_HUKS_TAG_TYPE_BYTES | 511)) &&
        (OH_HUKS_TAG_ATTESTATION_ID_SEC_LEVEL_INFO == (OH_HUKS_TAG_TYPE_BYTES | 514)) &&
        (OH_HUKS_TAG_ATTESTATION_ID_VERSION_INFO == (OH_HUKS_TAG_TYPE_BYTES | 515)) &&
        (OH_HUKS_TAG_KEY_OVERRIDE == (OH_HUKS_TAG_TYPE_BOOL | 520)) &&
        (OH_HUKS_TAG_AE_TAG_LEN == (OH_HUKS_TAG_TYPE_UINT | 521)) &&
        (OH_HUKS_TAG_KEY_CLASS == (OH_HUKS_TAG_TYPE_UINT | 522)) &&
        (OH_HUKS_TAG_KEY_ACCESS_GROUP == (OH_HUKS_TAG_TYPE_BYTES | 523)) &&
        (OH_HUKS_TAG_IS_KEY_ALIAS == (OH_HUKS_TAG_TYPE_BOOL | 1001)) &&
        (OH_HUKS_TAG_KEY_STORAGE_FLAG == (OH_HUKS_TAG_TYPE_UINT | 1002)) &&
        (OH_HUKS_TAG_IS_ALLOWED_WRAP == (OH_HUKS_TAG_TYPE_BOOL | 1003)) &&
        (OH_HUKS_TAG_KEY_WRAP_TYPE == (OH_HUKS_TAG_TYPE_UINT | 1004)) &&
        (OH_HUKS_TAG_KEY_AUTH_ID == (OH_HUKS_TAG_TYPE_BYTES | 1005)) &&
        (OH_HUKS_TAG_KEY_ROLE == (OH_HUKS_TAG_TYPE_UINT | 1006)) &&
        (OH_HUKS_TAG_KEY_FLAG == (OH_HUKS_TAG_TYPE_UINT | 1007)) &&
        (OH_HUKS_TAG_IS_ASYNCHRONIZED == (OH_HUKS_TAG_TYPE_UINT | 1008)) &&
        (OH_HUKS_TAG_KEY_DOMAIN == (OH_HUKS_TAG_TYPE_UINT | 1011)) &&
        (OH_HUKS_TAG_IS_DEVICE_PASSWORD_SET == (OH_HUKS_TAG_TYPE_BOOL | 1012)) &&
        (OH_HUKS_TAG_AE_TAG == (OH_HUKS_TAG_TYPE_BYTES | 10009)) &&
        (OH_HUKS_TAG_SYMMETRIC_KEY_DATA == (OH_HUKS_TAG_TYPE_BYTES | 20001)) &&
        (OH_HUKS_TAG_ASYMMETRIC_PUBLIC_KEY_DATA == (OH_HUKS_TAG_TYPE_BYTES | 20002)) &&
        (OH_HUKS_TAG_ASYMMETRIC_PRIVATE_KEY_DATA == (OH_HUKS_TAG_TYPE_BYTES | 20003))) {
        res = TEST_SUCC;
    }
    napi_value ret;
    napi_create_int32(env, res, &ret);
    return ret;
}

napi_value OHHuksNativeApi22Type0500(napi_env env, napi_callback_info info)
{
    int res = TEST_FAIL;
    if ((OH_HUKS_KEY_CLASS_DEFAULT == 0) && (OH_HUKS_KEY_CLASS_EXTENSION == 1)) {
        res = TEST_SUCC;
    }
    napi_value ret;
    napi_create_int32(env, res, &ret);
    return ret;
}

napi_value OHHuksNativeApi22Type0600(napi_env env, napi_callback_info info)
{
    int res = TEST_FAIL;
    if ((OH_HUKS_UNWRAP_SUITE_X25519_AES_256_GCM_NOPADDING == 1) && 
        (OH_HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING == 2) && 
        (OH_HUKS_UNWRAP_SUITE_SM2_SM4_ECB_NOPADDING == 5)) {
        res = TEST_SUCC;
    }
    napi_value ret;
    napi_create_int32(env, res, &ret);
    return ret;
}