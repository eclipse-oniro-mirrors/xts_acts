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

#include "include/HuksAgreeX25519Test.h"
#include <cstring>
#include <huks/native_huks_api.h>
#include <huks/native_huks_param.h>
#include <huks/native_huks_type.h>
#include <string>

namespace Acts {
namespace Huks {

// Test data and constants
static const std::string IN_DATA =
    "Hks_X25519_Agree_Test_0000000000000000000000000000000000000000000000000000000000"
    "00000000000000000000000000000000000000000000000000000000000000000000000000000000"
    "0000000000000000000000000000000000000000000000000000000000000000000000000_string";
static const uint32_t X25519_COMMON_SIZE = 4096;

static struct OH_Huks_Blob g_keyAlias01001 = { static_cast<uint32_t>(strlen("HksX25519AgreeKeyAliasTest001_1")),
                                               (uint8_t*)"HksX25519AgreeKeyAliasTest001_1" };
static struct OH_Huks_Blob g_keyAlias02001 = { static_cast<uint32_t>(strlen("HksX25519AgreeKeyAliasTest001_2")),
                                               (uint8_t*)"HksX25519AgreeKeyAliasTest001_2" };
static struct OH_Huks_Blob g_keyAliasFinal1001 = { static_cast<uint32_t>(strlen("HksX25519AgreeKeyAliasTest001_final")),
                                                   (uint8_t*)"HksX25519AgreeKeyAliasTest001_final" };
static struct OH_Huks_Blob g_keyAliasFinal2001 = { static_cast<uint32_t>(strlen("HksX25519AgreeKeyAliasTest002_final")),
                                                   (uint8_t*)"HksX25519AgreeKeyAliasTest002_final" };

static struct OH_Huks_Param g_genParams001[] = {
    { .tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_X25519 },
    { .tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_AGREE },
    { .tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_CURVE25519_KEY_SIZE_256 },
    { .tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE }
};
static struct OH_Huks_Param g_agreeParams01Init001[] = {
    { .tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_X25519 },
    { .tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_AGREE },
    { .tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_CURVE25519_KEY_SIZE_256 },
    { .tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE }
};
static struct OH_Huks_Param g_agreeParams01Finish001[] = {
    { .tag = OH_HUKS_TAG_KEY_STORAGE_FLAG, .uint32Param = OH_HUKS_STORAGE_PERSISTENT },
    { .tag = OH_HUKS_TAG_IS_KEY_ALIAS, .boolParam = true },
    { .tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES },
    { .tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_256 },
    { .tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_DERIVE },
    { .tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA256 },
    { .tag = OH_HUKS_TAG_KEY_ALIAS, .blob = g_keyAliasFinal1001 },
    { .tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_NONE },
    { .tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_CBC },
    { .tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE }
};
static struct OH_Huks_Param g_agreeParams02Init001[] = {
    { .tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_X25519 },
    { .tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_AGREE },
    { .tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_CURVE25519_KEY_SIZE_256 },
    { .tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE }
};
static struct OH_Huks_Param g_agreeParams02Finish001[] = {
    { .tag = OH_HUKS_TAG_KEY_STORAGE_FLAG, .uint32Param = OH_HUKS_STORAGE_PERSISTENT },
    { .tag = OH_HUKS_TAG_IS_KEY_ALIAS, .boolParam = true },
    { .tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES },
    { .tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_256 },
    { .tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_DERIVE },
    { .tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA256 },
    { .tag = OH_HUKS_TAG_KEY_ALIAS, .blob = g_keyAliasFinal2001 },
    { .tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_NONE },
    { .tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_CBC },
    { .tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE }
};

// Helper function: Free memory for Blob
static void HksFree(uint8_t* data)
{
    if (data != nullptr) {
        free(data);
    }
}

// Helper function: Initialize ParamSet
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

// Helper function: Allocate and check Blob data
static OH_Huks_Result MallocAndCheckBlobData(struct OH_Huks_Blob* blob, const uint32_t blobSize)
{
    OH_Huks_Result ret;
    ret.errorCode = (int32_t)OH_HUKS_SUCCESS;

    // G.MEM.01: 内存申请前，必须对申请内存大小进行合法性校验
    if (blobSize == 0 || blobSize > X25519_COMMON_SIZE) {
        ret.errorCode = (int32_t)OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT;
        return ret;
    }

    blob->data = (uint8_t*)malloc(blobSize);
    if (blob->data == nullptr) {
        ret.errorCode = (int32_t)OH_HUKS_ERR_CODE_INTERNAL_ERROR;
    }
    return ret;
}

// Helper function: X25519 Agree Finish
static OH_Huks_Result HksX25519AgreeFinish(const struct OH_Huks_Blob* keyAlias,
                                           const struct OH_Huks_Blob* publicKey,
                                           const struct OH_Huks_ParamSet* initParamSet,
                                           const struct OH_Huks_ParamSet* finishParamSet,
                                           struct OH_Huks_Blob* outData)
{
    struct OH_Huks_Blob inData = { static_cast<uint32_t>(IN_DATA.length()), (uint8_t*)IN_DATA.c_str() };

    uint8_t handleU[sizeof(uint64_t)] = { 0 };
    struct OH_Huks_Blob handle = { sizeof(uint64_t), handleU };
    OH_Huks_Result ret = OH_Huks_InitSession(keyAlias, initParamSet, &handle, nullptr);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    uint8_t outDataU[X25519_COMMON_SIZE] = { 0 };
    struct OH_Huks_Blob outDataUpdate = { X25519_COMMON_SIZE, outDataU };
    ret = OH_Huks_UpdateSession(&handle, initParamSet, publicKey, &outDataUpdate);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    ret = OH_Huks_FinishSession(&handle, finishParamSet, &inData, outData);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }
    return ret;
}

// Helper function: X25519 Agree Export
static OH_Huks_Result HksX25519AgreeExport(const struct OH_Huks_Blob* keyAlias1,
                                           const struct OH_Huks_Blob* keyAlias2,
                                           struct OH_Huks_Blob* publicKey1,
                                           struct OH_Huks_Blob* publicKey2,
                                           const struct OH_Huks_ParamSet* genParamSet)
{
    OH_Huks_Result ret = OH_Huks_ExportPublicKeyItem(keyAlias1, genParamSet, publicKey1);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }
    ret = OH_Huks_ExportPublicKeyItem(keyAlias2, genParamSet, publicKey2);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }
    return ret;
}

// Helper function: Free ParamSet (5 parameters version)
static void HksX25519AgreeFreeParamSet(struct OH_Huks_ParamSet* paramSet1,
                                       struct OH_Huks_ParamSet* paramSet2,
                                       struct OH_Huks_ParamSet* paramSet3,
                                       struct OH_Huks_ParamSet* paramSet4,
                                       struct OH_Huks_ParamSet* paramSet5)
{
    if (paramSet1 != nullptr) {
        OH_Huks_FreeParamSet(&paramSet1);
    }
    if (paramSet2 != nullptr) {
        OH_Huks_FreeParamSet(&paramSet2);
    }
    if (paramSet3 != nullptr) {
        OH_Huks_FreeParamSet(&paramSet3);
    }
    if (paramSet4 != nullptr) {
        OH_Huks_FreeParamSet(&paramSet4);
    }
    if (paramSet5 != nullptr) {
        OH_Huks_FreeParamSet(&paramSet5);
    }
}

// Helper function: Free Blob (4 parameters version)
static void HksX25519AgreeFreeBlob(struct OH_Huks_Blob* blob1,
                                   struct OH_Huks_Blob* blob2,
                                   struct OH_Huks_Blob* blob3,
                                   struct OH_Huks_Blob* blob4)
{
    if (blob1 != nullptr && blob1->data != nullptr) {
        HksFree(blob1->data);
    }
    if (blob2 != nullptr && blob2->data != nullptr) {
        HksFree(blob2->data);
    }
    if (blob3 != nullptr && blob3->data != nullptr) {
        HksFree(blob3->data);
    }
    if (blob4 != nullptr && blob4->data != nullptr) {
        HksFree(blob4->data);
    }
}

// Helper function: Initialize all X25519 parameter sets
static int InitAllX25519ParamSets(struct OH_Huks_ParamSet** genParamSet,
                                  struct OH_Huks_ParamSet** initParamSet01,
                                  struct OH_Huks_ParamSet** finishParamSet01,
                                  struct OH_Huks_ParamSet** initParamSet02,
                                  struct OH_Huks_ParamSet** finishParamSet02)
{
    OH_Huks_Result ret = InitParamSet(genParamSet, g_genParams001, sizeof(g_genParams001) / sizeof(OH_Huks_Param));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        HksX25519AgreeFreeParamSet(*genParamSet, nullptr, nullptr, nullptr, nullptr);
        return -1;
    }

    ret = InitParamSet(initParamSet01, g_agreeParams01Init001, sizeof(g_agreeParams01Init001) / sizeof(OH_Huks_Param));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        HksX25519AgreeFreeParamSet(*genParamSet, *initParamSet01, nullptr, nullptr, nullptr);
        return -1;
    }

    ret = InitParamSet(
        finishParamSet01, g_agreeParams01Finish001, sizeof(g_agreeParams01Finish001) / sizeof(OH_Huks_Param));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        HksX25519AgreeFreeParamSet(*genParamSet, *initParamSet01, *finishParamSet01, nullptr, nullptr);
        return -1;
    }

    ret = InitParamSet(initParamSet02, g_agreeParams02Init001, sizeof(g_agreeParams02Init001) / sizeof(OH_Huks_Param));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        HksX25519AgreeFreeParamSet(*genParamSet, *initParamSet01, *finishParamSet01, *initParamSet02, nullptr);
        return -1;
    }

    ret = InitParamSet(
        finishParamSet02, g_agreeParams02Finish001, sizeof(g_agreeParams02Finish001) / sizeof(OH_Huks_Param));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        HksX25519AgreeFreeParamSet(
            *genParamSet, *initParamSet01, *finishParamSet01, *initParamSet02, *finishParamSet02);
        return -1;
    }

    return 0;
}

// Helper function: Generate X25519 key pairs
static int GenerateX25519KeyPairs(const struct OH_Huks_ParamSet* genParamSet)
{
    OH_Huks_Result ret = OH_Huks_GenerateKeyItem(&g_keyAlias01001, genParamSet, nullptr);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return -1;
    }

    ret = OH_Huks_GenerateKeyItem(&g_keyAlias02001, genParamSet, nullptr);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_DeleteKeyItem(&g_keyAlias01001, genParamSet);
        return -1;
    }

    return 0;
}

// Helper function: Allocate and export X25519 public keys
static int AllocateAndExportX25519PublicKeys(struct OH_Huks_Blob* publicKey01,
                                             struct OH_Huks_Blob* publicKey02,
                                             const struct OH_Huks_ParamSet* genParamSet)
{
    if (MallocAndCheckBlobData(publicKey01, publicKey01->size).errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return -1;
    }

    if (MallocAndCheckBlobData(publicKey02, publicKey02->size).errorCode != (int32_t)OH_HUKS_SUCCESS) {
        HksX25519AgreeFreeBlob(publicKey01, nullptr, nullptr, nullptr);
        return -1;
    }

    OH_Huks_Result ret =
        HksX25519AgreeExport(&g_keyAlias01001, &g_keyAlias02001, publicKey01, publicKey02, genParamSet);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        HksX25519AgreeFreeBlob(publicKey01, publicKey02, nullptr, nullptr);
        return -1;
    }

    return 0;
}

// Parameter structure for X25519 key agreement
struct X25519KeyAgreementParams {
    const struct OH_Huks_Blob* publicKey01;
    const struct OH_Huks_Blob* publicKey02;
    const struct OH_Huks_ParamSet* initParamSet01;
    const struct OH_Huks_ParamSet* finishParamSet01;
    const struct OH_Huks_ParamSet* initParamSet02;
    const struct OH_Huks_ParamSet* finishParamSet02;
    struct OH_Huks_Blob* outData01;
    struct OH_Huks_Blob* outData02;
};

// Helper function: Perform X25519 key agreement
static int PerformX25519KeyAgreement(const struct X25519KeyAgreementParams* params)
{
    if (MallocAndCheckBlobData(params->outData01, params->outData01->size).errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return -1;
    }

    if (MallocAndCheckBlobData(params->outData02, params->outData02->size).errorCode != (int32_t)OH_HUKS_SUCCESS) {
        HksX25519AgreeFreeBlob(params->outData01, nullptr, nullptr, nullptr);
        return -1;
    }

    OH_Huks_Result ret = HksX25519AgreeFinish(
        &g_keyAlias01001, params->publicKey02, params->initParamSet01, params->finishParamSet01, params->outData01);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        HksX25519AgreeFreeBlob(params->outData01, params->outData02, nullptr, nullptr);
        return -1;
    }

    ret = HksX25519AgreeFinish(
        &g_keyAlias02001, params->publicKey01, params->initParamSet02, params->finishParamSet02, params->outData02);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        HksX25519AgreeFreeBlob(params->outData01, params->outData02, nullptr, nullptr);
        return -1;
    }

    return 0;
}

// Structure to hold X25519 cleanup resources
struct X25519CleanupResources {
    struct OH_Huks_ParamSet* genParamSet;
    struct OH_Huks_ParamSet* initParamSet01;
    struct OH_Huks_ParamSet* finishParamSet01;
    struct OH_Huks_ParamSet* initParamSet02;
    struct OH_Huks_ParamSet* finishParamSet02;
    struct OH_Huks_Blob* publicKey01;
    struct OH_Huks_Blob* publicKey02;
    struct OH_Huks_Blob* outData01;
    struct OH_Huks_Blob* outData02;
};

// Helper function: Cleanup X25519 resources
static void CleanupX25519Resources(const struct X25519CleanupResources* resources)
{
    OH_Huks_DeleteKeyItem(&g_keyAlias01001, resources->genParamSet);
    OH_Huks_DeleteKeyItem(&g_keyAlias02001, resources->genParamSet);
    OH_Huks_DeleteKeyItem(&g_keyAliasFinal1001, resources->finishParamSet01);
    OH_Huks_DeleteKeyItem(&g_keyAliasFinal2001, resources->finishParamSet02);
    HksX25519AgreeFreeParamSet(resources->genParamSet,
                               resources->initParamSet01,
                               resources->finishParamSet01,
                               resources->initParamSet02,
                               resources->finishParamSet02);
    HksX25519AgreeFreeBlob(resources->publicKey01, resources->publicKey02, resources->outData01, resources->outData02);
}

/**
 * @tc.name   SecurityHuksNapiAgreeX255190100
 * @tc.number Security_HUKS_NAPI_Agree_X25519_0100
 * @tc.desc   alg-x25519, pur-AGREE
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int SecurityHuksNapiAgreeX255190100()
{
    struct OH_Huks_ParamSet* genParamSet = nullptr;
    struct OH_Huks_ParamSet* initParamSet01 = nullptr;
    struct OH_Huks_ParamSet* finishParamSet01 = nullptr;
    struct OH_Huks_ParamSet* initParamSet02 = nullptr;
    struct OH_Huks_ParamSet* finishParamSet02 = nullptr;

    // 初始化所有参数集
    if (InitAllX25519ParamSets(&genParamSet, &initParamSet01, &finishParamSet01, &initParamSet02, &finishParamSet02) !=
        0) {
        return -1;
    }

    // 生成密钥对
    if (GenerateX25519KeyPairs(genParamSet) != 0) {
        HksX25519AgreeFreeParamSet(genParamSet, initParamSet01, finishParamSet01, initParamSet02, finishParamSet02);
        return -1;
    }

    // 导出公钥
    struct OH_Huks_Blob publicKey01 = { .size = OH_HUKS_CURVE25519_KEY_SIZE_256, .data = nullptr };
    struct OH_Huks_Blob publicKey02 = { .size = OH_HUKS_CURVE25519_KEY_SIZE_256, .data = nullptr };
    if (AllocateAndExportX25519PublicKeys(&publicKey01, &publicKey02, genParamSet) != 0) {
        OH_Huks_DeleteKeyItem(&g_keyAlias01001, genParamSet);
        OH_Huks_DeleteKeyItem(&g_keyAlias02001, genParamSet);
        HksX25519AgreeFreeParamSet(genParamSet, initParamSet01, finishParamSet01, initParamSet02, finishParamSet02);
        return -1;
    }

    // 执行密钥协商
    struct OH_Huks_Blob outData01 = { .size = X25519_COMMON_SIZE, .data = nullptr };
    struct OH_Huks_Blob outData02 = { .size = X25519_COMMON_SIZE, .data = nullptr };
    struct X25519KeyAgreementParams agreementParams = { .publicKey01 = &publicKey01,
                                                        .publicKey02 = &publicKey02,
                                                        .initParamSet01 = initParamSet01,
                                                        .finishParamSet01 = finishParamSet01,
                                                        .initParamSet02 = initParamSet02,
                                                        .finishParamSet02 = finishParamSet02,
                                                        .outData01 = &outData01,
                                                        .outData02 = &outData02 };
    if (PerformX25519KeyAgreement(&agreementParams) != 0) {
        HksX25519AgreeFreeBlob(&publicKey01, &publicKey02, nullptr, nullptr);
        OH_Huks_DeleteKeyItem(&g_keyAlias01001, genParamSet);
        OH_Huks_DeleteKeyItem(&g_keyAlias02001, genParamSet);
        HksX25519AgreeFreeParamSet(genParamSet, initParamSet01, finishParamSet01, initParamSet02, finishParamSet02);
        return -1;
    }

    // 清理资源
    struct X25519CleanupResources cleanupRes = { genParamSet,    initParamSet01,   finishParamSet01,
                                                 initParamSet02, finishParamSet02, &publicKey01,
                                                 &publicKey02,   &outData01,       &outData02 };
    CleanupX25519Resources(&cleanupRes);

    return 0;
}

} // namespace Huks
} // namespace Acts
