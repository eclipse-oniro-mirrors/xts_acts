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
#include <arkui/native_node_napi.h>
#define NUM__1 (-1)
#define NUM_1 1

namespace ArkUICapiTest {

static napi_value TestNodeContent001(napi_env env, napi_callback_info info)
{
    napi_value args = nullptr;
    ArkUI_ContextHandle context = nullptr;
    auto ret = OH_ArkUI_GetContextFromNapiValue(env, args, &context);
    ASSERT_EQ(ret, INVALID_PARAM);
    
    NAPI_END;
}

static napi_value TestNodeContent002(napi_env env, napi_callback_info info)
{
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    auto ret = OH_ArkUI_NodeContent_AddNode(nullptr, nullptr);
    ASSERT_EQ(ret, INVALID_PARAM);
    
    NAPI_END;
}

static napi_value TestNodeContent003(napi_env env, napi_callback_info info)
{
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    auto ret = OH_ArkUI_NodeContent_InsertNode(nullptr, nullptr, NUM_1);
    ASSERT_EQ(ret, INVALID_PARAM);
    
    NAPI_END;
}

static napi_value TestNodeContent004(napi_env env, napi_callback_info info)
{
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    auto ret = OH_ArkUI_NodeContent_RemoveNode(nullptr, nullptr);
    ASSERT_EQ(ret, INVALID_PARAM);
    
    NAPI_END;
}

static napi_value TestNodeContent005(napi_env env, napi_callback_info info)
{
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    auto ret = OH_ArkUI_NodeContent_RegisterCallback(nullptr, nullptr);
    ASSERT_EQ(ret, INVALID_PARAM);
    
    NAPI_END;
}

static napi_value TestNodeContent006(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_NodeContentEvent_GetEventType(nullptr);
    ASSERT_EQ(ret, NUM__1);
    
    NAPI_END;
}

static napi_value TestNodeContent007(napi_env env, napi_callback_info info)
{
    napi_value args = nullptr;
    ArkUI_ContextHandle context = nullptr;
    auto ret = OH_ArkUI_GetContextFromNapiValue(env, args, &context);
    ASSERT_EQ(ret, INVALID_PARAM);
    
    NAPI_END;
}

} // namespace ArkUICapiTest
