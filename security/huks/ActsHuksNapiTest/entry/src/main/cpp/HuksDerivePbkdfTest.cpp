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

#include "include/HuksDerivePbkdfTest.h"
#include <cstdlib>
#include <cstring>
#include <huks/native_huks_api.h>
#include <huks/native_huks_param.h>
#include <huks/native_huks_type.h>
#include <string>

namespace Acts {
namespace Huks {

// Constants and test data
static const uint32_t COMMON_SIZE = 2048;
static const uint32_t DERIVE_KEY_SIZE_32 = 32;
static const uint32_t DERIVE_ITERATION = 1000;

static const std::string IN_DATA =
    "Hks_PBKDF2_Derive_Test_000000000000000000000000000000000000000000000000000000000"
    "00000000000000000000000000000000000000000000000000000000000000000000000000000000"
    "0000000000000000000000000000000000000000000000000000000000000000000000000_string";

static uint8_t g_saltgen[16] = { 0x14, 0x10, 0x11, 0x3a, 0x27, 0x9e, 0xc8, 0x5f,
                                 0xe0, 0xf3, 0x36, 0x17, 0x57, 0x42, 0x8e, 0xff };

// Helper function: Initialize parameter set
static OH_Huks_Result InitParamSet(struct OH_Huks_ParamSet** paramSet,
    const struct OH_Huks_Param* params,
    uint32_t paramCount)
{
    OH_Huks_Result ret = OH_Huks_InitParamSet(paramSet);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    ret = OH_Huks_AddParams(*paramSet, params, paramCount);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(paramSet);
        return ret;
    }

    ret = OH_Huks_BuildParamSet(paramSet);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(paramSet);
        return ret;
    }

    return ret;
}

// Helper function: PBKDF2 Derive Test Normal Case
static OH_Huks_Result HksPbkdf2DeriveTestNormalCase(const struct OH_Huks_Blob keyAlias,
                                                    const struct OH_Huks_ParamSet* genParamSet,
                                                    struct OH_Huks_ParamSet* deriveParamSet,
                                                    struct OH_Huks_ParamSet* deriveFinalParamsSet)
{
    struct OH_Huks_Blob inData = { static_cast<uint32_t>(IN_DATA.length()), (uint8_t*)IN_DATA.c_str() };

    /* 1. Generate Key */
    OH_Huks_Result ret = OH_Huks_GenerateKeyItem(&keyAlias, genParamSet, nullptr);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    /* 2. Derive Three Stage */
    // Init
    uint8_t handleD[sizeof(uint64_t)] = { 0 };
    struct OH_Huks_Blob handleDerive = { sizeof(uint64_t), handleD };
    ret = OH_Huks_InitSession(&keyAlias, deriveParamSet, &handleDerive, nullptr);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    // Update
    uint8_t tmpOut[COMMON_SIZE] = { 0 };
    struct OH_Huks_Blob outData = { COMMON_SIZE, tmpOut };
    ret = OH_Huks_UpdateSession(&handleDerive, deriveParamSet, &inData, &outData);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    // Finish
    uint8_t outDataD[COMMON_SIZE] = { 0 };
    struct OH_Huks_Blob outDataDerive = { COMMON_SIZE, outDataD };
    ret = OH_Huks_FinishSession(&handleDerive, deriveFinalParamsSet, &inData, &outDataDerive);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    return ret;
}

// Test parameters
static struct OH_Huks_Param g_genParams001[] = {
    { .tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES },
    { .tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_DERIVE },
    { .tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA256 },
    { .tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_256 },
    { .tag = OH_HUKS_TAG_ITERATION, .uint32Param = 1000 },
    { .tag = OH_HUKS_TAG_SALT, .blob = { sizeof(g_saltgen), (uint8_t*)g_saltgen } },
    { .tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE }
};

static struct OH_Huks_Param g_pbkdf2Params001[] = {
    { .tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_PBKDF2 },
    { .tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_DERIVE },
    { .tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA256 },
    { .tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = 256 },
    { .tag = OH_HUKS_TAG_ITERATION, .int32Param = DERIVE_ITERATION },
    { .tag = OH_HUKS_TAG_SALT, .blob = { sizeof(g_saltgen), (uint8_t*)g_saltgen } },
    { .tag = OH_HUKS_TAG_DERIVE_KEY_SIZE, .uint32Param = DERIVE_KEY_SIZE_32 },
    { .tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE }
};

static struct OH_Huks_Param g_pbkdf2FinishParams001[] = {
    { .tag = OH_HUKS_TAG_KEY_STORAGE_FLAG, .uint32Param = OH_HUKS_STORAGE_PERSISTENT },
    { .tag = OH_HUKS_TAG_KEY_ALIAS,
      .blob = { static_cast<uint32_t>(strlen("HksPBKDF2DeriveKeyAliasTest001_2")),
                (uint8_t*)"HksPBKDF2DeriveKeyAliasTest001_2" } },
    { .tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES },
    { .tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = 256 },
    { .tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_DERIVE },
    { .tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA256 },
    { .tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE }
};

/**
 * @tc.name   SecurityHuksNapiDerivePbkdf0100
 * @tc.number Security_HUKS_NAPI_Derive_pbkdf_0100
 * @tc.desc   alg-PBKDF2 pur-Derive dig-SHA256.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int SecurityHuksNapiDerivePbkdf0100()
{
    struct OH_Huks_Blob keyAlias = { static_cast<uint32_t>(strlen("HksPBKDF2DeriveKeyAliasTest001_1")),
                                     (uint8_t*)"HksPBKDF2DeriveKeyAliasTest001_1" };

    /* 1. Generate Key */
    struct OH_Huks_ParamSet* genParamSet = nullptr;
    OH_Huks_Result ret = InitParamSet(&genParamSet, g_genParams001, sizeof(g_genParams001) / sizeof(OH_Huks_Param));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return -1;
    }

    /* 2. PBKDF2 Three Stage */
    struct OH_Huks_ParamSet* pbkdf2ParamSet = nullptr;
    struct OH_Huks_ParamSet* pbkdf2FinishParamSet = nullptr;
    ret = InitParamSet(&pbkdf2ParamSet, g_pbkdf2Params001, sizeof(g_pbkdf2Params001) / sizeof(OH_Huks_Param));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&genParamSet);
        return -1;
    }

    // Finish paramset
    ret = InitParamSet(
        &pbkdf2FinishParamSet, g_pbkdf2FinishParams001, sizeof(g_pbkdf2FinishParams001) / sizeof(OH_Huks_Param));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&genParamSet);
        OH_Huks_FreeParamSet(&pbkdf2ParamSet);
        return -1;
    }

    // init-update-final
    ret = HksPbkdf2DeriveTestNormalCase(keyAlias, genParamSet, pbkdf2ParamSet, pbkdf2FinishParamSet);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&genParamSet);
        OH_Huks_FreeParamSet(&pbkdf2ParamSet);
        OH_Huks_FreeParamSet(&pbkdf2FinishParamSet);
        return -1;
    }

    /* 3. Delete Key */
    ret = OH_Huks_DeleteKeyItem(&keyAlias, genParamSet);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&genParamSet);
        OH_Huks_FreeParamSet(&pbkdf2ParamSet);
        OH_Huks_FreeParamSet(&pbkdf2FinishParamSet);
        return -1;
    }

    struct OH_Huks_Blob deleteKeyAlias = { .size = static_cast<uint32_t>(strlen("HksPBKDF2DeriveKeyAliasTest001_2")),
                                           .data = (uint8_t*)"HksPBKDF2DeriveKeyAliasTest001_2" };
    ret = OH_Huks_DeleteKeyItem(&deleteKeyAlias, pbkdf2FinishParamSet);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&genParamSet);
        OH_Huks_FreeParamSet(&pbkdf2ParamSet);
        OH_Huks_FreeParamSet(&pbkdf2FinishParamSet);
        return -1;
    }

    OH_Huks_FreeParamSet(&genParamSet);
    OH_Huks_FreeParamSet(&pbkdf2ParamSet);
    OH_Huks_FreeParamSet(&pbkdf2FinishParamSet);

    return 0;
}

} // namespace Huks
} // namespace Acts
