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
#ifndef HUKSAPI_TEST_H
#define HUKSAPI_TEST_H

#include <napi/native_api.h>
#include "common/Common.h"
#include <huks/native_huks_api.h>
#include "huks/native_huks_param.h"


namespace HuksApiTest {
    const uint32_t IV_SIZE = 16;
    const uint8_t IV[IV_SIZE] = "bababababababab";
    const uint32_t AAD_SIZE = 16;
    const uint8_t AAD[AAD_SIZE] = "abababababababa";
    const uint32_t NONCE_SIZE = 12;
    const uint8_t NONCE[NONCE_SIZE] = "hahahahahah";
    const uint32_t AEAD_TAG_SIZE = 16;
    const uint32_t X25519_256_SIZE = 256;
    struct HksImportWrappedKeyTestParams {
        struct OH_Huks_Blob *wrappingKeyAlias;
        struct OH_Huks_Blob *agreeKeyAlgName;
        struct OH_Huks_ParamSet *genWrappingKeyParamSet;
        const uint32_t publicKeySize;
    
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
    struct HksTestCertChain {
        bool certChainExist;
        bool certCountValid;
        bool certDataExist;
        uint32_t certDataSize;
    };
    const uint32_t CERT_COUNT = 4;
    const uint32_t INVALID_Param = 0xFFFFFFFF;
    const uint32_t COMMON_SIZE = 2048;
    const uint32_t g_size = 4096;
    const uint32_t g_size1 = 65536;
    napi_value UserAuthTypeTest_001(napi_env env, napi_callback_info info);
    napi_value UserAuthTypeTest_002(napi_env env, napi_callback_info info);
    napi_value UserAuthTypeTest_003(napi_env env, napi_callback_info info);
    napi_value UserAuthTypeTest_004(napi_env env, napi_callback_info info);
    napi_value AuthAccessTypeTest_001(napi_env env, napi_callback_info info);
    napi_value AuthAccessTypeTest_002(napi_env env, napi_callback_info info);
    napi_value AuthAccessTypeTest_003(napi_env env, napi_callback_info info);
    napi_value UserAuthModeTest_001(napi_env env, napi_callback_info info);
    napi_value UserAuthModeTest_002(napi_env env, napi_callback_info info);
    napi_value TagTest_009(napi_env env, napi_callback_info info);
    napi_value TagTest_012(napi_env env, napi_callback_info info);
    napi_value TagTest_013(napi_env env, napi_callback_info info);
    napi_value TagTest_014(napi_env env, napi_callback_info info);
    napi_value TagTest_015(napi_env env, napi_callback_info info);
    napi_value TagTest_016(napi_env env, napi_callback_info info);
    napi_value TagTest_021(napi_env env, napi_callback_info info);
    napi_value TagTest_026(napi_env env, napi_callback_info info);
    napi_value ChallengeTypeTest_001(napi_env env, napi_callback_info info);
    napi_value ChallengeTypeTest_002(napi_env env, napi_callback_info info);
    napi_value ChallengeTypeTest_003(napi_env env, napi_callback_info info);
    napi_value ChallengePositionTest_001(napi_env env, napi_callback_info info);
    napi_value ChallengePositionTest_002(napi_env env, napi_callback_info info);
    napi_value ChallengePositionTest_003(napi_env env, napi_callback_info info);
    napi_value ChallengePositionTest_004(napi_env env, napi_callback_info info);
    napi_value SecureSignTypeTest_001(napi_env env, napi_callback_info info);
    napi_value TagTest_001(napi_env env, napi_callback_info info);
    napi_value TagTest_002(napi_env env, napi_callback_info info);
    napi_value TagTest_003(napi_env env, napi_callback_info info);
    napi_value TagTest_004(napi_env env, napi_callback_info info);
    napi_value TagTest_005(napi_env env, napi_callback_info info);
    napi_value TagTest_006(napi_env env, napi_callback_info info);
    napi_value TagTest_007(napi_env env, napi_callback_info info);
    napi_value TagTest_008(napi_env env, napi_callback_info info);
    napi_value TagTest_009(napi_env env, napi_callback_info info);
    napi_value TagTest_010(napi_env env, napi_callback_info info);
    napi_value TagTest_011(napi_env env, napi_callback_info info);
    napi_value TagTest_017(napi_env env, napi_callback_info info);
    napi_value TagTest_018(napi_env env, napi_callback_info info);
    napi_value TagTest_019(napi_env env, napi_callback_info info);
    napi_value TagTest_020(napi_env env, napi_callback_info info);
    napi_value TagTest_022(napi_env env, napi_callback_info info);
    napi_value TagTest_023(napi_env env, napi_callback_info info);
    napi_value TagTest_024(napi_env env, napi_callback_info info);
    napi_value TagTest_025(napi_env env, napi_callback_info info);
    napi_value TagTest_027(napi_env env, napi_callback_info info);
    napi_value TagTest_028(napi_env env, napi_callback_info info);
    napi_value TagTest_029(napi_env env, napi_callback_info info);
    napi_value TagTest_030(napi_env env, napi_callback_info info);
    napi_value TagTest_031(napi_env env, napi_callback_info info);
    napi_value TagTest_032(napi_env env, napi_callback_info info);
    napi_value TagTest_033(napi_env env, napi_callback_info info);
    napi_value TagTest_034(napi_env env, napi_callback_info info);
    napi_value TagTest_035(napi_env env, napi_callback_info info);
}

#endif // MINDSPORE_CONTEXT_TEST_H