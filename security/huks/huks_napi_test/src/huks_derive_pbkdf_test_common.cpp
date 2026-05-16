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

#include "huks_derive_pbkdf_test_common.h"

#include <gtest/gtest.h>

using namespace testing::ext;
namespace Unittest::Pbkdf2Derive
{
OH_Huks_Result HksPbkdf2DeriveTestNormalCase(const struct OH_Huks_Blob keyAlias,
                                             const struct OH_Huks_ParamSet *genParamSet,
                                             struct OH_Huks_ParamSet *deriveParamSet,
                                             struct OH_Huks_ParamSet *deriveFinalParamsSet)
{
    struct OH_Huks_Blob inData = {g_inData.length(), (uint8_t *)g_inData.c_str()};

    /* 1. Generate Key */
    // Generate Key
    OH_Huks_Result ret = OH_Huks_GenerateKeyItem(&keyAlias, genParamSet, nullptr);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "GenerateKey failed.";

    /* 2. Derive Three Stage */
    // Init
    uint8_t handleD[sizeof(uint64_t)] = {0};
    struct OH_Huks_Blob handleDerive = {sizeof(uint64_t), handleD};
    ret = OH_Huks_InitSession(&keyAlias, deriveParamSet, &handleDerive, nullptr);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "Init failed.";
    // Update
    uint8_t tmpOut[COMMON_SIZE] = {0};
    struct OH_Huks_Blob outData = {COMMON_SIZE, tmpOut};
    ret = OH_Huks_UpdateSession(&handleDerive, deriveParamSet, &inData, &outData);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "Update failed.";
    // Finish
    uint8_t outDataD[COMMON_SIZE] = {0};
    struct OH_Huks_Blob outDataDerive = {COMMON_SIZE, outDataD};
    ret = OH_Huks_FinishSession(&handleDerive, deriveFinalParamsSet, &inData, &outDataDerive);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "Finish failed.";

    return ret;
}

OH_Huks_Result HksPbkdf2DeriveTestCmpCase(const struct OH_Huks_Blob keyAlias,
                                          const struct OH_Huks_ParamSet *genParamSet,
                                          struct OH_Huks_ParamSet *deriveParamSet,
                                          struct OH_Huks_ParamSet *deriveFinalParamsSet)
{
    struct OH_Huks_Blob inData = {g_inData.length(), (uint8_t *)g_inData.c_str()};

    /* 1. Generate Key */
    // Generate Key
    OH_Huks_Result ret = OH_Huks_GenerateKeyItem(&keyAlias, genParamSet, nullptr);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "GenerateKey failed.";

    /* 2. Derive Three Stage */
    // Init
    uint8_t handleD[sizeof(uint64_t)] = {0};
    struct OH_Huks_Blob handleDerive = {sizeof(uint64_t), handleD};
    ret = OH_Huks_InitSession(&keyAlias, deriveParamSet, &handleDerive, nullptr);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "Init failed.";
    // Update
    uint8_t tmpOut[COMMON_SIZE] = {0};
    struct OH_Huks_Blob outData = {COMMON_SIZE, tmpOut};
    ret = OH_Huks_UpdateSession(&handleDerive, deriveParamSet, &inData, &outData);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "Update failed.";
    // Finish
    uint8_t outDataD[COMMON_SIZE] = {0};
    struct OH_Huks_Blob outDataDerive = {COMMON_SIZE, outDataD};
    ret = OH_Huks_FinishSession(&handleDerive, deriveFinalParamsSet, &inData, &outDataDerive);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "Finish failed.";

    return ret;
}
}  // namespace Unittest::Pbkdf2Derive