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

#ifndef HUKS_THREE_STAGE_TEST_COMMON_H
#define HUKS_THREE_STAGE_TEST_COMMON_H

#include <securec.h>

#include "native_huks_api.h"
#include "native_huks_param.h"
#include "native_huks_type.h"
#include "huks_mem.h"
#include <openssl/err.h>
#include <openssl/evp.h>
#include <stdbool.h>
#include <stddef.h>
#include "hks_api.h"

#define HKS_DIGEST_MD5_LEN 16
#define HKS_DIGEST_SHA1_LEN 20
#define HKS_DIGEST_SHA224_LEN 28
#define HKS_DIGEST_SHA256_LEN 32
#define HKS_DIGEST_SHA384_LEN 48
#define HKS_DIGEST_SHA512_LEN 64
#define HKS_DIGEST_SM3_LEN 32

#ifdef __cplusplus
extern "C"
{
#endif

    static const uint32_t TIMES = 4;
    static const uint32_t MAX_UPDATE_SIZE = 64;
    static const uint32_t MAX_OUTDATA_SIZE = MAX_UPDATE_SIZE * TIMES;

    OH_Huks_Result InitParamSet(
        struct OH_Huks_ParamSet **paramSet,
        const struct OH_Huks_Param *params,
        uint32_t paramcount);

    OH_Huks_Result HksTestUpdate(
        const struct OH_Huks_Blob *handle,
        const struct OH_Huks_ParamSet *paramSet,
        const struct OH_Huks_Blob *inData);

    OH_Huks_Result TestUpdateLoopFinish(
        const struct OH_Huks_Blob *handle,
        const struct OH_Huks_ParamSet *paramSet,
        const struct OH_Huks_Blob *inData,
        struct OH_Huks_Blob *outData);

    OH_Huks_Result TestUpdateFinish(
        const struct OH_Huks_Blob *handle,
        const struct OH_Huks_ParamSet *paramSet,
        uint32_t purpose,
        const struct OH_Huks_Blob *inData,
        struct OH_Huks_Blob *outData);

    OH_Huks_Result MallocAndCheckBlobData(
        struct OH_Huks_Blob *blob,
        const uint32_t blobSize);

    OH_Huks_Result TestCmpKeyAliasHash(
        const struct OH_Huks_Blob *srcData1,
        const struct OH_Huks_Blob *srcData2);

    OH_Huks_Result HuksEncrypt(
        const struct OH_Huks_Blob *key,
        const struct OH_Huks_ParamSet *paramSet,
        const struct OH_Huks_Blob *plainText,
        struct OH_Huks_Blob *cipherText);

    OH_Huks_Result HuksHash(
        const struct OH_Huks_ParamSet *paramSet,
        const struct OH_Huks_Blob *srcData,
        struct OH_Huks_Blob *hash);

    OH_Huks_Result HuksAgreeKey(
        const struct OH_Huks_ParamSet *paramSet,
        const struct OH_Huks_Blob *keyAlias,
        const struct OH_Huks_Blob *peerPublicKey,
        struct OH_Huks_Blob *agreedKey);
    bool checkUseSoftware();
#ifdef __cplusplus
}
#endif

#endif // HUKS_THREE_STAGE_TEST_COMMON_H