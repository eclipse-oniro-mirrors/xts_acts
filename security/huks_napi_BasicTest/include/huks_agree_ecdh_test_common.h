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

#ifndef HUKS_AGREE_ECDH_TEST_COMMON_H
#define HUKS_AGREE_ECDH_TEST_COMMON_H

#include <string>
#include "huks_three_stage_test_common.h"
#include "native_huks_api.h"
#include "native_huks_param.h"
#include "native_huks_type.h"
namespace Unittest::EcdhAgree {
static const std::string g_inData = "Hks_ECDH_Agree_Test_000000000000000000000000000000000000000000000000000000000000"
                                    "00000000000000000000000000000000000000000000000000000000000000000000000000000000"
                                    "0000000000000000000000000000000000000000000000000000000000000000000000000_string";
static const uint32_t ECDH_COMMON_SIZE = 1024;

OH_Huks_Result HksEcdhAgreeFinish(const struct OH_Huks_Blob *keyAlias, const struct OH_Huks_Blob *publicKey,
    const struct OH_Huks_ParamSet *initParamSet, const struct OH_Huks_ParamSet *finishParamSet, struct OH_Huks_Blob *outData);
OH_Huks_Result HksEcdhAgreeAbort(const struct OH_Huks_Blob *keyAlias, const struct OH_Huks_Blob *publicKey,
    const struct OH_Huks_ParamSet *initParamSet);
OH_Huks_Result HksEcdhAgreeExport(const struct OH_Huks_Blob *keyAlias1, const struct OH_Huks_Blob *keyAlias2,
    struct OH_Huks_Blob *publicKey1, struct OH_Huks_Blob *publicKey2, const struct OH_Huks_ParamSet *genParamSet);
void HksEcdhAgreeFreeParamSet(struct OH_Huks_ParamSet *paramSet1, struct OH_Huks_ParamSet *paramSet2,
    struct OH_Huks_ParamSet *paramSet3);
void HksEcdhAgreeFreeParamSet(struct OH_Huks_ParamSet *paramSet1, struct OH_Huks_ParamSet *paramSet2,
    struct OH_Huks_ParamSet *paramSet3, struct OH_Huks_ParamSet *paramSet4, struct OH_Huks_ParamSet *paramSet5);
void HksEcdhAgreeFreeBlob(struct OH_Huks_Blob *blob1, struct OH_Huks_Blob *blob2);
void HksEcdhAgreeFreeBlob(struct OH_Huks_Blob *blob1, struct OH_Huks_Blob *blob2,
    struct OH_Huks_Blob *blob3, struct OH_Huks_Blob *blob4);
} // namespace Unittest::EcdhAgree
#endif // HUKS_AGREE_ECDH_TEST_COMMON_H