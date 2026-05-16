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

#include "include/HuksHmacTest.h"
#include <cstdlib>
#include <cstring>
#include <huks/native_huks_api.h>
#include <huks/native_huks_param.h>
#include <huks/native_huks_type.h>
#include <string>

namespace Acts {
namespace Huks {

// Constants and test data
static const uint32_t COMMON_SIZE = 256;
static const uint32_t MAX_UPDATE_SIZE = 64;
static const uint32_t MAX_OUTDATA_SIZE = MAX_UPDATE_SIZE * 4;
static const uint32_t MAX_BLOB_SIZE = 1024 * 1024; // 1MB，合理的上限

static const std::string IN_DATA =
    "Hks_HMAC_Test_000000000000000000000000000000000000000000000000000000000000000000"
    "00000000000000000000000000000000000000000000000000000000000000000000000000000000"
    "0000000000000000000000000000000000000000000000000000000000000000000000000_string";

// Helper function: Free memory
static void HksFree(void* ptr)
{
    if (ptr != nullptr) {
        free(ptr);
    }
}

// Helper function: Malloc and check blob data
static OH_Huks_Result MallocAndCheckBlobData(struct OH_Huks_Blob* blob, const uint32_t blobSize)
{
    OH_Huks_Result ret;
    ret.errorCode = OH_HUKS_SUCCESS;

    // G.MEM.01: 内存申请前，必须对申请内存大小进行合法性校验
    if (blobSize == 0 || blobSize > MAX_BLOB_SIZE) {
        ret.errorCode = OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT;
        return ret;
    }

    blob->data = (uint8_t*)malloc(blobSize);
    if (blob->data == nullptr) {
        ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
    }
    return ret;
}

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

// Helper function: Test less than max segment
static OH_Huks_Result TestLessThanMaxSeg(const struct OH_Huks_Blob* handle,
                                         const struct OH_Huks_ParamSet* paramSet,
                                         uint32_t purpose,
                                         const struct OH_Huks_Blob* inData,
                                         struct OH_Huks_Blob* outData)
{
    struct OH_Huks_Result ret;
    ret.errorCode = OH_HUKS_SUCCESS;
    struct OH_Huks_Blob tmpOutData = { .size = MAX_OUTDATA_SIZE, .data = NULL };
    if (MallocAndCheckBlobData(&tmpOutData, tmpOutData.size).errorCode != (int32_t)OH_HUKS_SUCCESS) {
        ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
        return ret;
    }
    ret = OH_Huks_UpdateSession(handle, paramSet, inData, &tmpOutData);
    HksFree(tmpOutData.data);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
        return ret;
    }
    struct OH_Huks_Blob tmpInData = { .size = 0, .data = NULL };
    if (MallocAndCheckBlobData(&tmpInData, MAX_UPDATE_SIZE).errorCode != (int32_t)OH_HUKS_SUCCESS) {
        ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
        return ret;
    }

    if (purpose == OH_HUKS_KEY_PURPOSE_VERIFY) {
        ret = OH_Huks_FinishSession(handle, paramSet, outData, &tmpInData);
    } else {
        ret = OH_Huks_FinishSession(handle, paramSet, &tmpInData, outData);
    }
    HksFree(tmpInData.data);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
        return ret;
    }
    return ret;
}

// Helper function: Process HMAC update loop
static OH_Huks_Result ProcessHmacUpdateLoop(const struct OH_Huks_Blob* handle,
                                            const struct OH_Huks_ParamSet* paramSet,
                                            struct OH_Huks_Blob* inDataSeg,
                                            uint8_t* lastPtr)
{
    struct OH_Huks_Result ret;
    ret.errorCode = OH_HUKS_SUCCESS;
    struct OH_Huks_Blob outDataSeg = { MAX_OUTDATA_SIZE, NULL };
    bool isFinished = false;

    while (inDataSeg->data <= lastPtr) {
        if (inDataSeg->data + MAX_UPDATE_SIZE <= lastPtr) {
            outDataSeg.size = MAX_OUTDATA_SIZE;
            if (MallocAndCheckBlobData(&outDataSeg, outDataSeg.size).errorCode != (int32_t)OH_HUKS_SUCCESS) {
                ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
                return ret;
            }
        } else {
            isFinished = true;
            inDataSeg->size = lastPtr - inDataSeg->data + 1;
            break;
        }
        if (OH_Huks_UpdateSession(handle, paramSet, inDataSeg, &outDataSeg).errorCode != (int32_t)OH_HUKS_SUCCESS) {
            HksFree(outDataSeg.data);
            ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
            return ret;
        }
        HksFree(outDataSeg.data);
        if ((isFinished == false) && (inDataSeg->data + MAX_UPDATE_SIZE > lastPtr)) {
            ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
            return ret;
        }
        inDataSeg->data += MAX_UPDATE_SIZE;
    }
    return ret;
}

// Helper function: Process HMAC finish session
static OH_Huks_Result ProcessHmacFinishSession(const struct OH_Huks_Blob* handle,
                                               const struct OH_Huks_ParamSet* paramSet,
                                               uint32_t purpose,
                                               const struct OH_Huks_Blob* inDataSeg,
                                               struct OH_Huks_Blob* outData)
{
    struct OH_Huks_Result ret;
    ret.errorCode = OH_HUKS_SUCCESS;

    if (purpose != OH_HUKS_KEY_PURPOSE_VERIFY) {
        if (OH_Huks_FinishSession(handle, paramSet, inDataSeg, outData).errorCode != (int32_t)OH_HUKS_SUCCESS) {
            ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
            return ret;
        }
    } else {
        uint8_t tmp[] = "temp";
        struct OH_Huks_Blob tempBlob = { sizeof(tmp), tmp };
        if (OH_Huks_UpdateSession(handle, paramSet, inDataSeg, &tempBlob).errorCode != (int32_t)OH_HUKS_SUCCESS) {
            ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
            return ret;
        }
        if (OH_Huks_FinishSession(handle, paramSet, outData, &tempBlob).errorCode != (int32_t)OH_HUKS_SUCCESS) {
            ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
            return ret;
        }
    }
    return ret;
}

// Helper function: Test Update and Finish
static OH_Huks_Result TestUpdateFinish(const struct OH_Huks_Blob* handle,
                                       const struct OH_Huks_ParamSet* paramSet,
                                       uint32_t purpose,
                                       const struct OH_Huks_Blob* inData,
                                       struct OH_Huks_Blob* outData)
{
    struct OH_Huks_Result ret;
    ret.errorCode = OH_HUKS_SUCCESS;

    struct OH_Huks_Blob inDataSeg = *inData;
    inDataSeg.size = MAX_UPDATE_SIZE;

    uint8_t* lastPtr = inData->data + inData->size - 1;

    if (inData->size <= MAX_UPDATE_SIZE) {
        return TestLessThanMaxSeg(handle, paramSet, purpose, inData, outData);
    }

    ret = ProcessHmacUpdateLoop(handle, paramSet, &inDataSeg, lastPtr);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    ret = ProcessHmacFinishSession(handle, paramSet, purpose, &inDataSeg, outData);
    return ret;
}

// Helper function: HMAC Test Case
static OH_Huks_Result HksHmacTestCase(const struct OH_Huks_Blob* keyAlias,
                                      struct OH_Huks_ParamSet* genParamSet,
                                      struct OH_Huks_ParamSet* hmacParamSet)
{
    struct OH_Huks_Blob inData = { static_cast<uint32_t>(IN_DATA.length()), (uint8_t*)IN_DATA.c_str() };

    /* 1. Generate Key */
    OH_Huks_Result ret = OH_Huks_GenerateKeyItem(keyAlias, genParamSet, nullptr);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    /* 2. HMAC Three Stage */
    // Init
    uint8_t handle[sizeof(uint64_t)] = { 0 };
    struct OH_Huks_Blob handleHMAC = { sizeof(uint64_t), handle };
    ret = OH_Huks_InitSession(keyAlias, hmacParamSet, &handleHMAC, nullptr);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_DeleteKeyItem(keyAlias, genParamSet);
        return ret;
    }

    // Update & Finish
    uint8_t out[COMMON_SIZE] = { 0 };
    struct OH_Huks_Blob outData = { COMMON_SIZE, out };
    ret = TestUpdateFinish(&handleHMAC, hmacParamSet, OH_HUKS_KEY_PURPOSE_MAC, &inData, &outData);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_DeleteKeyItem(keyAlias, genParamSet);
        return ret;
    }

    /* 3. Delete Key */
    ret = OH_Huks_DeleteKeyItem(keyAlias, genParamSet);
    return ret;
}

// Test parameters for HMAC_hmac_0100
static struct OH_Huks_Param g_genParams001[] = { { .tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_HMAC },
                                                 { .tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_MAC },
                                                 { .tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA384 },
                                                 { .tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = COMMON_SIZE },
                                                 { .tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL,
                                                   .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE } };

static struct OH_Huks_Param g_hmacParams001[] = {
    { .tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_HMAC },
    { .tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_MAC },
    { .tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA384 },
    { .tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE }
};

// Test parameters for HMAC_SM3_0100
static struct OH_Huks_Param g_genParams006[] = { { .tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_HMAC },
                                                 { .tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_MAC },
                                                 { .tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SM3 },
                                                 { .tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = COMMON_SIZE },
                                                 { .tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL,
                                                   .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE } };

static struct OH_Huks_Param g_hmacParams006[] = {
    { .tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_HMAC },
    { .tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_MAC },
    { .tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SM3 },
    { .tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE }
};

/**
 * @tc.name   SecurityHuksNapiHmacHmac0100
 * @tc.number Security_HUKS_NAPI_HMAC_hmac_0100
 * @tc.desc   alg-HMAC pur-MAC dig-SHA384.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int SecurityHuksNapiHmacHmac0100()
{
    char tmpKeyAlias[] = "HksHMACKeyAliasTest001";
    struct OH_Huks_Blob keyAlias = { static_cast<uint32_t>(strlen(tmpKeyAlias)), (uint8_t*)tmpKeyAlias };

    struct OH_Huks_ParamSet* genParamSet = nullptr;
    OH_Huks_Result ret = InitParamSet(&genParamSet, g_genParams001, sizeof(g_genParams001) / sizeof(OH_Huks_Param));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return -1;
    }

    struct OH_Huks_ParamSet* hmacParamSet = nullptr;
    ret = InitParamSet(&hmacParamSet, g_hmacParams001, sizeof(g_hmacParams001) / sizeof(OH_Huks_Param));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&genParamSet);
        return -1;
    }

    ret = HksHmacTestCase(&keyAlias, genParamSet, hmacParamSet);

    OH_Huks_FreeParamSet(&genParamSet);
    OH_Huks_FreeParamSet(&hmacParamSet);

    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return -1;
    }

    return 0;
}

/**
 * @tc.name   SecurityHuksNapiHmacSm30100
 * @tc.number Security_HUKS_NAPI_HMAC_SM3_0100
 * @tc.desc   alg-HMAC pur-MAC dig-sm3.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int SecurityHuksNapiHmacSm30100()
{
    char tmpKeyAlias[] = "HksHMACKeyAliasTest008";
    struct OH_Huks_Blob keyAlias = { static_cast<uint32_t>(strlen(tmpKeyAlias)), (uint8_t*)tmpKeyAlias };

    struct OH_Huks_ParamSet* genParamSet = nullptr;
    OH_Huks_Result ret = InitParamSet(&genParamSet, g_genParams006, sizeof(g_genParams006) / sizeof(OH_Huks_Param));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return -1;
    }

    struct OH_Huks_ParamSet* hmacParamSet = nullptr;
    ret = InitParamSet(&hmacParamSet, g_hmacParams006, sizeof(g_hmacParams006) / sizeof(OH_Huks_Param));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&genParamSet);
        return -1;
    }

    ret = HksHmacTestCase(&keyAlias, genParamSet, hmacParamSet);

    OH_Huks_FreeParamSet(&genParamSet);
    OH_Huks_FreeParamSet(&hmacParamSet);

    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return -1;
    }

    return 0;
}

} // namespace Huks
} // namespace Acts
