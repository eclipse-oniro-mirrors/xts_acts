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

#include "include/HuksSignVerifyEd25519Test.h"
#include <cstring>
#include <huks/native_huks_api.h>
#include <huks/native_huks_param.h>
#include <huks/native_huks_type.h>
#include <string>

namespace Acts {
namespace Huks {

static const std::string TMP_IN_DATA =
    "OH_HUKS_ED25519_Sign_Verify_Test_000000000000000000000000000000000000000000000000000"
    "00000000000000000000000000000000000000000000000000000000000000000000000000000000"
    "0000000000000000000000000000000000000000000000000000000000000000000000000_string";
static const struct OH_Huks_Blob IN_DATA = { static_cast<uint32_t>(TMP_IN_DATA.length()),
                                             (uint8_t*)TMP_IN_DATA.c_str() };

static const uint32_t ED25519_COMMON_SIZE = 1024;

static struct OH_Huks_Param g_genParamsTest001[] = {
    { .tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_ED25519 },
    { .tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_SIGN | OH_HUKS_KEY_PURPOSE_VERIFY },
    { .tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_CURVE25519_KEY_SIZE_256 },
    { .tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA1 },
    { .tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE }
};

static struct OH_Huks_Param g_signParamsTest001[] = {
    { .tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_ED25519 },
    { .tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_SIGN },
    { .tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_CURVE25519_KEY_SIZE_256 },
    { .tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA1 },
    { .tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE }
};

static struct OH_Huks_Param g_verifyParamsTest001[] = {
    { .tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_ED25519 },
    { .tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_VERIFY },
    { .tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_CURVE25519_KEY_SIZE_256 },
    { .tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA1 },
    { .tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE }
};

static OH_Huks_Result InitParamSet(struct OH_Huks_ParamSet** paramSet,
                                   const struct OH_Huks_Param* params,
                                   uint32_t paramcount)
{
    OH_Huks_Result ret = OH_Huks_InitParamSet(paramSet);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    ret = OH_Huks_AddParams(*paramSet, params, paramcount);
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

static OH_Huks_Result TestUpdateFinish(const struct OH_Huks_Blob* handle,
                                       const struct OH_Huks_ParamSet* paramSet,
                                       uint32_t purpose,
                                       const struct OH_Huks_Blob* inData,
                                       struct OH_Huks_Blob* outData)
{
    struct OH_Huks_Blob outDataUpdate = { 0, nullptr };
    OH_Huks_Result ret = OH_Huks_UpdateSession(handle, paramSet, inData, &outDataUpdate);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    struct OH_Huks_Blob inDataFinish = { 0, nullptr };
    if (purpose == OH_HUKS_KEY_PURPOSE_VERIFY) {
        ret = OH_Huks_FinishSession(handle, paramSet, outData, &inDataFinish);
    } else {
        ret = OH_Huks_FinishSession(handle, paramSet, &inDataFinish, outData);
    }

    return ret;
}

static OH_Huks_Result HksTestSignVerify(struct OH_Huks_Blob* keyAlias,
                                        struct OH_Huks_ParamSet* paramSet,
                                        const struct OH_Huks_Blob* inData,
                                        struct OH_Huks_Blob* outData,
                                        bool isSign)
{
    uint8_t tmpHandle[sizeof(uint64_t)] = { 0 };
    struct OH_Huks_Blob handle = { sizeof(uint64_t), tmpHandle };
    OH_Huks_Result ret = OH_Huks_InitSession(keyAlias, paramSet, &handle, nullptr);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    struct OH_Huks_Param* tmpParam = nullptr;
    ret = OH_Huks_GetParam(paramSet, OH_HUKS_TAG_PURPOSE, &tmpParam);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    ret = TestUpdateFinish(&handle, paramSet, tmpParam->uint32Param, inData, outData);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    return ret;
}

static void HksTestFreeParamSet(struct OH_Huks_ParamSet* paramSet1,
                                struct OH_Huks_ParamSet* paramSet2,
                                struct OH_Huks_ParamSet* paramSet3)
{
    OH_Huks_FreeParamSet(&paramSet1);
    OH_Huks_FreeParamSet(&paramSet2);
    OH_Huks_FreeParamSet(&paramSet3);
}

struct Ed25519ParamSets {
    struct OH_Huks_ParamSet* genParamSet;
    struct OH_Huks_ParamSet* signParamSet;
    struct OH_Huks_ParamSet* verifyParamSet;
};

static OH_Huks_Result InitEd25519ParamSets(struct Ed25519ParamSets* paramSets)
{
    OH_Huks_Result ret =
        InitParamSet(&paramSets->genParamSet, g_genParamsTest001, sizeof(g_genParamsTest001) / sizeof(OH_Huks_Param));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    ret = InitParamSet(&paramSets->signParamSet, g_signParamsTest001,
                       sizeof(g_signParamsTest001) / sizeof(OH_Huks_Param));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&paramSets->genParamSet);
        return ret;
    }

    ret = InitParamSet(&paramSets->verifyParamSet, g_verifyParamsTest001,
                       sizeof(g_verifyParamsTest001) / sizeof(OH_Huks_Param));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&paramSets->genParamSet);
        OH_Huks_FreeParamSet(&paramSets->signParamSet);
        return ret;
    }

    return ret;
}

static OH_Huks_Result PerformSignOperation(const struct OH_Huks_Blob* keyAlias,
                                           struct OH_Huks_ParamSet* signParamSet,
                                           struct OH_Huks_Blob* outDataSign)
{
    return HksTestSignVerify(const_cast<struct OH_Huks_Blob*>(keyAlias), signParamSet, &IN_DATA, outDataSign, true);
}

static OH_Huks_Result ExportAndImportPublicKey(const struct OH_Huks_Blob* keyAlias,
                                               struct OH_Huks_ParamSet* genParamSet,
                                               struct OH_Huks_ParamSet* verifyParamSet,
                                               struct OH_Huks_Blob* newKeyAlias)
{
    uint8_t pubKey[OH_HUKS_CURVE25519_KEY_SIZE_256] = { 0 };
    struct OH_Huks_Blob publicKey = { OH_HUKS_CURVE25519_KEY_SIZE_256, pubKey };
    OH_Huks_Result ret = OH_Huks_ExportPublicKeyItem(keyAlias, genParamSet, &publicKey);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    return OH_Huks_ImportKeyItem(newKeyAlias, verifyParamSet, &publicKey);
}

/**
 * @tc.name   SecurityHuksNapiSignVerifyEd255190100
 * @tc.number Security_HUKS_NAPI_SignVerify_ED25519_0100
 * @tc.desc   alg-ED25519 pur-Sign.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SecurityHuksNapiSignVerifyEd255190100()
{
    const char* keyAliasString = "HksED25519SignVerifyKeyAliasTest001";
    struct Ed25519ParamSets paramSets = { nullptr, nullptr, nullptr };

    OH_Huks_Result ret = InitEd25519ParamSets(&paramSets);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return -1;
    }

    struct OH_Huks_Blob keyAlias = { static_cast<uint32_t>(strlen(keyAliasString)), (uint8_t*)keyAliasString };
    ret = OH_Huks_GenerateKeyItem(&keyAlias, paramSets.genParamSet, nullptr);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        HksTestFreeParamSet(paramSets.genParamSet, paramSets.signParamSet, paramSets.verifyParamSet);
        return -1;
    }

    uint8_t outDataS[ED25519_COMMON_SIZE] = { 0 };
    struct OH_Huks_Blob outDataSign = { ED25519_COMMON_SIZE, outDataS };
    ret = PerformSignOperation(&keyAlias, paramSets.signParamSet, &outDataSign);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_DeleteKeyItem(&keyAlias, paramSets.genParamSet);
        HksTestFreeParamSet(paramSets.genParamSet, paramSets.signParamSet, paramSets.verifyParamSet);
        return -1;
    }

    char newKey[] = "ECC_Sign_Verify_Import_KeyAlias";
    struct OH_Huks_Blob newKeyAlias = { .size = static_cast<uint32_t>(strlen(newKey)), .data = (uint8_t*)newKey };
    ret = ExportAndImportPublicKey(&keyAlias, paramSets.genParamSet, paramSets.verifyParamSet, &newKeyAlias);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_DeleteKeyItem(&keyAlias, paramSets.genParamSet);
        HksTestFreeParamSet(paramSets.genParamSet, paramSets.signParamSet, paramSets.verifyParamSet);
        return -1;
    }

    ret = HksTestSignVerify(&newKeyAlias, paramSets.verifyParamSet, &IN_DATA, &outDataSign, false);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_DeleteKeyItem(&keyAlias, paramSets.genParamSet);
        OH_Huks_DeleteKeyItem(&newKeyAlias, paramSets.verifyParamSet);
        HksTestFreeParamSet(paramSets.genParamSet, paramSets.signParamSet, paramSets.verifyParamSet);
        return -1;
    }

    OH_Huks_Result deleteRet1 = OH_Huks_DeleteKeyItem(&keyAlias, paramSets.genParamSet);
    OH_Huks_Result deleteRet2 = OH_Huks_DeleteKeyItem(&newKeyAlias, paramSets.verifyParamSet);
    HksTestFreeParamSet(paramSets.genParamSet, paramSets.signParamSet, paramSets.verifyParamSet);

    if (deleteRet1.errorCode != (int32_t)OH_HUKS_SUCCESS || deleteRet2.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return -1;
    }

    return 0;
}

} // namespace Huks
} // namespace Acts
