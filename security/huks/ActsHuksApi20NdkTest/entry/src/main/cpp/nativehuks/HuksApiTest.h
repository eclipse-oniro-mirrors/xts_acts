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
    napi_value GetSdkVersionTest_001(napi_env env, napi_callback_info info);
    napi_value GenerateKeyItemTest_001(napi_env env, napi_callback_info info);
    napi_value GenerateKeyItemTest_002(napi_env env, napi_callback_info info);
    napi_value GenerateKeyItemTest_003(napi_env env, napi_callback_info info);
    napi_value GenerateKeyItemTest_004(napi_env env, napi_callback_info info);
    napi_value GenerateKeyItemTest_005(napi_env env, napi_callback_info info);
    napi_value ImportKeyItemTest_001(napi_env env, napi_callback_info info);
    napi_value ImportKeyItemTest_002(napi_env env, napi_callback_info info);
    napi_value ImportKeyItemTest_003(napi_env env, napi_callback_info info);
    napi_value ImportKeyItemTest_004(napi_env env, napi_callback_info info);
    napi_value ImportWrappedKeyItemTest_001(napi_env env, napi_callback_info info);
    napi_value ImportWrappedKeyItemTest_002(napi_env env, napi_callback_info info);
    napi_value ExportPublicKeyItemTest_001(napi_env env, napi_callback_info info);
    napi_value ExportPublicKeyItemTest_002(napi_env env, napi_callback_info info);
    napi_value DeleteKeyItemTest_001(napi_env env, napi_callback_info info);
    napi_value DeleteKeyItemTest_002(napi_env env, napi_callback_info info);
    napi_value GetKeyItemParamSetTest_001(napi_env env, napi_callback_info info);
    napi_value GetKeyItemParamSetTest_002(napi_env env, napi_callback_info info);
    napi_value IsKeyItemExistTest_001(napi_env env, napi_callback_info info);
    napi_value IsKeyItemExistTest_002(napi_env env, napi_callback_info info);
    napi_value AttestKeyItemTest_001(napi_env env, napi_callback_info info);
    napi_value AttestKeyItemTest_002(napi_env env, napi_callback_info info);
    napi_value AnonAttestKeyItemTest_001(napi_env env, napi_callback_info info);
    napi_value AnonAttestKeyItemTest_002(napi_env env, napi_callback_info info);
    napi_value InitSessionTest_001(napi_env env, napi_callback_info info);
    napi_value InitSessionTest_002(napi_env env, napi_callback_info info);
    napi_value InitSessionTest_003(napi_env env, napi_callback_info info);
    napi_value UpdateSessionTest_001(napi_env env, napi_callback_info info);
    napi_value UpdateSessionTest_002(napi_env env, napi_callback_info info);
    napi_value FinishSessionTest_001(napi_env env, napi_callback_info info);
    napi_value FinishSessionTest_002(napi_env env, napi_callback_info info);
    napi_value FinishSessionTest_003(napi_env env, napi_callback_info info);
    napi_value AbortSessionTest_001(napi_env env, napi_callback_info info);
    napi_value ListAliasesTest_001(napi_env env, napi_callback_info info);
    napi_value WrapKeyTest_002(napi_env env, napi_callback_info info);
    napi_value WrapKeyTest_003(napi_env env, napi_callback_info info);
    napi_value UnwrapKeyTest_001(napi_env env, napi_callback_info info);
    napi_value InitParamSetTest_001(napi_env env, napi_callback_info info);
    napi_value AddParamsTest_001(napi_env env, napi_callback_info info);
    napi_value BuildParamSetTest_001(napi_env env, napi_callback_info info);
    napi_value CopyParamSetTest_001(napi_env env, napi_callback_info info);
    napi_value GetParamTest_001(napi_env env, napi_callback_info info);
    napi_value FreshParamSetTest_001(napi_env env, napi_callback_info info);
    napi_value IsParamSetTagValidTest_001(napi_env env, napi_callback_info info);
    napi_value IsParamSetValidTest_001(napi_env env, napi_callback_info info);
    napi_value CheckParamMatchTest_001(napi_env env, napi_callback_info info);
    napi_value KeyPurposeTest_001(napi_env env, napi_callback_info info);
    napi_value KeyPurposeTest_002(napi_env env, napi_callback_info info);
    napi_value KeyDigestTest_001(napi_env env, napi_callback_info info);
    napi_value KeyDigestTest_002(napi_env env, napi_callback_info info);
    napi_value KeyDigestTest_003(napi_env env, napi_callback_info info);
    napi_value KeyDigestTest_004(napi_env env, napi_callback_info info);
    napi_value KeyPaddingTest_001(napi_env env, napi_callback_info info);
    napi_value KeyPaddingTest_002(napi_env env, napi_callback_info info);
    napi_value KeyPaddingTest_003(napi_env env, napi_callback_info info);
    napi_value KeyPaddingTest_004(napi_env env, napi_callback_info info);
    napi_value KeyPaddingTest_005(napi_env env, napi_callback_info info);
    napi_value CipherModeTest_001(napi_env env, napi_callback_info info);
    napi_value CipherModeTest_002(napi_env env, napi_callback_info info);
    napi_value CipherModeTest_003(napi_env env, napi_callback_info info);
    napi_value CipherModeTest_004(napi_env env, napi_callback_info info);
    napi_value CipherModeTest_005(napi_env env, napi_callback_info info);
    napi_value KeySizeTest_001(napi_env env, napi_callback_info info);
    napi_value KeySizeTest_002(napi_env env, napi_callback_info info);
    napi_value KeySizeTest_003(napi_env env, napi_callback_info info);
    napi_value KeySizeTest_004(napi_env env, napi_callback_info info);
    napi_value KeySizeTest_005(napi_env env, napi_callback_info info);
    napi_value KeySizeTest_006(napi_env env, napi_callback_info info);
    napi_value KeySizeTest_007(napi_env env, napi_callback_info info);
    napi_value KeySizeTest_008(napi_env env, napi_callback_info info);
    napi_value KeySizeTest_009(napi_env env, napi_callback_info info);
    napi_value KeySizeTest_010(napi_env env, napi_callback_info info);
    napi_value KeySizeTest_011(napi_env env, napi_callback_info info);
    napi_value KeySizeTest_012(napi_env env, napi_callback_info info);
    napi_value KeySizeTest_013(napi_env env, napi_callback_info info);
    napi_value KeySizeTest_014(napi_env env, napi_callback_info info);
    napi_value KeySizeTest_015(napi_env env, napi_callback_info info);
    napi_value KeySizeTest_016(napi_env env, napi_callback_info info);
    napi_value KeySizeTest_017(napi_env env, napi_callback_info info);
    napi_value KeySizeTest_018(napi_env env, napi_callback_info info);
    napi_value KeyAlgTest_001(napi_env env, napi_callback_info info);
    napi_value KeyAlgTest_002(napi_env env, napi_callback_info info);
    napi_value KeyAlgTest_003(napi_env env, napi_callback_info info);
    napi_value KeyAlgTest_004(napi_env env, napi_callback_info info);
    napi_value KeyAlgTest_005(napi_env env, napi_callback_info info);
    napi_value KeyAlgTest_006(napi_env env, napi_callback_info info);
    napi_value KeyAlgTest_007(napi_env env, napi_callback_info info);
    napi_value KeyAlgTest_008(napi_env env, napi_callback_info info);
    napi_value KeyAlgTest_009(napi_env env, napi_callback_info info);
    napi_value KeyAlgTest_010(napi_env env, napi_callback_info info);
    napi_value KeyAlgTest_011(napi_env env, napi_callback_info info);
    napi_value AlgSuiteTest_001(napi_env env, napi_callback_info info);
    napi_value KeyGenerateTypeTest_001(napi_env env, napi_callback_info info);
    napi_value KeyGenerateTypeTest_002(napi_env env, napi_callback_info info);
    napi_value KeyFlagTypeTest_001(napi_env env, napi_callback_info info);
    napi_value KeyFlagTypeTest_002(napi_env env, napi_callback_info info);
    napi_value KeyFlagTypeTest_003(napi_env env, napi_callback_info info);
    napi_value KeyFlagTypeTest_004(napi_env env, napi_callback_info info);
    napi_value KeyStorageTypeTest_001(napi_env env, napi_callback_info info);
    napi_value KeyStorageTypeTest_002(napi_env env, napi_callback_info info);
    napi_value KeyStorageTypeTest_003(napi_env env, napi_callback_info info);
    napi_value ImportKeyTypeTest_001(napi_env env, napi_callback_info info);
    napi_value ImportKeyTypeTest_002(napi_env env, napi_callback_info info);
    napi_value ImportKeyTypeTest_003(napi_env env, napi_callback_info info);
    napi_value RsaPssSaltLenTypeTest_001(napi_env env, napi_callback_info info);
    napi_value RsaPssSaltLenTypeTest_002(napi_env env, napi_callback_info info);
    napi_value ErrCodeTest_001(napi_env env, napi_callback_info info);
    napi_value ErrCodeTest_002(napi_env env, napi_callback_info info);
    napi_value ErrCodeTest_003(napi_env env, napi_callback_info info);
    napi_value ErrCodeTest_004(napi_env env, napi_callback_info info);
    napi_value ErrCodeTest_005(napi_env env, napi_callback_info info);
    napi_value ErrCodeTest_006(napi_env env, napi_callback_info info);
    napi_value ErrCodeTest_007(napi_env env, napi_callback_info info);
    napi_value AuthStorageLevelTest_001(napi_env env, napi_callback_info info);
    napi_value AuthStorageLevelTest_002(napi_env env, napi_callback_info info);

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