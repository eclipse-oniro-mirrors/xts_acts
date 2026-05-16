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

#include "include/HuksNullptrTest.h"
#include <huks/native_huks_api.h>
#include <huks/native_huks_param.h>
#include <huks/native_huks_type.h>

namespace Acts {
namespace Huks {

static struct OH_Huks_ParamSet* g_paramSetNullptr = nullptr;
static struct OH_Huks_Param* g_paramNullptr = nullptr;
static struct OH_Huks_Blob* g_blobNullptr = nullptr;
static struct OH_Huks_CertChain* g_certChainNullptr = nullptr;

// Helper function: Test parameter set operations
static int TestParamSetOperations(struct OH_Huks_ParamSet* paramSet, struct OH_Huks_Param* param)
{
    OH_Huks_Result ret = OH_Huks_AddParams(paramSet, param, 0);
    if (ret.errorCode == OH_HUKS_SUCCESS) {
        return -1;
    }

    ret = OH_Huks_BuildParamSet(&paramSet);
    if (ret.errorCode != OH_HUKS_SUCCESS) {
        return -1;
    }

    ret = OH_Huks_CopyParamSet(paramSet, 0, &paramSet);
    if (ret.errorCode == OH_HUKS_SUCCESS) {
        return -1;
    }

    ret = OH_Huks_GetParam(paramSet, 0, &param);
    if (ret.errorCode == OH_HUKS_SUCCESS) {
        return -1;
    }

    ret = OH_Huks_FreshParamSet(paramSet, 0);
    if (ret.errorCode != OH_HUKS_SUCCESS) {
        return -1;
    }

    ret = OH_Huks_IsParamSetTagValid(paramSet);
    if (ret.errorCode != OH_HUKS_SUCCESS) {
        return -1;
    }

    ret = OH_Huks_IsParamSetValid(paramSet, 0);
    if (ret.errorCode == OH_HUKS_SUCCESS) {
        return -1;
    }

    return 0;
}

// Helper function: Test parameter match and SDK operations
static int TestParamAndSdkOperations(struct OH_Huks_Blob* blob)
{
    struct OH_Huks_Param baseParam = { .tag = OH_HUKS_TAG_ALGORITHM, .uint64Param = (uint64_t)1 };
    struct OH_Huks_Param otherParam1 = { .tag = OH_HUKS_TAG_ALGORITHM, .uint64Param = (uint64_t)2 };
    OH_Huks_Result ret = OH_Huks_CheckParamMatch(&baseParam, &otherParam1);
    if (ret.errorCode == OH_HUKS_SUCCESS) {
        return -1;
    }

    ret = OH_Huks_GetSdkVersion(blob);
    if (ret.errorCode == OH_HUKS_SUCCESS) {
        return -1;
    }

    return 0;
}

// Helper function: Test key operations
static int TestKeyOperations(struct OH_Huks_Blob* blob,
    struct OH_Huks_ParamSet* paramSet,
    struct OH_Huks_CertChain* certChain)
{
    OH_Huks_Result ret = OH_Huks_GenerateKeyItem(blob, paramSet, paramSet);
    if (ret.errorCode == OH_HUKS_SUCCESS) {
        return -1;
    }

    ret = OH_Huks_ImportWrappedKeyItem(blob, blob, paramSet, blob);
    if (ret.errorCode == OH_HUKS_SUCCESS) {
        return -1;
    }

    ret = OH_Huks_ExportPublicKeyItem(blob, paramSet, blob);
    if (ret.errorCode == OH_HUKS_SUCCESS) {
        return -1;
    }

    ret = OH_Huks_DeleteKeyItem(blob, paramSet);
    if (ret.errorCode == OH_HUKS_SUCCESS) {
        return -1;
    }

    ret = OH_Huks_GetKeyItemParamSet(blob, paramSet, paramSet);
    if (ret.errorCode == OH_HUKS_SUCCESS) {
        return -1;
    }

    ret = OH_Huks_IsKeyItemExist(blob, paramSet);
    if (ret.errorCode == OH_HUKS_SUCCESS) {
        return -1;
    }

    ret = OH_Huks_AttestKeyItem(blob, paramSet, certChain);
    if (ret.errorCode == OH_HUKS_SUCCESS) {
        return -1;
    }

    return 0;
}

// Helper function: Test session operations
static int TestSessionOperations(struct OH_Huks_Blob* blob, struct OH_Huks_ParamSet* paramSet)
{
    OH_Huks_Result ret = OH_Huks_InitSession(blob, paramSet, blob, blob);
    if (ret.errorCode == OH_HUKS_SUCCESS) {
        return -1;
    }

    ret = OH_Huks_UpdateSession(blob, paramSet, blob, blob);
    if (ret.errorCode == OH_HUKS_SUCCESS) {
        return -1;
    }

    ret = OH_Huks_FinishSession(blob, paramSet, blob, blob);
    if (ret.errorCode == OH_HUKS_SUCCESS) {
        return -1;
    }

    ret = OH_Huks_AbortSession(blob, paramSet);
    if (ret.errorCode == OH_HUKS_SUCCESS) {
        return -1;
    }

    return 0;
}

/**
 * @tc.name   SecurityHuksNapiNullptr0100
 * @tc.number Security_HUKS_NAPI_nullptr_0100
 * @tc.desc   use nullptr
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SecurityHuksNapiNullptr0100()
{
    OH_Huks_Result ret = OH_Huks_InitParamSet(&g_paramSetNullptr);
    if (ret.errorCode != OH_HUKS_SUCCESS) {
        return -1;
    }

    // 测试参数集操作
    if (TestParamSetOperations(g_paramSetNullptr, g_paramNullptr) != 0) {
        return -1;
    }

    // 测试参数匹配和SDK操作
    if (TestParamAndSdkOperations(g_blobNullptr) != 0) {
        return -1;
    }

    // 测试密钥操作
    if (TestKeyOperations(g_blobNullptr, g_paramSetNullptr, g_certChainNullptr) != 0) {
        return -1;
    }

    // 测试会话操作
    if (TestSessionOperations(g_blobNullptr, g_paramSetNullptr) != 0) {
        return -1;
    }

    return 0;
}

} // namespace Huks
} // namespace Acts
