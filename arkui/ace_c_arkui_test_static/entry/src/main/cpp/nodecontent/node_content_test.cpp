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
#include "ani/ani.h"
#include "common/common.h"
#include <arkui/native_node_ani.h>
#define NUM__1 (-1)
#define NUM_1 1

namespace ArkUIAniTest {

static ani_double TestNodeContent001(ani_env* env, ani_object info)
{
    ani_object args = nullptr;
    ArkUI_ContextHandle context = nullptr;
    auto ret = OH_ArkUI_NativeModule_GetContextFromAniValue(env, args, &context);
    ASSERT_EQ(ret, INVALID_PARAM);
    
    NAPI_END;
}

static ani_double TestNodeContent002(ani_env* env, ani_object info)
{
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    auto ret = OH_ArkUI_NodeContent_AddNode(nullptr, nullptr);
    ASSERT_EQ(ret, INVALID_PARAM);
    
    NAPI_END;
}

static ani_double TestNodeContent003(ani_env* env, ani_object info)
{
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    auto ret = OH_ArkUI_NodeContent_InsertNode(nullptr, nullptr, NUM_1);
    ASSERT_EQ(ret, INVALID_PARAM);
    
    NAPI_END;
}

static ani_double TestNodeContent004(ani_env* env, ani_object info)
{
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    auto ret = OH_ArkUI_NodeContent_RemoveNode(nullptr, nullptr);
    ASSERT_EQ(ret, INVALID_PARAM);
    
    NAPI_END;
}

static ani_double TestNodeContent005(ani_env* env, ani_object info)
{
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    auto ret = OH_ArkUI_NodeContent_RegisterCallback(nullptr, nullptr);
    ASSERT_EQ(ret, INVALID_PARAM);
    
    NAPI_END;
}

static ani_double TestNodeContent006(ani_env* env, ani_object info)
{
    auto ret = OH_ArkUI_NodeContentEvent_GetEventType(nullptr);
    ASSERT_EQ(ret, NUM__1);
    
    NAPI_END;
}

static ani_double TestNodeContent007(ani_env* env, ani_object info)
{
    ani_object args = nullptr;
    ArkUI_ContextHandle context = nullptr;
    auto ret = OH_ArkUI_NativeModule_GetContextFromAniValue(env, args, &context);
    ASSERT_EQ(ret, INVALID_PARAM);
    
    NAPI_END;
}

} // namespace ArkUIAniTest
