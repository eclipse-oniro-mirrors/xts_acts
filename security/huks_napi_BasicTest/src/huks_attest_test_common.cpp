/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

#include "huks_attest_test_common.h"

#include <cstdlib>
#include <gtest/gtest.h>

using namespace testing::ext;

namespace Unittest::AttestKey {
const static uint32_t g_paramCountInKeyAttest = 4;
const static uint32_t g_paramCountInIdAttest = 7;
const static uint32_t g_index0 = 0;
const static uint32_t g_index1 = 1;
const static uint32_t g_index2 = 2;
const static uint32_t g_index3 = 3;
const static uint32_t g_index4 = 4;
const static uint32_t g_index5 = 5;
const static uint32_t g_index6 = 6;

void FreeCertChain(struct OH_Huks_CertChain **certChain, const uint32_t pos)
{
    if (certChain == nullptr || *certChain == nullptr) {
        return;
    }

    if ((*certChain)->certs == nullptr) {
        HksFree(*certChain);
        *certChain = nullptr;
        return;
    }
    for (uint32_t j = 0; j < pos; j++) {
        if ((*certChain)->certs[j].data != nullptr) {
            HksFree((*certChain)->certs[j].data);
            (*certChain)->certs[j].data = nullptr;
        }
    }

    if ((*certChain)->certs != nullptr) {
        HksFree((*certChain)->certs);
        (*certChain)->certs = nullptr;
    }

    if (*certChain != nullptr) {
        HksFree(*certChain);
        *certChain = nullptr;
    }
}

OH_Huks_Result TestGenerateKey(const struct OH_Huks_Blob *keyAlias)
{
    struct OH_Huks_Param tmpParams[] = {
        { .tag = OH_HUKS_TAG_KEY_STORAGE_FLAG, .uint32Param = OH_HUKS_STORAGE_PERSISTENT },
        { .tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_RSA },
        { .tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_RSA_KEY_SIZE_2048 },
        { .tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_VERIFY },
        { .tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA256 },
        { .tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_PSS },
        { .tag = OH_HUKS_TAG_KEY_GENERATE_TYPE, .uint32Param = OH_HUKS_KEY_GENERATE_TYPE_DEFAULT },
        { .tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_ECB },
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    OH_Huks_Result ret = OH_Huks_InitParamSet(&paramSet);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    ret = OH_Huks_AddParams(paramSet, tmpParams, sizeof(tmpParams) / sizeof(tmpParams[0]));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&paramSet);
        return ret;
    }

    ret = OH_Huks_BuildParamSet(&paramSet);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&paramSet);
        return ret;
    }

    ret = OH_Huks_GenerateKeyItem(keyAlias, paramSet, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    return ret;
}

int32_t ConstructDataToCertChain(struct OH_Huks_CertChain **certChain,
    const struct HksTestCertChain *certChainParam)
{
    if (!certChainParam->certChainExist) {
        return 0;
    }
    *certChain = (struct OH_Huks_CertChain *)HksMalloc(sizeof(struct OH_Huks_CertChain));
    if (*certChain == nullptr) {
        return OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT;
    }
    if (!certChainParam->certCountValid) {
        (*certChain)->certsCount = 0;
        (*certChain)->certs = nullptr;
        return 0;
    }
    (*certChain)->certsCount = CERT_COUNT;
    if (!certChainParam->certDataExist) {
        (*certChain)->certs = nullptr;
        return 0;
    }
    (*certChain)->certs = (struct OH_Huks_Blob *)HksMalloc(sizeof(struct OH_Huks_Blob) * ((*certChain)->certsCount));
    if ((*certChain)->certs == nullptr) {
        HksFree(*certChain);
        *certChain = nullptr;
    }
    for (uint32_t i = 0; i < (*certChain)->certsCount; i++) {
        (*certChain)->certs[i].size = certChainParam->certDataSize;
        (*certChain)->certs[i].data = (uint8_t *)HksMalloc((*certChain)->certs[i].size);
        if ((*certChain)->certs[i].data == nullptr) {
            FreeCertChain(certChain, i);
            return OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT;
        }
        memset_s((*certChain)->certs[i].data, certChainParam->certDataSize, 0, certChainParam->certDataSize);
    }
    return 0;
}

OH_Huks_Result GenerateParamSet(struct OH_Huks_ParamSet **paramSet, const struct OH_Huks_Param tmpParams[], uint32_t paramCount)
{
    OH_Huks_Result ret = OH_Huks_InitParamSet(paramSet);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    ret = OH_Huks_AddParams(*paramSet, tmpParams, paramCount);
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

static int32_t ValidataAndCompareCertInfo(ParamType type, const struct OH_Huks_CertChain *certChain,
    struct OH_Huks_ParamSet *paramSet)
{
    if (certChain == nullptr || paramSet == nullptr) {
        return OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT;
    }
    int32_t ret = HksValidateCertChain((HksCertChain *)certChain, (HksParamSet *)paramSet);
    if (ret == OH_HUKS_SUCCESS) {
        ret |= strcmp(SEC_INFO_DATA, (char *)paramSet->params[g_index0].blob.data);
        ret |= strcmp(CHALLENGE_DATA, (char *)paramSet->params[g_index1].blob.data);
        ret |= strcmp(VERSION_DATA, (char *)paramSet->params[g_index2].blob.data);
        ret |= strcmp(ALIAS, (char *)paramSet->params[g_index3].blob.data);
    }
    if (type == IDS_PARAM) {
        if (ret == OH_HUKS_SUCCESS) {
            ret |= strcmp(UDID_DATA, (char *)paramSet->params[g_index4].blob.data);
            ret |= strcmp(SN_DATA, (char *)paramSet->params[g_index5].blob.data);
            ret |= strcmp(DEVICE_ID, (char *)paramSet->params[g_index6].blob.data);
        }
    }
    return ret;
}

OH_Huks_Result ValidateCertChainTest(const struct OH_Huks_CertChain *certChain, const struct OH_Huks_Param tmpParam[], ParamType type)
{
    OH_Huks_Result ret;
    struct OH_Huks_ParamSet *paramSet = nullptr;
    do {
        ret = OH_Huks_InitParamSet(&paramSet);
        if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
            break;
        }
        uint32_t paramCount = 0;
        if (type == IDS_PARAM) {
            paramCount = g_paramCountInIdAttest;
        } else if (type == NON_IDS_PARAM) {
            paramCount = g_paramCountInKeyAttest;
        }
        ret = OH_Huks_AddParams(paramSet, tmpParam, paramCount);
        if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
            break;
        }
        ret = OH_Huks_BuildParamSet(&paramSet);
        if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
            break;
        }
        ret.errorCode = ValidataAndCompareCertInfo(type, certChain, paramSet);
    } while (0);
    OH_Huks_FreeParamSet(&paramSet);
    return ret;
}
}
