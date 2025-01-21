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

#ifndef HUKS_DERIVE_PBKDF_TEST_COMMON_H
#define HUKS_DERIVE_PBKDF_TEST_COMMON_H

#include <string>
#include "huks_three_stage_test_common.h"
namespace Unittest::Pbkdf2Derive {
static const std::string g_inData = "Hks_PBKDF2_Derive_Test_000000000000000000000000000000000000000000000000000000000"
                                    "00000000000000000000000000000000000000000000000000000000000000000000000000000000"
                                    "0000000000000000000000000000000000000000000000000000000000000000000000000_string";
static const uint32_t COMMON_SIZE = 2048;
static const uint32_t DERIVE_KEY_SIZE_32 = 32;
static const uint32_t DERIVE_KEY_SIZE_48 = 48;
static const uint32_t DERIVE_KEY_SIZE_64 = 64;
static const uint32_t DERIVE_ITERATION = 1000;

OH_Huks_Result HksPbkdf2DeriveTestNormalCase(const struct OH_Huks_Blob keyAlias, const struct OH_Huks_ParamSet *genParamSet,
    struct OH_Huks_ParamSet *deriveParamSet, struct OH_Huks_ParamSet *deriveFinalParamsSet);
OH_Huks_Result HksPbkdf2DeriveTestCmpCase(const struct OH_Huks_Blob keyAlias, const struct OH_Huks_ParamSet *genParamSet,
    struct OH_Huks_ParamSet *deriveParamSet, struct OH_Huks_ParamSet *deriveFinalParamsSet);
} // namespace Unittest::Pbkdf2Derive
#endif // HUKS_DERIVE_PBKDF2_TEST_COMMON_H