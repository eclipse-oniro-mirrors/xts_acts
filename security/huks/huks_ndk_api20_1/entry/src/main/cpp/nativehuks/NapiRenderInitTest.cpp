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

namespace NativeHuksTest {
EXTERN_C_START
static void RenderInitPush0(napi_property_descriptor* desc)
{
    napi_property_descriptor descTemp[] = {
        {"UserAuthTypeTest_001", nullptr, HuksApiTest::UserAuthTypeTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"UserAuthTypeTest_002", nullptr, HuksApiTest::UserAuthTypeTest_002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"UserAuthTypeTest_003", nullptr, HuksApiTest::UserAuthTypeTest_003,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"UserAuthTypeTest_004", nullptr, HuksApiTest::UserAuthTypeTest_004,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AuthAccessTypeTest_001", nullptr, HuksApiTest::AuthAccessTypeTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AuthAccessTypeTest_002", nullptr, HuksApiTest::AuthAccessTypeTest_002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AuthAccessTypeTest_003", nullptr, HuksApiTest::AuthAccessTypeTest_003,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"UserAuthModeTest_001", nullptr, HuksApiTest::UserAuthModeTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"UserAuthModeTest_002", nullptr, HuksApiTest::UserAuthModeTest_002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TagTest_009", nullptr, HuksApiTest::TagTest_009, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TagTest_012", nullptr, HuksApiTest::TagTest_012, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TagTest_013", nullptr, HuksApiTest::TagTest_013, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TagTest_014", nullptr, HuksApiTest::TagTest_014, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TagTest_015", nullptr, HuksApiTest::TagTest_015, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TagTest_016", nullptr, HuksApiTest::TagTest_016, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TagTest_021", nullptr, HuksApiTest::TagTest_021, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TagTest_026", nullptr, HuksApiTest::TagTest_026, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ChallengeTypeTest_001", nullptr, HuksApiTest::ChallengeTypeTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ChallengeTypeTest_002", nullptr, HuksApiTest::ChallengeTypeTest_002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ChallengeTypeTest_003", nullptr, HuksApiTest::ChallengeTypeTest_003,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ChallengePositionTest_001", nullptr, HuksApiTest::ChallengePositionTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ChallengePositionTest_002", nullptr, HuksApiTest::ChallengePositionTest_002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ChallengePositionTest_003", nullptr, HuksApiTest::ChallengePositionTest_003,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ChallengePositionTest_004", nullptr, HuksApiTest::ChallengePositionTest_004,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SecureSignTypeTest_001", nullptr, HuksApiTest::SecureSignTypeTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    for (size_t index = 0; index < sizeof(descTemp) / sizeof(descTemp[0]); index++) {
        desc[index] = descTemp[index];
    }
}

static void RenderInitPush1(napi_property_descriptor* desc)
{
    const uint32_t offset = 25;
    napi_property_descriptor descTemp[] = {
        {"TagTest_001", nullptr, HuksApiTest::TagTest_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TagTest_002", nullptr, HuksApiTest::TagTest_002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TagTest_003", nullptr, HuksApiTest::TagTest_003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TagTest_004", nullptr, HuksApiTest::TagTest_004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TagTest_005", nullptr, HuksApiTest::TagTest_005, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TagTest_006", nullptr, HuksApiTest::TagTest_006, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TagTest_007", nullptr, HuksApiTest::TagTest_007, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TagTest_008", nullptr, HuksApiTest::TagTest_008, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TagTest_010", nullptr, HuksApiTest::TagTest_010, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TagTest_011", nullptr, HuksApiTest::TagTest_011, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TagTest_017", nullptr, HuksApiTest::TagTest_017, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TagTest_018", nullptr, HuksApiTest::TagTest_018, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TagTest_019", nullptr, HuksApiTest::TagTest_019, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TagTest_020", nullptr, HuksApiTest::TagTest_020, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TagTest_022", nullptr, HuksApiTest::TagTest_022, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TagTest_023", nullptr, HuksApiTest::TagTest_023, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TagTest_024", nullptr, HuksApiTest::TagTest_024, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TagTest_025", nullptr, HuksApiTest::TagTest_025, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TagTest_027", nullptr, HuksApiTest::TagTest_027, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TagTest_028", nullptr, HuksApiTest::TagTest_028, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TagTest_029", nullptr, HuksApiTest::TagTest_029, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TagTest_030", nullptr, HuksApiTest::TagTest_030, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TagTest_031", nullptr, HuksApiTest::TagTest_031, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TagTest_032", nullptr, HuksApiTest::TagTest_032, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TagTest_033", nullptr, HuksApiTest::TagTest_033, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TagTest_034", nullptr, HuksApiTest::TagTest_034, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TagTest_035", nullptr, HuksApiTest::TagTest_035, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    for (size_t index = 0; index < sizeof(descTemp) / sizeof(descTemp[0]); index++) {
        desc[index + offset] = descTemp[index];
    }
}

static napi_value RenderInit(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[100] = {};
    RenderInitPush0(desc);
    RenderInitPush1(desc);
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