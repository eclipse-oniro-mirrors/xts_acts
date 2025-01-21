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
#include <arkui/native_gesture.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_interface.h>
#include <arkui/native_type.h>
#include <arkui/native_node.h>
#include <ace/xcomponent/native_interface_xcomponent.h>

namespace ArkUICapiTest {

static napi_value native_001(napi_env env, napi_callback_info info)
{
    auto result = OH_ArkUI_GetContextByNode(nullptr);
    ASSERT_OBJ(result,nullptr);
    NAPI_END;
}
static napi_value native_002(napi_env env, napi_callback_info info)
{
    char buffer[50];
    constexpr int32_t SMALL_BUFFER_LEN = 1;
    constexpr int32_t INIT_VAL = -10;
    int32_t resLen = INIT_VAL;
    auto result = OH_ArkUI_GetNavigationId(nullptr,buffer,SMALL_BUFFER_LEN,&resLen);
    ASSERT_EQ(result, 401);
    NAPI_END;
}
static napi_value native_003(napi_env env, napi_callback_info info)
{
    char buffer[50];
    constexpr int32_t SMALL_BUFFER_LEN = 1;
    constexpr int32_t INIT_VAL = -10;
    int32_t resLen = INIT_VAL;
    auto result = OH_ArkUI_GetNavDestinationName(nullptr,buffer,SMALL_BUFFER_LEN,&resLen);
    ASSERT_EQ(result, 401);
    NAPI_END;
}
static napi_value native_005(napi_env env, napi_callback_info info)
{
    char buffer[50];
    constexpr int32_t SMALL_BUFFER_LEN = 1;
    constexpr int32_t INIT_VAL = -10;
    int32_t resLen = INIT_VAL;
    auto result1 = OH_ArkUI_GetNavStackLength(nullptr,nullptr);
    auto result = OH_ArkUI_GetNavDestinationNameByIndex(nullptr,10000,buffer,SMALL_BUFFER_LEN,&resLen);
    ASSERT_EQ(result, 401);
    NAPI_END;
}
static napi_value native_006(napi_env env, napi_callback_info info)
{
     char buffer[50];
    constexpr int32_t SMALL_BUFFER_LEN = 1;
    constexpr int32_t INIT_VAL = -10;
    int32_t resLen = INIT_VAL;
    auto result = OH_ArkUI_GetNavDestinationId(nullptr,buffer,SMALL_BUFFER_LEN,&resLen);
    ASSERT_EQ(result, 401);
    NAPI_END;
}
static napi_value native_007(napi_env env, napi_callback_info info)
{
    auto result = OH_ArkUI_GetNavDestinationState(nullptr,nullptr);
    ASSERT_EQ(result, 401);
    NAPI_END;
}

static napi_value native_008(napi_env env, napi_callback_info info)
{
    auto result = OH_ArkUI_GetNavDestinationIndex(nullptr,nullptr);
    ASSERT_EQ(result, 401);
    NAPI_END;
}

static napi_value native_009(napi_env env, napi_callback_info info)
{
    auto result = OH_ArkUI_GetNavDestinationParam(nullptr);
    ASSERT_OBJ(result, nullptr);
    NAPI_END;
}
static napi_value native_010(napi_env env, napi_callback_info info)
{
    auto result = OH_ArkUI_GetRouterPageIndex(nullptr,nullptr);
    ASSERT_EQ(result, 401);
    NAPI_END;
}

static napi_value native_011(napi_env env, napi_callback_info info)
{
    char buffer[50];
    constexpr int32_t SMALL_BUFFER_LEN = 1;
    constexpr int32_t INIT_VAL = -10;
    int32_t resLen = INIT_VAL;
    auto result = OH_ArkUI_GetRouterPageName(nullptr,buffer,SMALL_BUFFER_LEN,&resLen);
    ASSERT_EQ(result, 401);
    NAPI_END;
}
static napi_value native_012(napi_env env, napi_callback_info info)
{
    char buffer[50];
    constexpr int32_t SMALL_BUFFER_LEN = 1;
    constexpr int32_t INIT_VAL = -10;
    int32_t resLen = INIT_VAL;
    auto result = OH_ArkUI_GetRouterPagePath(nullptr,buffer,SMALL_BUFFER_LEN,&resLen);
    ASSERT_EQ(result, 401);
    NAPI_END;
}
static napi_value native_013(napi_env env, napi_callback_info info)
{
    auto result = OH_ArkUI_GetRouterPageState(nullptr,nullptr);
    ASSERT_EQ(result, 401);
    NAPI_END;
}
static napi_value native_014(napi_env env, napi_callback_info info)
{
    char buffer[50];
    constexpr int32_t SMALL_BUFFER_LEN = 1;
    constexpr int32_t INIT_VAL = -10;
    int32_t resLen = INIT_VAL;
    auto result = OH_ArkUI_GetRouterPageId(nullptr,buffer,SMALL_BUFFER_LEN,&resLen);
    ASSERT_EQ(result, 401);
    NAPI_END;
}

} 
