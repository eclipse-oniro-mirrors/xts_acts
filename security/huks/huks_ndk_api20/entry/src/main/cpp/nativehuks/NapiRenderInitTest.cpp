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

#include "common/Common.h"
#include "nativehuks/HuksApiTest.h"
#include <nativehuks/OHHuksTest.h>
namespace NativeHuksTest {
EXTERN_C_START
static void RenderInitPush0(napi_property_descriptor* desc)
{
    napi_property_descriptor descTemp[] = {
        {"GetSdkVersionTest_001", nullptr, HuksApiTest::GetSdkVersionTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GenerateKeyItemTest_001", nullptr, HuksApiTest::GenerateKeyItemTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GenerateKeyItemTest_002", nullptr, HuksApiTest::GenerateKeyItemTest_002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GenerateKeyItemTest_003", nullptr, HuksApiTest::GenerateKeyItemTest_003,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GenerateKeyItemTest_004", nullptr, HuksApiTest::GenerateKeyItemTest_004,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GenerateKeyItemTest_005", nullptr, HuksApiTest::GenerateKeyItemTest_005,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ImportKeyItemTest_001", nullptr, HuksApiTest::ImportKeyItemTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ImportKeyItemTest_002", nullptr, HuksApiTest::ImportKeyItemTest_002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ImportKeyItemTest_003", nullptr, HuksApiTest::ImportKeyItemTest_003,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ImportKeyItemTest_004", nullptr, HuksApiTest::ImportKeyItemTest_004,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ImportWrappedKeyItemTest_001", nullptr, HuksApiTest::ImportWrappedKeyItemTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ImportWrappedKeyItemTest_002", nullptr, HuksApiTest::ImportWrappedKeyItemTest_002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ExportPublicKeyItemTest_001", nullptr, HuksApiTest::ExportPublicKeyItemTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ExportPublicKeyItemTest_002", nullptr, HuksApiTest::ExportPublicKeyItemTest_002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"DeleteKeyItemTest_001", nullptr, HuksApiTest::DeleteKeyItemTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"DeleteKeyItemTest_002", nullptr, HuksApiTest::DeleteKeyItemTest_002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetKeyItemParamSetTest_001", nullptr, HuksApiTest::GetKeyItemParamSetTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetKeyItemParamSetTest_002", nullptr, HuksApiTest::GetKeyItemParamSetTest_002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"IsKeyItemExistTest_001", nullptr, HuksApiTest::IsKeyItemExistTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"IsKeyItemExistTest_002", nullptr, HuksApiTest::IsKeyItemExistTest_002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    for (size_t index = 0; index < sizeof(descTemp) / sizeof(descTemp[0]); index++) {
        desc[index] = descTemp[index];
    }
}

static void RenderInitPush1(napi_property_descriptor* desc)
{
    const uint32_t offset = 20;
    napi_property_descriptor descTemp[] = {
        {"AttestKeyItemTest_001", nullptr, HuksApiTest::AttestKeyItemTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AttestKeyItemTest_002", nullptr, HuksApiTest::AttestKeyItemTest_002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AnonAttestKeyItemTest_001", nullptr, HuksApiTest::AnonAttestKeyItemTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AnonAttestKeyItemTest_002", nullptr, HuksApiTest::AnonAttestKeyItemTest_002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"InitSessionTest_001", nullptr, HuksApiTest::InitSessionTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"InitSessionTest_002", nullptr, HuksApiTest::InitSessionTest_002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"InitSessionTest_003", nullptr, HuksApiTest::InitSessionTest_003,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"UpdateSessionTest_001", nullptr, HuksApiTest::UpdateSessionTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"UpdateSessionTest_002", nullptr, HuksApiTest::UpdateSessionTest_002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"FinishSessionTest_001", nullptr, HuksApiTest::FinishSessionTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"FinishSessionTest_002", nullptr, HuksApiTest::FinishSessionTest_002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"FinishSessionTest_003", nullptr, HuksApiTest::FinishSessionTest_003,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AbortSessionTest_001", nullptr, HuksApiTest::AbortSessionTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ListAliasesTest_001", nullptr, HuksApiTest::ListAliasesTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"WrapKeyTest_003", nullptr, HuksApiTest::WrapKeyTest_003,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"WrapKeyTest_002", nullptr, HuksApiTest::WrapKeyTest_002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"UnwrapKeyTest_001", nullptr, HuksApiTest::UnwrapKeyTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    for (size_t index = 0; index < sizeof(descTemp) / sizeof(descTemp[0]); index++) {
        desc[index + offset] = descTemp[index];
    }
}

static void RenderInitPush2(napi_property_descriptor* desc)
{
    const uint32_t offset = 37;
    napi_property_descriptor descTemp[] = {
        {"InitParamSetTest_001", nullptr, HuksApiTest::InitParamSetTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AddParamsTest_001", nullptr, HuksApiTest::AddParamsTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"BuildParamSetTest_001", nullptr, HuksApiTest::BuildParamSetTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CopyParamSetTest_001", nullptr, HuksApiTest::CopyParamSetTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetParamTest_001", nullptr, HuksApiTest::GetParamTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"FreshParamSetTest_001", nullptr, HuksApiTest::FreshParamSetTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"IsParamSetTagValidTest_001", nullptr, HuksApiTest::IsParamSetTagValidTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"IsParamSetValidTest_001", nullptr, HuksApiTest::IsParamSetValidTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CheckParamMatchTest_001", nullptr, HuksApiTest::CheckParamMatchTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyPurposeTest_001", nullptr, HuksApiTest::KeyPurposeTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyPurposeTest_002", nullptr, HuksApiTest::KeyPurposeTest_002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyDigestTest_001", nullptr, HuksApiTest::KeyDigestTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyDigestTest_002", nullptr, HuksApiTest::KeyDigestTest_002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyDigestTest_003", nullptr, HuksApiTest::KeyDigestTest_003,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyDigestTest_004", nullptr, HuksApiTest::KeyDigestTest_004,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyPaddingTest_001", nullptr, HuksApiTest::KeyPaddingTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyPaddingTest_002", nullptr, HuksApiTest::KeyPaddingTest_002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyPaddingTest_003", nullptr, HuksApiTest::KeyPaddingTest_003,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyPaddingTest_004", nullptr, HuksApiTest::KeyPaddingTest_004,
            nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    for (size_t index = 0; index < sizeof(descTemp) / sizeof(descTemp[0]); index++) {
        desc[index + offset] = descTemp[index];
    }
}

static void RenderInitPush3(napi_property_descriptor* desc)
{
    const uint32_t offset = 56;
    napi_property_descriptor descTemp[] = {
        {"KeyPaddingTest_005", nullptr, HuksApiTest::KeyPaddingTest_005,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CipherModeTest_001", nullptr, HuksApiTest::CipherModeTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CipherModeTest_002", nullptr, HuksApiTest::CipherModeTest_002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CipherModeTest_003", nullptr, HuksApiTest::CipherModeTest_003,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CipherModeTest_004", nullptr, HuksApiTest::CipherModeTest_004,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CipherModeTest_005", nullptr, HuksApiTest::CipherModeTest_005,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeySizeTest_001", nullptr, HuksApiTest::KeySizeTest_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeySizeTest_002", nullptr, HuksApiTest::KeySizeTest_002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeySizeTest_003", nullptr, HuksApiTest::KeySizeTest_003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeySizeTest_004", nullptr, HuksApiTest::KeySizeTest_004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeySizeTest_005", nullptr, HuksApiTest::KeySizeTest_005, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeySizeTest_006", nullptr, HuksApiTest::KeySizeTest_006, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeySizeTest_007", nullptr, HuksApiTest::KeySizeTest_007, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeySizeTest_008", nullptr, HuksApiTest::KeySizeTest_008, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeySizeTest_009", nullptr, HuksApiTest::KeySizeTest_009, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeySizeTest_010", nullptr, HuksApiTest::KeySizeTest_010, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeySizeTest_011", nullptr, HuksApiTest::KeySizeTest_011, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeySizeTest_012", nullptr, HuksApiTest::KeySizeTest_012, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeySizeTest_013", nullptr, HuksApiTest::KeySizeTest_013, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeySizeTest_014", nullptr, HuksApiTest::KeySizeTest_014, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeySizeTest_015", nullptr, HuksApiTest::KeySizeTest_015, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeySizeTest_016", nullptr, HuksApiTest::KeySizeTest_016, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeySizeTest_017", nullptr, HuksApiTest::KeySizeTest_017, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeySizeTest_018", nullptr, HuksApiTest::KeySizeTest_018, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyAlgTest_001", nullptr, HuksApiTest::KeyAlgTest_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyAlgTest_002", nullptr, HuksApiTest::KeyAlgTest_002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyAlgTest_003", nullptr, HuksApiTest::KeyAlgTest_003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyAlgTest_004", nullptr, HuksApiTest::KeyAlgTest_004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyAlgTest_005", nullptr, HuksApiTest::KeyAlgTest_005, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyAlgTest_006", nullptr, HuksApiTest::KeyAlgTest_006, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyAlgTest_007", nullptr, HuksApiTest::KeyAlgTest_007, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyAlgTest_008", nullptr, HuksApiTest::KeyAlgTest_008, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyAlgTest_009", nullptr, HuksApiTest::KeyAlgTest_009, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyAlgTest_010", nullptr, HuksApiTest::KeyAlgTest_010, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyAlgTest_011", nullptr, HuksApiTest::KeyAlgTest_011, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    for (size_t index = 0; index < sizeof(descTemp) / sizeof(descTemp[0]); index++) {
        desc[index + offset] = descTemp[index];
    }
}

static void RenderInitPush4(napi_property_descriptor* desc)
{
    const uint32_t offset = 91;
    napi_property_descriptor descTemp[] = {
        {"AlgSuiteTest_001", nullptr, HuksApiTest::AlgSuiteTest_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyGenerateTypeTest_001", nullptr, HuksApiTest::KeyGenerateTypeTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyGenerateTypeTest_002", nullptr, HuksApiTest::KeyGenerateTypeTest_002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyFlagTypeTest_001", nullptr, HuksApiTest::KeyFlagTypeTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyFlagTypeTest_002", nullptr, HuksApiTest::KeyFlagTypeTest_002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyFlagTypeTest_003", nullptr, HuksApiTest::KeyFlagTypeTest_003,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyFlagTypeTest_004", nullptr, HuksApiTest::KeyFlagTypeTest_004,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyStorageTypeTest_001", nullptr, HuksApiTest::KeyStorageTypeTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyStorageTypeTest_002", nullptr, HuksApiTest::KeyStorageTypeTest_002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyStorageTypeTest_003", nullptr, HuksApiTest::KeyStorageTypeTest_003,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ImportKeyTypeTest_001", nullptr, HuksApiTest::ImportKeyTypeTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ImportKeyTypeTest_002", nullptr, HuksApiTest::ImportKeyTypeTest_002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ImportKeyTypeTest_003", nullptr, HuksApiTest::ImportKeyTypeTest_003,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RsaPssSaltLenTypeTest_001", nullptr, HuksApiTest::RsaPssSaltLenTypeTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RsaPssSaltLenTypeTest_002", nullptr, HuksApiTest::RsaPssSaltLenTypeTest_002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ErrCodeTest_001", nullptr, HuksApiTest::ErrCodeTest_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ErrCodeTest_002", nullptr, HuksApiTest::ErrCodeTest_002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ErrCodeTest_003", nullptr, HuksApiTest::ErrCodeTest_003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ErrCodeTest_004", nullptr, HuksApiTest::ErrCodeTest_004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ErrCodeTest_005", nullptr, HuksApiTest::ErrCodeTest_005, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ErrCodeTest_006", nullptr, HuksApiTest::ErrCodeTest_006, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    for (size_t index = 0; index < sizeof(descTemp) / sizeof(descTemp[0]); index++) {
        desc[index + offset] = descTemp[index];
    }
}

static void RenderInitPush5(napi_property_descriptor* desc)
{
    const uint32_t offset = 112;
    napi_property_descriptor descTemp[] = {
        {"AuthStorageLevelTest_001", nullptr, HuksApiTest::AuthStorageLevelTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AuthStorageLevelTest_002", nullptr, HuksApiTest::AuthStorageLevelTest_002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ErrCodeTest_007", nullptr, HuksApiTest::ErrCodeTest_007, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetOHHuksResult0100", nullptr, OHHuksStructTest::GetOHHuksResult0100,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetOHHuksResult0200", nullptr, OHHuksStructTest::GetOHHuksResult0200,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetOHHuksParamSet0100", nullptr, OHHuksStructTest::GetOHHuksParamSet0100,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetOHHuksParamSet0200", nullptr, OHHuksStructTest::GetOHHuksParamSet0200,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetOHHuksParam0100", nullptr, OHHuksStructTest::GetOHHuksParam0100,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetOHHuksParam0200", nullptr, OHHuksStructTest::GetOHHuksParam0200,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetOHHuksParam0300", nullptr, OHHuksStructTest::GetOHHuksParam0300,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetOHHuksParam0400", nullptr, OHHuksStructTest::GetOHHuksParam0400,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetOHHuksParam0500", nullptr, OHHuksStructTest::GetOHHuksParam0500,
            nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    for (size_t index = 0; index < sizeof(descTemp) / sizeof(descTemp[0]); index++) {
        desc[index + offset] = descTemp[index];
    }
}

static napi_value RenderInit(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[190] = {};
    RenderInitPush0(desc);
    RenderInitPush1(desc);
    RenderInitPush2(desc);
    RenderInitPush3(desc);
    RenderInitPush4(desc);
    RenderInitPush5(desc);
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module nativehuksndkModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = RenderInit,
    .nm_modname = "nativehuksndk",
    .nm_priv = ((void *)0),
    .reserved = {0}};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&nativehuksndkModule); }
}