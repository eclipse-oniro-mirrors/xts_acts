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

#ifndef HUKS_CIPHER_SM4_TEST_COMMON_H
#define HUKS_CIPHER_SM4_TEST_COMMON_H

#include <string>

#include "huks_three_stage_test_common.h"

namespace Unittest::Sm4Cipher
{
static const uint32_t SM4_COMMON_SIZE = 256;
static const uint32_t IV_SIZE = 16;
static const uint32_t AAD_SIZE = 16;
static const uint32_t NONCE_SIZE = 12;
static const uint32_t AEAD_SIZE = 16;
static const uint32_t HKS_SM4_IV_SIZE = 16;

static uint8_t IV[IV_SIZE] = {0};
static uint8_t AAD[AAD_SIZE] = {0};
static uint8_t NONCE[NONCE_SIZE] = {0};
static uint8_t AEAD[AEAD_SIZE] = {0};

static const std::string g_inData =
    "Hks_SM4_Cipher_Test_000000000000000000000000000000000000000000000000000000000000"
    "00000000000000000000000000000000000000000000000000000000000000000000000000000000"
    "0000000000000000000000000000000000000000000000000000000000000000000000000_string";

struct FailureCaseParam {
    uint32_t id;
    int32_t result;
    struct OH_Huks_Param params[6];
};

OH_Huks_Result HksSm4CipherTestCaseOther(const struct OH_Huks_Blob *keyAlias, struct OH_Huks_ParamSet *genParamSet,
                                         struct OH_Huks_ParamSet *encryptParamSet,
                                         struct OH_Huks_ParamSet *decryptParamSet);
}  // namespace Unittest::Sm4Cipher
#endif  // HUKS_CIPHER_SM4_TEST_COMMON_H