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

#ifndef HUKS_WRAPPED_TEST_COMMON_H
#define HUKS_WRAPPED_TEST_COMMON_H

#include "huks_three_stage_test_common.h"

namespace Unittest::ImportWrapped
{
struct HksImportWrappedKeyTestParams {
    struct OH_Huks_Blob *wrappingKeyAlias;
    struct OH_Huks_Blob *agreeKeyAlgName;
    struct OH_Huks_ParamSet *genWrappingKeyParamSet;
    uint32_t publicKeySize;

    struct OH_Huks_Blob *callerKeyAlias;
    struct OH_Huks_ParamSet *genCallerKeyParamSet;

    struct OH_Huks_Blob *callerKekAlias;
    struct OH_Huks_Blob *callerKek;
    struct OH_Huks_ParamSet *importCallerKekParamSet;

    struct OH_Huks_Blob *callerAgreeKeyAlias;
    struct OH_Huks_ParamSet *agreeParamSet;

    struct OH_Huks_ParamSet *importWrappedKeyParamSet;
    struct OH_Huks_Blob *importedKeyAlias;
    struct OH_Huks_Blob *importedPlainKey;
    uint32_t keyMaterialLen;
};

static const uint32_t IV_SIZE = 16;
static uint8_t IV[IV_SIZE] = "bababababababab";

static const uint32_t AAD_SIZE = 16;
static uint8_t AAD[AAD_SIZE] = "abababababababa";

static const uint32_t NONCE_SIZE = 12;
static uint8_t NONCE[NONCE_SIZE] = "hahahahahah";

static const uint32_t AEAD_TAG_SIZE = 16;

static const uint32_t X25519_256_SIZE = 256;

void HksImportWrappedKeyTestCommonCase(const struct HksImportWrappedKeyTestParams *params);

void HksClearKeysForWrappedKeyTest(const struct HksImportWrappedKeyTestParams *params);
}  // namespace Unittest::ImportWrapped
#endif  // HUKS_WRAPPED_TEST_COMMON_H
