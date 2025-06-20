/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

#include "common/common.h"
#include <arkui/native_animate.h>

namespace ArkUICapiTest {

static napi_value testAnimation_001(napi_env env, napi_callback_info info)
{
    auto result = OH_ArkUI_AnimateOption_GetDuration(nullptr);
    ASSERT_EQ(result, 0);
    NAPI_END;
}

static napi_value testAnimation_002(napi_env env, napi_callback_info info)
{
    auto result = OH_ArkUI_AnimateOption_GetTempo(nullptr);
    ASSERT_EQ(result, 0);
    NAPI_END;
}

static napi_value testAnimation_003(napi_env env, napi_callback_info info)
{
    auto result = OH_ArkUI_AnimateOption_GetCurve(nullptr);
    ASSERT_EQ(result, -1);
    NAPI_END;
}

static napi_value testAnimation_004(napi_env env, napi_callback_info info)
{
    auto result = OH_ArkUI_AnimateOption_GetDelay(nullptr);
    ASSERT_EQ(result, 0);
    NAPI_END;
}

static napi_value testAnimation_005(napi_env env, napi_callback_info info)
{
    auto option = OH_ArkUI_AnimateOption_Create ();
    auto result = OH_ArkUI_AnimateOption_GetIterations(nullptr);
    ASSERT_EQ(result, 0);
    OH_ArkUI_AnimateOption_Dispose(option);
    NAPI_END;
}

} 
