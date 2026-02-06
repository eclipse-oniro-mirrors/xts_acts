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

#ifndef HUKS_SIGNVERIFY_ECC_TEST_COMMON_H
#define HUKS_SIGNVERIFY_ECC_TEST_COMMON_H

#include <string>

#include "huks_three_stage_test_common.h"
namespace Unittest::EccSifnVerify
{
static const std::string g_inData =
    "Hks_ECC_Sign_Verify_Test_0000000000000000000000000000000000000000000000000000000"
    "00000000000000000000000000000000000000000000000000000000000000000000000000000000"
    "0000000000000000000000000000000000000000000000000000000000000000000000000_string";
static const uint32_t ECC_COMMON_SIZE = 1024;

OH_Huks_Result HksEccSignVerifyTestNormalCase(struct OH_Huks_Blob keyAlias, struct OH_Huks_ParamSet *genParamSet,
                                              struct OH_Huks_ParamSet *signParamSet,
                                              struct OH_Huks_ParamSet *verifyParamSet);
OH_Huks_Result HksTestSignVerify(struct OH_Huks_Blob *keyAlias, struct OH_Huks_ParamSet *paramSet,
                                 const struct OH_Huks_Blob *inData, struct OH_Huks_Blob *outData, bool isSign);
}  // namespace Unittest::EccSifnVerify
#endif  // HUKS_SIGNVERIFY_ECC_TEST_COMMON_H